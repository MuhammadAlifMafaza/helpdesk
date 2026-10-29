<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\ChartWidget;

class TeknisiStatusChart extends ChartWidget
{
    protected ?string $heading = 'Status Pekerjaan Saya';

    protected ?string $description = 'Distribusi tiket yang pernah ditangani oleh teknisi.';

    protected ?string $pollingInterval = '60s';

    protected static bool $isLazy = true;

    protected ?string $maxHeight = '300px';

    protected ?string $emptyStateHeading = 'Belum ada riwayat pekerjaan';

    public function isEmpty(): bool
    {
        return array_sum($this->getCachedData()['datasets'][0]['data']) === 0;
    }

    protected static ?int $sort = 2;

    protected int|string|array $columnSpan = 1;

    protected function getData(): array
    {
        $userId = auth()->id();

        $query = TiketPerbaikan::query()->handledByTechnician($userId);
        $counts = DashboardMetrics::statusCounts($query);

        return [
            'datasets' => [
                [
                    'label' => 'Tiket Saya',

                    'data' => [
                        $counts['Open'] ?? 0,
                        $counts['In Progress'] ?? 0,
                        $counts['Close'] ?? 0,
                    ],

                    'backgroundColor' => [
                        '#F59E0B',
                        '#3B82F6',
                        '#10B981',
                    ],

                    'borderWidth' => 2,

                    'hoverOffset' => 3,
                ],
            ],

            'labels' => [
                'Menunggu',
                'Diproses',
                'Selesai',
            ],
        ];
    }

    protected function getType(): string
    {
        return 'doughnut';
    }

    protected function getOptions(): array
    {
        return [
            'responsive' => true,

            'maintainAspectRatio' => false,

            'cutout' => '64%',

            'plugins' => [
                'legend' => [
                    'position' => 'bottom',

                    'labels' => [
                        'usePointStyle' => true,
                        'pointStyle' => 'circle',
                        'padding' => 16,
                    ],
                ],

                'tooltip' => [
                    'enabled' => true,
                ],
            ],
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('teknisi') ?? false;
    }
}
