<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class AdminOverview extends StatsOverviewWidget
{
    protected ?string $pollingInterval = '60s';

    protected ?string $description = 'Jumlah tiket dan pengajuan, beserta statusnya saat ini.';

    protected function getColumns(): array
    {
        return ['default' => 1, 'md' => 3];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasAnyRole(['admin', 'super_admin']) ?? false;
    }

    protected function getStats(): array
    {
        $tiket = DashboardMetrics::statusCounts(TiketPerbaikan::query());
        $pengajuan = DashboardMetrics::statusCounts(PengajuanBarang::query());

        return [
            Stat::make('Total layanan', number_format(array_sum($tiket) + array_sum($pengajuan)))
                ->description('Tiket: '.number_format(array_sum($tiket)).' · Pengajuan: '.number_format(array_sum($pengajuan)))->color('primary'),
            Stat::make('Tiket perbaikan', number_format(array_sum($tiket)))
                ->description('Menunggu: '.($tiket['Open'] ?? 0).' · Diproses: '.($tiket['In Progress'] ?? 0).' · Selesai: '.($tiket['Close'] ?? 0))->color('primary'),
            Stat::make('Pengajuan barang', number_format(array_sum($pengajuan)))
                ->description('Menunggu: '.($pengajuan['Open'] ?? 0).' · Diproses: '.($pengajuan['In Progress'] ?? 0).' · Selesai: '.($pengajuan['Close'] ?? 0))->color('primary'),
        ];
    }
}
