<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TeknisiOverview extends StatsOverviewWidget
{
    protected ?string $pollingInterval = '30s';

    protected static bool $isLazy = false;

    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $userId = auth()->id();

        /*
        |--------------------------------------------------------------------------
        | Tiket yang pernah diambil oleh teknisi
        |--------------------------------------------------------------------------
        */

        $tiketSaya = TiketPerbaikan::query()
            ->whereHas('logs', function ($query) use ($userId) {
                $query
                    ->where('user_id', $userId)
                    ->where('kategori_log', 'Status')
                    ->where('data_lama', 'Open')
                    ->where('data_baru', 'In Progress');
            });

        /*
        |--------------------------------------------------------------------------
        | Statistik status
        |--------------------------------------------------------------------------
        */

        $total = (clone $tiketSaya)->count();

        $inProgress = (clone $tiketSaya)
            ->where('status', 'In Progress')
            ->count();

        $selesai = (clone $tiketSaya)
            ->where('status', 'Close')
            ->count();

        /*
        |--------------------------------------------------------------------------
        | Rata-rata durasi
        |--------------------------------------------------------------------------
        */

        $averageDuration = TiketPerbaikan::getAverageDurationHuman(
            $tiketSaya
        );

        return [

            Stat::make(
                'Tiket Saya',
                number_format($total)
            )
                ->description(
                    'Tiket yang pernah saya tangani'
                )
                ->icon('heroicon-o-wrench-screwdriver')
                ->color('primary'),

            Stat::make(
                'Sedang Dikerjakan',
                number_format($inProgress)
            )
                ->description(
                    'Tiket yang masih dalam penanganan'
                )
                ->icon('heroicon-o-cog-6-tooth')
                ->color('warning'),

            Stat::make(
                'Selesai',
                number_format($selesai)
            )
                ->description(
                    'Tiket yang telah ditutup'
                )
                ->icon('heroicon-o-check-circle')
                ->color('success'),

            Stat::make(
                'Rata-rata Durasi',
                $averageDuration
            )
                ->description(
                    'Rata-rata waktu penyelesaian'
                )
                ->icon('heroicon-o-clock')
                ->color('info'),
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('teknisi') ?? false;
    }
}
