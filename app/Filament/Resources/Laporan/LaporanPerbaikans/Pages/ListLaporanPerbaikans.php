<?php

namespace App\Filament\Resources\Laporan\LaporanPerbaikans\Pages;

use App\Filament\Resources\Laporan\LaporanPerbaikans\LaporanPerbaikanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListLaporanPerbaikans extends ListRecords
{
    protected static string $resource = LaporanPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            // CreateAction::make(),
        ];
    }
}
