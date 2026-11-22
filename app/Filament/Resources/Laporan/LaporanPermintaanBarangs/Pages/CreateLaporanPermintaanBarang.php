<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages;

use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\LaporanPermintaanBarangResource;
use Filament\Resources\Pages\CreateRecord;

class CreateLaporanPermintaanBarang extends CreateRecord
{
    protected static bool $canCreateAnother = false;

    protected static string $resource = LaporanPermintaanBarangResource::class;
}
