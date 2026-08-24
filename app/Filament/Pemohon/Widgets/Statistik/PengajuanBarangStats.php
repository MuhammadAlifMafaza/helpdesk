<?php

namespace App\Filament\Pemohon\Widgets\Statistik;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class PengajuanBarangStats extends StatsOverviewWidget
{
    protected ?string $heading = 'Pengajuan Barang';

    protected static ?int $sort = 2;

    protected int|string|array $columnSpan = 'full';

    protected function getStats(): array
    {
        $query = PengajuanBarang::query()
            ->where('user_id', auth()->id());

        return [
            Stat::make(
                'Total',
                PengajuanBarang::getTotalPengajuan($query)
            )
                ->description('Seluruh pengajuan barang Anda')
                ->icon('heroicon-o-clipboard-document-list'),

            Stat::make(
                'Open',
                PengajuanBarang::getTotalOpen($query)
            )
                ->description('Menunggu diproses')
                ->icon('heroicon-o-clock')
                ->color('info'),

            Stat::make(
                'In Progress',
                PengajuanBarang::getTotalInProgress($query)
            )
                ->description('Sedang diproses')
                ->icon('heroicon-o-arrow-path')
                ->color('warning'),

            Stat::make(
                'Close',
                PengajuanBarang::getTotalClose($query)
            )
                ->description('Pengajuan yang telah ditutup')
                ->icon('heroicon-o-check-circle')
                ->color('success'),
        ];
    }
}
