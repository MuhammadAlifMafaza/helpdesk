<?php

namespace App\Filament\Resources\TicketServices\Pages;

use App\Filament\Resources\TicketServices\TicketServiceResource;
use Filament\Resources\Pages\CreateRecord;

class CreateTicketService extends CreateRecord
{
    protected static bool $canCreateAnother = false;

    protected static string $resource = TicketServiceResource::class;

    // protected function mutateFormDataBeforeCreate(array $data): array
    // {
    //     $data['user_id'] = auth()->id();

    //     return $data;
    // }
}
