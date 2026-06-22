<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages;

use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\LaporanPermintaanBarangResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListLaporanPermintaanBarangs extends ListRecords
{
    protected static string $resource = LaporanPermintaanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
