<?php

namespace App\Filament\Pemohon\Widgets\Statistik;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Services\DashboardMetrics;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class PengajuanBarangStats extends StatsOverviewWidget
{
    protected ?string $heading = 'Pengajuan barang saya';

    protected ?string $description = 'Status terkini seluruh pengajuan milik Anda.';

    protected ?string $pollingInterval = '60s';

    protected int|string|array $columnSpan = 'full';

    protected static bool $isLazy = false;

    protected function getStats(): array
    {
        $counts = DashboardMetrics::statusCounts(PengajuanBarang::query()->where('user_id', auth()->id()));

        return [
            Stat::make('Total pengajuan', number_format(array_sum($counts)))->color('primary'),
            Stat::make('Menunggu', number_format($counts['Open'] ?? 0))->color('warning'),
            Stat::make('Diproses', number_format($counts['In Progress'] ?? 0))->color('info'),
            Stat::make('Selesai', number_format($counts['Close'] ?? 0))->color('success'),
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('pemohon') ?? false;
    }
}
