<?php

namespace App\Filament\Pemohon\Widgets\Statistik;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\StatsOverviewWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;

class TiketPerbaikanStats extends StatsOverviewWidget
{
    protected ?string $heading = 'Tiket perbaikan saya';

    protected ?string $description = 'Status terkini seluruh tiket milik Anda.';

    protected ?string $pollingInterval = '60s';

    protected int|string|array $columnSpan = 'full';

    protected static bool $isLazy = false;

    protected function getStats(): array
    {
        $counts = DashboardMetrics::statusCounts(TiketPerbaikan::query()->where('user_id', auth()->id()));

        return [
            Stat::make('Total tiket', number_format(array_sum($counts)))->color('primary'),
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
