<?php

namespace App\Filament\Pemohon\Resources\TiketPerbaikans\Pages;

use App\Filament\Pemohon\Resources\TiketPerbaikans\TiketPerbaikanResource;
use Filament\Actions\CreateAction;
use Filament\Resources\Pages\ListRecords;

class ListTiketPerbaikans extends ListRecords
{
    protected static string $resource = TiketPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            CreateAction::make(),
        ];
    }
}
