<?php

namespace App\Filament\Resources\KegiatanTeknisi\Pages;

use App\Filament\Resources\KegiatanTeknisi\KegiatanTeknisiResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewKegiatanTeknisi extends ViewRecord
{
    protected static string $resource = KegiatanTeknisiResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
