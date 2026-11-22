<?php

namespace App\Filament\Widgets\Admin;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;
use Filament\Widgets\ChartWidget;
use Illuminate\Contracts\Support\Htmlable;

class AdminLayananTrendChart extends ChartWidget
{
    protected ?string $heading = 'Tren layanan masuk';

    protected ?string $description = 'Jumlah layanan yang dibuat per hari pada periode terpilih.';

    protected ?string $pollingInterval = null;

    protected ?string $maxHeight = '300px';

    protected int|string|array $columnSpan = [
        'default' => 'full',
        'xl' => 1,
    ];

    public ?string $filter = '30';

    protected function getFilters(): array
    {
        return ['7' => '7 hari terakhir', '30' => '30 hari terakhir', '90' => '90 hari terakhir'];
    }

    protected function getData(): array
    {
        $data = DashboardMetrics::trend(TiketPerbaikan::query(), PengajuanBarang::query(), (int) $this->filter);

        return [
            'labels' => $data['labels'],
            'datasets' => [
                ['label' => 'Perbaikan', 'data' => $data['perbaikan'], 'borderColor' => '#004B87', 'backgroundColor' => '#004B87', 'fill' => false, 'pointRadius' => 2],
                ['label' => 'Pengajuan barang', 'data' => $data['pengajuan'], 'borderColor' => '#B77900', 'backgroundColor' => '#B77900', 'borderDash' => [5, 3], 'fill' => false, 'pointRadius' => 2],
            ],
        ];
    }

    public function getDescription(): string|Htmlable|null
    {
        $data = $this->getCachedData();
        $total = array_sum(array_map(
            fn (array $dataset): int|float => array_sum($dataset['data'] ?? []),
            $data['datasets'] ?? [],
        ));

        return $total === 0
            ? 'Belum ada layanan pada periode ini.'
            : $this->description;
    }

    protected function getType(): string
    {
        return 'line';
    }

    protected function getOptions(): array
    {
        return ['plugins' => ['legend' => ['position' => 'bottom']], 'scales' => [
            'x' => ['grid' => ['display' => false], 'ticks' => ['maxTicksLimit' => 7]],
            'y' => ['beginAtZero' => true, 'ticks' => ['precision' => 0]],
        ]];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasAnyRole(['admin', 'super_admin']) ?? false;
    }
}
