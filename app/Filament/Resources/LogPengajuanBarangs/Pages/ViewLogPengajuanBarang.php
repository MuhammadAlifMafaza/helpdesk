<?php

namespace App\Filament\Resources\LogPengajuanBarangs\Pages;

use App\Filament\Resources\LogPengajuanBarangs\LogPengajuanBarangResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewLogPengajuanBarang extends ViewRecord
{
    protected static string $resource = LogPengajuanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }
}
