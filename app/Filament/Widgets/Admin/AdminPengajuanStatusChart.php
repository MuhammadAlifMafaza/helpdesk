<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Widgets\ChartWidget;

class AdminPengajuanStatusChart extends ChartWidget
{
    protected ?string $heading = 'Status Pengajuan Barang';

    protected ?string $description = 'Distribusi status pengajuan barang saat ini.';

    protected ?string $pollingInterval = '60s';

    protected int|string|array $columnSpan = 1;

    protected static ?int $sort = 4;

    protected function getData(): array
    {
        return [
            'datasets' => [
                [
                    'label' => 'Pengajuan',
                    'data' => [
                        PengajuanBarang::query()
                            ->where('status', 'Open')
                            ->count(),

                        PengajuanBarang::query()
                            ->where('status', 'In Progress')
                            ->count(),

                        PengajuanBarang::query()
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
