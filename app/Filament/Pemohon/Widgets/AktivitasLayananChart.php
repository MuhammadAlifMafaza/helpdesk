<?php

namespace App\Filament\Pemohon\Widgets;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Widgets\ChartWidget;

class AktivitasLayananChart extends ChartWidget
{
    protected static bool $isLazy = false;

    protected ?string $heading = 'Aktivitas Layanan';

    protected static ?int $sort = 3;

    protected int|string|array $columnSpan = 'span';

    protected function getData(): array
    {
        $period = $this->filter ?? 'month';

        return match ($period) {
            'day' => $this->getDailyData(),
            'year' => $this->getYearlyData(),
            default => $this->getMonthlyData(),
        };
    }

    protected function getFilters(): ?array
    {
        return [
            'day' => 'Hari',
            'month' => 'Bulan',
            'year' => 'Tahun',
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }

    protected function getOptions(): array
    {
        return [
            'responsive' => true,

            'plugins' => [
                'legend' => [
                    'display' => true,
                    'position' => 'top',
                ],

                'tooltip' => [
                    'mode' => 'index',
                    'intersect' => false,
                ],
            ],

            'scales' => [
                'x' => [
                    'stacked' => false,
                ],

                'y' => [
                    'beginAtZero' => true,

                    'ticks' => [
                        'precision' => 0,
                    ],
                ],
            ],
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | Hari
    |--------------------------------------------------------------------------
    */
    protected function getDailyData(): array
    {
        $start = now()->startOfDay()->subDays(6);
        $end = now()->endOfDay();

        $labels = collect();

        for (
            $date = $start->copy();
            $date <= $end;
            $date->addDay()
        ) {
            $labels->push(
                $date->format('d M')
            );
        }

        $tiket = TiketPerbaikan::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'DATE(created_at) as tanggal,
                 COUNT(*) as total'
            )
            ->groupBy('tanggal')
            ->pluck('total', 'tanggal');

        $pengajuan = PengajuanBarang::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'DATE(created_at) as tanggal,
                 COUNT(*) as total'
            )
            ->groupBy('tanggal')
            ->pluck('total', 'tanggal');

        $tiketData = [];
        $pengajuanData = [];

        for (
            $date = $start->copy();
            $date <= $end;
            $date->addDay()
        ) {
            $key = $date->format('Y-m-d');

            $tiketData[] = (int) (
                $tiket[$key] ?? 0
            );

            $pengajuanData[] = (int) (
                $pengajuan[$key] ?? 0
            );
        }

        return [
            'datasets' => [
                [
                    'label' => 'Tiket Perbaikan',
                    'data' => $tiketData,

                    'backgroundColor' => '#3B82F6',
                    'borderColor' => '#2563EB',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],

                [
                    'label' => 'Pengajuan Barang',
                    'data' => $pengajuanData,

                    // Pengajuan Barang
                    'backgroundColor' => '#F59E0B',
                    'borderColor' => '#D97706',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],
            ],

            'labels' => $labels->toArray(),
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | Bulan
    |--------------------------------------------------------------------------
    */
    protected function getMonthlyData(): array
    {
        $start = now()->startOfMonth()->subMonths(11);
        $end = now()->endOfMonth();

        $labels = [];
        $periods = [];

        for (
            $date = $start->copy();
            $date <= $end;
            $date->addMonth()
        ) {
            $periods[] = $date->copy();
            $labels[] = $date->translatedFormat('M Y');
        }

        $tiket = TiketPerbaikan::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'YEAR(created_at) as tahun,
                 MONTH(created_at) as bulan,
                 COUNT(*) as total'
            )
            ->groupBy('tahun', 'bulan')
            ->get()
            ->keyBy(
                fn ($item) => sprintf(
                    '%04d-%02d',
                    $item->tahun,
                    $item->bulan
                )
            );

        $pengajuan = PengajuanBarang::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'YEAR(created_at) as tahun,
                 MONTH(created_at) as bulan,
                 COUNT(*) as total'
            )
            ->groupBy('tahun', 'bulan')
            ->get()
            ->keyBy(
                fn ($item) => sprintf(
                    '%04d-%02d',
                    $item->tahun,
                    $item->bulan
                )
            );

        $tiketData = [];
        $pengajuanData = [];

        foreach ($periods as $date) {
            $key = $date->format('Y-m');

            $tiketData[] = (int) (
                $tiket[$key]->total ?? 0
            );

            $pengajuanData[] = (int) (
                $pengajuan[$key]->total ?? 0
            );
        }

        return [
            'datasets' => [
                [
                    'label' => 'Tiket Perbaikan',
                    'data' => $tiketData,

                    'backgroundColor' => '#3B82F6',
                    'borderColor' => '#2563EB',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],

                [
                    'label' => 'Pengajuan Barang',
                    'data' => $pengajuanData,

                    'backgroundColor' => '#F59E0B',
                    'borderColor' => '#D97706',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],
            ],
            'labels' => $labels,
        ];
    }

    /*
    |--------------------------------------------------------------------------
    | Tahun
    |--------------------------------------------------------------------------
    */
    protected function getYearlyData(): array
    {
        $start = now()->startOfYear()->subYears(4);
        $end = now()->endOfYear();

        $labels = [];
        $years = [];

        for (
            $year = $start->copy();
            $year <= $end;
            $year->addYear()
        ) {
            $years[] = $year->year;
            $labels[] = (string) $year->year;
        }

        $tiket = TiketPerbaikan::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'YEAR(created_at) as tahun,
                 COUNT(*) as total'
            )
            ->groupBy('tahun')
            ->pluck('total', 'tahun');

        $pengajuan = PengajuanBarang::query()
            ->where('user_id', auth()->id())
            ->whereBetween('created_at', [$start, $end])
            ->selectRaw(
                'YEAR(created_at) as tahun,
                 COUNT(*) as total'
            )
            ->groupBy('tahun')
            ->pluck('total', 'tahun');

        $tiketData = [];
        $pengajuanData = [];

        foreach ($years as $year) {
            $tiketData[] = (int) ($tiket[$year] ?? 0);
            $pengajuanData[] = (int) ($pengajuan[$year] ?? 0);
        }

        return [
            'datasets' => [
                [
                    'label' => 'Tiket Perbaikan',
                    'data' => $tiketData,

                    'backgroundColor' => '#3B82F6',
                    'borderColor' => '#2563EB',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],

                [
                    'label' => 'Pengajuan Barang',
                    'data' => $pengajuanData,

                    'backgroundColor' => '#F59E0B',
                    'borderColor' => '#D97706',
                    'borderWidth' => 1,
                    'borderRadius' => 6,

                    'barPercentage' => 0.7,
                    'categoryPercentage' => 0.8,
                ],
            ],
            'labels' => $labels,
        ];
    }
}
