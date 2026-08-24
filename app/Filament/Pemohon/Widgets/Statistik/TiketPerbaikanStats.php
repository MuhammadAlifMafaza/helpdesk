<?php

namespace App\Filament\Pemohon\Widgets\Statistik;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TiketPerbaikanStats extends StatsOverviewWidget
{
    protected ?string $heading = 'Tiket Perbaikan';

    protected static ?int $sort = 1;

    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $query = TiketPerbaikan::query()
            ->where('user_id', auth()->id());

        return [
            Stat::make(
                'Total',
                TiketPerbaikan::getTotalTiket($query)
            )
                // ->label('Total Tiket')
                ->description('Seluruh tiket perbaikan Anda')
                ->icon('heroicon-o-wrench-screwdriver'),

            Stat::make(
                'Open',
                TiketPerbaikan::getTotalOpen($query)
            )
                // ->label('Tiket Menunggu Penanganan')
                ->description('Menunggu penanganan')
                ->icon('heroicon-o-clock')
                ->color('info'),

            Stat::make(
                'In Progress',
                TiketPerbaikan::getTotalInProgress($query)
            )
                // ->label('Sedang Ditangani')
                ->description('Sedang ditangani')
                ->icon('heroicon-o-arrow-path')
                ->color('warning'),

            Stat::make(
                'Close',
                TiketPerbaikan::getTotalClose($query)
            )
                // ->label('Tiket Ditutup')
                ->description('Tiket yang telah ditutup')
                ->icon('heroicon-o-check-circle')
                ->color('success'),
        ];
    }
}
