<?php

namespace App\Filament\Resources\LogPengajuanBarangs\Pages;

use App\Filament\Resources\LogPengajuanBarangs\LogPengajuanBarangResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditLogPengajuanBarang extends EditRecord
{
    protected static string $resource = LogPengajuanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
