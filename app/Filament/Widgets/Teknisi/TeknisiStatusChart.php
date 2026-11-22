<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\ChartWidget;
use Illuminate\Contracts\Support\Htmlable;

class TeknisiStatusChart extends ChartWidget
{
    protected ?string $heading = 'Status Pekerjaan Saya';

    protected ?string $description = 'Distribusi tiket yang pernah ditangani oleh teknisi.';

    protected ?string $pollingInterval = '60s';

    protected static bool $isLazy = true;

    protected ?string $maxHeight = '300px';

    protected static ?int $sort = 2;

    protected int|string|array $columnSpan = 1;

    protected function getData(): array
    {
        $userId = auth()->id();

        $query = TiketPerbaikan::query()->handledByTechnician($userId);
        $counts = DashboardMetrics::statusCounts($query);
        $statusValues = [
            $counts['Open'] ?? 0,
            $counts['In Progress'] ?? 0,
            $counts['Close'] ?? 0,
        ];
        $hasData = array_sum($statusValues) > 0;

        return [
            'datasets' => [
                [
                    'label' => 'Tiket Saya',

                    'data' => $hasData ? $statusValues : [1],

                    'backgroundColor' => $hasData ? [
                        '#F59E0B',
                        '#3B82F6',
                        '#10B981',
                    ] : ['#D1D5DB'],

                    'borderWidth' => 2,

                    'hoverOffset' => 3,
                ],
            ],

            'labels' => $hasData ? [
                'Menunggu',
                'Diproses',
                'Selesai',
            ] : ['Belum ada data'],
        ];
    }

    public function getDescription(): string|Htmlable|null
    {
        $data = $this->getCachedData();

        return ($data['labels'] ?? []) === ['Belum ada data']
            ? 'Belum ada riwayat pekerjaan.'
            : $this->description;
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
                    'enabled' => ($this->getCachedData()['labels'] ?? []) !== ['Belum ada data'],
                ],
            ],
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('teknisi') ?? false;
    }
}
