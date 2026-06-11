<?php

namespace App\Filament\Resources\TicketServices\Pages;

use App\Filament\Resources\TicketServices\TicketServiceResource;
use App\Models\Modules\Perbaikan\models\TiketPerbaikan as TicketService;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;
use Filament\Notifications\Notification;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;
use Filament\Actions\Action;

class ViewTicketService extends ViewRecord
{
    protected static string $resource = TicketServiceResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make('edit'),
            Action::make('chat')
                ->label('Kirim Pesan')
                ->icon('heroicon-o-chat-bubble-left-right')
                ->color('primary')
                ->form([

                    Textarea::make('message')
                        ->label('Pesan')
                        ->required()

                ])
                ->action(function (TicketService $record, array $data) {

                    $record->sendMessage(
                        $data['message']
                    );

                    Notification::make()
                        ->success()
                        ->title(
                            'Pesan berhasil dikirim'
                        )
                        ->send();

                })
        ];
    }

    public function getTimelineProperty()
    {
        return $this->record
            ->timeline()
            ->get();
    }
}
