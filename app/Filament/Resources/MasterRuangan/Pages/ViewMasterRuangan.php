<?php

namespace App\Filament\Resources\MasterRuangan\Pages;

use App\Filament\Resources\MasterRuangan\MasterRuanganResource;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Resources\Pages\ViewRecord;

class ViewMasterRuangan extends ViewRecord
{
    protected static string $resource = MasterRuanganResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
            DeleteAction::make(),
        ];
    }
}
