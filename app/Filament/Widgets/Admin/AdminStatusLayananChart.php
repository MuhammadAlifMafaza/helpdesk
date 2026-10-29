<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\ChartWidget;

class AdminStatusLayananChart extends ChartWidget
{
    protected static bool $isLazy = true;

    protected ?string $heading = 'Status Layanan';

    protected ?string $description = 'Status terkini seluruh layanan, tidak mengikuti filter periode tren.';

    protected ?string $maxHeight = '300px';

    protected ?string $emptyStateHeading = 'Belum ada layanan';

    public function isEmpty(): bool
    {
        $data = $this->getCachedData();

        return array_sum($data['datasets'][0]['data']) + array_sum($data['datasets'][1]['data']) === 0;
    }

    protected ?string $pollingInterval = '60s';

    protected static ?int $sort = 3;

    protected int|string|array $columnSpan = 1;

    protected function getData(): array
    {
        $tiket = DashboardMetrics::statusCounts(TiketPerbaikan::query());
        $pengajuan = DashboardMetrics::statusCounts(PengajuanBarang::query());

        return [
            'datasets' => [
                [
                    'label' => 'Perbaikan',

                    'data' => [
                        $tiket['Open'] ?? 0,
                        $tiket['In Progress'] ?? 0,
                        $tiket['Close'] ?? 0,
                    ],

                    'backgroundColor' => '#004B87',
                    'borderColor' => '#004B87',
                    'borderWidth' => 1,

                    'borderRadius' => 4,

                    'barPercentage' => 0.75,
                    'categoryPercentage' => 0.70,
                ],

                [
                    'label' => 'Pengajuan Barang',

                    'data' => [
                        $pengajuan['Open'] ?? 0,
                        $pengajuan['In Progress'] ?? 0,
                        $pengajuan['Close'] ?? 0,
                    ],

                    'backgroundColor' => '#B77900',
                    'borderColor' => '#B77900',
                    'borderWidth' => 1,

                    'borderRadius' => 4,

                    'barPercentage' => 0.75,
                    'categoryPercentage' => 0.70,
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
        return 'bar';
    }

    protected function getOptions(): array
    {
        return [
            'responsive' => true,

            'maintainAspectRatio' => false,

            'interaction' => [
                'mode' => 'index',
                'intersect' => false,
            ],

            'plugins' => [
                'legend' => [
                    'position' => 'top',

                    'labels' => [
                        'usePointStyle' => true,
                        'pointStyle' => 'rectRounded',
                        'padding' => 18,
                    ],
                ],

                'tooltip' => [
                    'enabled' => true,
                ],
            ],

            'scales' => [
                'x' => [
                    'grid' => [
                        'display' => false,
                    ],
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

    public static function canView(): bool
    {
        return auth()->user()?->hasAnyRole([
            'admin',
            'super_admin',
        ]) ?? false;
    }
}
