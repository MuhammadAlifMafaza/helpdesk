<?php

namespace App\Filament\Resources\TicketServices\Pages;

use App\Filament\Resources\TicketServices\TicketServiceResource;
use Filament\Resources\Pages\CreateRecord;

class CreateTicketService extends CreateRecord
{
    protected static string $resource = TicketServiceResource::class;
}
