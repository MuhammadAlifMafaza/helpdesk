<?php

namespace App\Filament\Resources\Laporan\LaporanPerbaikans\Pages;

use App\Filament\Resources\Laporan\LaporanPerbaikans\LaporanPerbaikanResource;
use Filament\Resources\Pages\CreateRecord;

class CreateLaporanPerbaikan extends CreateRecord
{
    protected static bool $canCreateAnother = false;

    protected static string $resource = LaporanPerbaikanResource::class;
}
