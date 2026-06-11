<?php

namespace App\Filament\Resources\KegiatanTeknisi\Pages;

use App\Filament\Resources\KegiatanTeknisi\KegiatanTeknisiResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditKegiatanTeknisi extends EditRecord
{
    protected static string $resource = KegiatanTeknisiResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
