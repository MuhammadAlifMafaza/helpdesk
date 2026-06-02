<?php

namespace App\Filament\Resources\LogPengajuanBarangs\Pages;

use App\Filament\Resources\LogPengajuanBarangs\LogPengajuanBarangResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListLogPengajuanBarangs extends ListRecords
{
    protected static string $resource = LogPengajuanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
