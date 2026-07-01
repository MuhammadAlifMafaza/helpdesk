<?php

namespace Tests\Unit;

use App\Models\Modules\Laporan\Models\LaporanPerbaikan;
use Tests\TestCase;

class LaporanPerbaikanModelTest extends TestCase
{
    public function test_laporan_perbaikan_model_uses_the_view_primary_key(): void
    {
        $model = new LaporanPerbaikan();

        $this->assertSame('no_tiket', $model->getKeyName());
    }
}
