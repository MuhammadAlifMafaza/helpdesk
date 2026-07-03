<?php

namespace App\Filament\Resources\Laporan\LaporanKegiatans\Pages;

use App\Filament\Resources\Laporan\LaporanKegiatans\LaporanKegiatanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListLaporanKegiatans extends ListRecords
{
    protected static string $resource = LaporanKegiatanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
