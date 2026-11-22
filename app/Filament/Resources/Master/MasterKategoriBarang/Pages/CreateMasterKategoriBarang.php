<?php

namespace App\Filament\Resources\Master\MasterKategoriBarang\Pages;

use App\Filament\Resources\Master\MasterKategoriBarang\MasterKategoriBarangResource;
use Filament\Resources\Pages\CreateRecord;

class CreateMasterKategoriBarang extends CreateRecord
{
    protected static bool $canCreateAnother = false;

    protected static string $resource = MasterKategoriBarangResource::class;
}
