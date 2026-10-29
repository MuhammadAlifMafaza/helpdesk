<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TeknisiOverview extends StatsOverviewWidget
{
    protected ?string $pollingInterval = '60s';

    protected static bool $isLazy = false;

    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $userId = auth()->id();

        $tiketSaya = TiketPerbaikan::query()
            ->handledByTechnician($userId);

        $tiketAktif = TiketPerbaikan::query()
            ->currentlyHandledByTechnician($userId)
            ->where('status', 'In Progress');

        $tiketSelesai = (clone $tiketSaya)
            ->where('status', 'Close');

        $totalSaya = (clone $tiketSaya)->count();

        $totalAktif = (clone $tiketAktif)->count();

        $totalSelesai = (clone $tiketSelesai)->count();

        $averageDuration = DashboardMetrics::averageCompletedDuration(
            $tiketSelesai
        );

        return [

            Stat::make(
                'Tiket Saya',
                number_format($totalSaya)
            )
                ->description(
                    'Tiket yang pernah Anda tangani'
                )
                ->icon('heroicon-o-wrench-screwdriver')
                ->color('primary'),

            Stat::make(
                'Sedang Dikerjakan',
                number_format($totalAktif)
            )
                ->description(
                    'Tiket yang saat ini menjadi tanggung jawab Anda'
                )
                ->icon('heroicon-o-cog-6-tooth')
                ->color('warning'),

            Stat::make(
                'Selesai',
                number_format($totalSelesai)
            )
                ->description(
                    'Tiket dari riwayat penanganan yang kini selesai'
                )
                ->icon('heroicon-o-check-circle')
                ->color('success'),

            Stat::make(
                'Rata-rata Durasi Perbaikan',
                $averageDuration
            )
                ->description(
                    'Rata-rata waktu penyelesaian tiket'
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
