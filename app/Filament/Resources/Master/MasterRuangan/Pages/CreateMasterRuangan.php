<?php

namespace App\Filament\Resources\Master\MasterRuangan\Pages;

use App\Filament\Resources\Master\MasterRuangan\MasterRuanganResource;
use Filament\Resources\Pages\CreateRecord;

class CreateMasterRuangan extends CreateRecord
{
    protected static bool $canCreateAnother = false;

    protected static string $resource = MasterRuanganResource::class;
}
