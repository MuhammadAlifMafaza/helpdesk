<?php

namespace App\Filament\Pemohon\Resources\TiketPerbaikans\Pages;

use App\Filament\Pemohon\Resources\TiketPerbaikans\TiketPerbaikanResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditTiketPerbaikan extends EditRecord
{
    protected static string $resource = TiketPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
