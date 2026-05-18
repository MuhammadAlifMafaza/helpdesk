<?php

namespace App\Filament\Resources\TicketServices\Pages;

use App\Filament\Resources\TicketServices\TicketServiceResource;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;

class EditTicketService extends EditRecord
{
    protected static string $resource = TicketServiceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),
            DeleteAction::make(),
        ];
    }
}
