<?php

namespace App\Filament\Pemohon\Widgets;

use App\Filament\Widgets\Admin\AdminLayananTrendChart;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Services\DashboardMetrics;

class AktivitasLayananChart extends AdminLayananTrendChart
{
    protected ?string $heading = 'Aktivitas layanan saya';

    protected int|string|array $columnSpan = 'full';

    protected function getData(): array
    {
        $data = DashboardMetrics::trend(
            TiketPerbaikan::query()->where('user_id', auth()->id()),
            PengajuanBarang::query()->where('user_id', auth()->id()),
            (int) $this->filter,
        );

        return [
            'labels' => $data['labels'],
            'datasets' => [
                ['label' => 'Perbaikan', 'data' => $data['perbaikan'], 'borderColor' => '#004B87', 'backgroundColor' => '#004B87', 'fill' => false, 'pointRadius' => 2],
                ['label' => 'Pengajuan barang', 'data' => $data['pengajuan'], 'borderColor' => '#B77900', 'backgroundColor' => '#B77900', 'borderDash' => [5, 3], 'fill' => false, 'pointRadius' => 2],
            ],
        ];
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('pemohon') ?? false;
    }
}
