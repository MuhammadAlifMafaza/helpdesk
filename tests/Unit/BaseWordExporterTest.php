<?php

namespace Tests\Unit;

use App\Services\Laporan\Word\BaseWordExporter;
use Tests\TestCase;

class BaseWordExporterTest extends TestCase
{
    public function test_constructor_initializes_builders_before_build(): void
    {
        $exporter = new class extends BaseWordExporter {
            protected function build(): void
            {
                $this->buildHeader('Test Header');
            }
        };

        $this->assertNotNull($exporter);
    }
}
