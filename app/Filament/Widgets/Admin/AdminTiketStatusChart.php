<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Widgets\ChartWidget;

class AdminTiketStatusChart extends ChartWidget
{
    protected ?string $heading = 'Status Tiket Perbaikan';

    protected ?string $description = 'Distribusi status tiket perbaikan saat ini.';

    protected ?string $pollingInterval = '60s';

    protected int|string|array $columnSpan = 1;

    protected static ?int $sort = 3;

    protected function getData(): array
    {
        return [
            'datasets' => [
                [
                    'label' => 'Tiket',
                    'data' => [
                        TiketPerbaikan::query()
                            ->where('status', 'Open')
                            ->count(),

                        TiketPerbaikan::query()
                            ->where('status', 'In Progress')
                            ->count(),

                        TiketPerbaikan::query()
                            ->where('status', 'Close')
                            ->count(),
                    ],
                ],
            ],

            'labels' => [
                'Open',
                'In Progress',
                'Close',
            ],
        ];
    }

    protected function getType(): string
    {
        return 'doughnut';
    }
}
