<?php

namespace App\Services;

use Carbon\CarbonImmutable;
use Illuminate\Database\Eloquent\Builder;

class DashboardMetrics
{
    /** @return array<string, int> */
    public static function statusCounts(Builder $query): array
    {
        return (clone $query)->selectRaw('status, COUNT(*) as total')
            ->groupBy('status')->pluck('total', 'status')
            ->map(fn ($count): int => (int) $count)->all();
    }

    /** @return array{labels: array<int, string>, perbaikan: array<int, int>, pengajuan: array<int, int>} */
    public static function trend(Builder $perbaikan, Builder $pengajuan, int $days): array
    {
        $days = in_array($days, [7, 30, 90], true) ? $days : 30;
        $end = CarbonImmutable::now()->endOfDay();
        $start = $end->subDays($days - 1)->startOfDay();
        $series = [];

        foreach (['perbaikan' => $perbaikan, 'pengajuan' => $pengajuan] as $name => $query) {
            $series[$name] = (clone $query)->whereBetween('created_at', [$start, $end])
                ->selectRaw('DATE(created_at) as day, COUNT(*) as total')
                ->groupByRaw('DATE(created_at)')->pluck('total', 'day');
        }

        $result = ['labels' => [], 'perbaikan' => [], 'pengajuan' => []];
        for ($date = $start; $date <= $end; $date = $date->addDay()) {
            $result['labels'][] = $date->translatedFormat('d M');
            foreach ($series as $name => $counts) {
                $result[$name][] = (int) ($counts[$date->toDateString()] ?? 0);
            }
        }

        return $result;
    }

    public static function averageCompletedDuration(Builder $query): string
    {
        $records = (clone $query)->where('status', 'Close')->select('id')
            ->withMin(['logs as started_at' => fn (Builder $logs): Builder => $logs->where('kategori_log', 'Status')->where('data_baru', 'In Progress')], 'created_at')
            ->withMax(['logs as completed_at' => fn (Builder $logs): Builder => $logs->where('kategori_log', 'Status')->where('data_baru', 'Close')], 'created_at')
            ->cursor();

        $seconds = 0;
        $count = 0;
        foreach ($records as $record) {
            if (! $record->started_at || ! $record->completed_at) {
                continue;
            }
            $duration = CarbonImmutable::parse($record->started_at)->diffInSeconds(CarbonImmutable::parse($record->completed_at));
            if ($duration < 0) {
                continue;
            }
            $seconds += $duration;
            $count++;
        }

        return $count > 0 ? number_format($seconds / $count / 3600, 1, ',', '.').' jam' : 'Belum tersedia';
    }
}
