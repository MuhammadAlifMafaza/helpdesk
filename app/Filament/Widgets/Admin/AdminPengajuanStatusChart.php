<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Widgets\ChartWidget;
use Illuminate\Contracts\Support\Htmlable;

class AdminPengajuanStatusChart extends ChartWidget
{
    protected ?string $heading = 'Status Pengajuan Barang';

    protected ?string $description = 'Distribusi status pengajuan barang saat ini.';

    protected ?string $pollingInterval = '60s';

    protected static bool $isLazy = true;

    protected static ?int $sort = 5;

    protected int|string|array $columnSpan = 1;

    protected function getData(): array
    {
        $statusValues = [
            PengajuanBarang::query()->where('status', 'Open')->count(),
            PengajuanBarang::query()->where('status', 'In Progress')->count(),
            PengajuanBarang::query()->where('status', 'Close')->count(),
        ];
        $hasData = array_sum($statusValues) > 0;

        return [
            'datasets' => [
                [
                    'label' => 'Pengajuan Barang',

                    'data' => $hasData ? $statusValues : [1],

                    'backgroundColor' => $hasData ? [
                        '#3B82F6',
                        '#F59E0B',
                        '#10B981',
                    ] : ['#D1D5DB'],

                    'borderColor' => $hasData ? [
                        '#2563EB',
                        '#D97706',
                        '#059669',
                    ] : ['#9CA3AF'],

                    'borderWidth' => 2,

                    'hoverOffset' => 10,

                    'hoverBorderWidth' => 3,
                ],
            ],

            'labels' => $hasData ? [
                'Open',
                'In Progress',
                'Close',
            ] : ['Belum ada data'],
        ];
    }

    public function getDescription(): string|Htmlable|null
    {
        $data = $this->getCachedData();

        return ($data['labels'] ?? []) === ['Belum ada data']
            ? 'Belum ada pengajuan barang.'
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

            'interaction' => [
                'mode' => 'nearest',
                'intersect' => true,
            ],

            'animation' => [
                'animateRotate' => true,
                'animateScale' => true,
            ],

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

                    'displayColors' => true,
                ],
            ],
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasAnyRole([
            'admin',
            'admin_super',
            'super_admin',
        ]) ?? false;
    }
}
