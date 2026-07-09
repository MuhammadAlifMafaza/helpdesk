<?php

namespace Tests\Unit;

use App\Filament\Resources\Laporan\LaporanPerbaikans\Pages\ListLaporanPerbaikans;
use App\Filament\Resources\Laporan\LaporanPerbaikans\Widgets\LaporanPerbaikanStats;
use App\Models\Modules\Laporan\Models\LaporanPerbaikan;
use Tests\TestCase;

class LaporanPerbaikanPageTest extends TestCase
{
    public function test_list_page_registers_the_stats_widget_in_the_header(): void
    {
        $page = new ListLaporanPerbaikans();

        $method = new \ReflectionMethod(ListLaporanPerbaikans::class, 'getHeaderWidgets');
        $method->setAccessible(true);

        $this->assertSame([LaporanPerbaikanStats::class], $method->invoke($page));
    }

    public function test_widget_uses_the_model_average_duration_helper(): void
    {
        $widget = new LaporanPerbaikanStats();
        $method = new \ReflectionMethod(LaporanPerbaikanStats::class, 'getStats');
        $method->setAccessible(true);

        $stats = $method->invoke($widget);

        $this->assertCount(5, $stats);
        $this->assertSame('Rata-rata Durasi', $stats[4]->getLabel());
        $this->assertSame(LaporanPerbaikan::getAverageDuration(), $stats[4]->getValue());
    }
}
