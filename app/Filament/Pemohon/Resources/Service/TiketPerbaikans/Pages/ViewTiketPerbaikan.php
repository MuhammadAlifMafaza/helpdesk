<?php

namespace App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewTiketPerbaikan extends ViewRecord
{
    protected static string $resource = TiketPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
