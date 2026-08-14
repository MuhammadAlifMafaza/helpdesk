<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages;

use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource;
use Filament\Actions\Action;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;
use Filament\Notifications\Notification;
use Filament\Forms\Components\Textarea;


class ViewPengajuanBarang extends ViewRecord
{
    protected static string $resource = PengajuanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make('edit')
                ->label('Edit Tiket')
                ->icon('heroicon-o-pencil')
                ->color('edit'),


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

}
