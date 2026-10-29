<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Perbaikan\Models\LogPerbaikan;
use Filament\Widgets\ChartWidget;

class TeknisiAktivitasChart extends ChartWidget
{
    protected ?string $heading = 'Aktivitas Pekerjaan';

    protected ?string $description = 'Jumlah aktivitas Anda selama 30 hari terakhir, bukan jumlah tiket unik.';

    protected ?string $pollingInterval = null;

    protected static bool $isLazy = true;

    protected ?string $maxHeight = '300px';

    protected ?string $emptyStateHeading = 'Belum ada aktivitas pada periode ini';

    public function isEmpty(): bool
    {
        return array_sum($this->getCachedData()['datasets'][0]['data']) === 0;
    }

    protected static ?int $sort = 3;

    protected int|string|array $columnSpan = 1;

    protected function getData(): array
    {
        $userId = auth()->id();

        $logs = LogPerbaikan::query()
            ->where('user_id', $userId)
            ->whereBetween('created_at', [now()->subDays(29)->startOfDay(), now()->endOfDay()]);

        return [
            'datasets' => [
                [
                    'label' => 'Aktivitas',

                    'data' => [
                        (clone $logs)->where('kategori_log', 'Status')
                            ->where('data_lama', 'Open')
                            ->where('data_baru', 'In Progress')
                            ->count(),

                        (clone $logs)->where('kategori_log', 'Update Data')
                            ->count(),

                        (clone $logs)->where('kategori_log', 'Chat')
                            ->count(),

                        (clone $logs)->where('kategori_log', 'Pending')
                            ->count(),

                        (clone $logs)->where('kategori_log', 'Status')->where('data_lama', 'In Progress')->where('data_baru', 'Close')->where('keterangan', 'like', '%[SELESAI]%')->count(),

                        (clone $logs)->where('kategori_log', 'Status')->where('data_lama', 'In Progress')->where('data_baru', 'Close')->where('keterangan', 'like', '%[DITOLAK]%')->count(),
                    ],

                    'backgroundColor' => [
                        '#004B87',
                        '#8B5CF6',
                        '#06B6D4',
                        '#F59E0B',
                        '#10B981',
                        '#EF4444',
                    ],

                    'borderRadius' => 5,
                ],
            ],

            'labels' => [
                'Ambil Tiket',
                'Update Data',
                'Chat',
                'Pending',
                'Selesai',
                'Ditolak',
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

            'plugins' => [
                'legend' => [
                    'display' => false,
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
        return auth()->user()?->hasRole('teknisi') ?? false;
    }
}
