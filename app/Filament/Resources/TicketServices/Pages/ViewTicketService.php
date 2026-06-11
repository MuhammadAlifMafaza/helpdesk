<?php

namespace App\Filament\Resources\TicketServices\Pages;

use App\Filament\Resources\TicketServices\TicketServiceResource;
use Filament\Resources\Pages\ViewRecord;

class ViewTicketService extends ViewRecord
{
    protected static string $resource = TicketServiceResource::class;

    protected function getHeaderActions(): array
    {
        return [];
    }

    public function getTimelineProperty()
    {
        return $this->record
            ->timeline()
            ->get();
    }
}
