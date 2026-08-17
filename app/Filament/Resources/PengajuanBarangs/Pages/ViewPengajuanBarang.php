<?php

namespace App\Filament\Resources\PengajuanBarangs\Pages;

use App\Filament\Resources\PengajuanBarangs\PengajuanBarangResource;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;
use Filament\Notifications\Notification;
use Filament\Forms\Components\Textarea;
use Filament\Actions\Action;

class ViewPengajuanBarang extends ViewRecord
{
    protected static string $resource = PengajuanBarangResource::class;

    public string $chatMessage = '';

    public function sendChatMessage(): void
    {
        $this->validate([
            'chatMessage' => [
                'required',
                'string',
                'max:2000',
            ],
        ]);

        $record = $this->record;

        /*
        |--------------------------------------------------------------------------
        | Authorization
        |--------------------------------------------------------------------------
        */

        abort_unless(
            $record->canBeAccessedBy(auth()->user()),
            403,
            'Anda tidak memiliki akses ke tiket ini.'
        );

        /*
        |--------------------------------------------------------------------------
        | Ticket Status
        |--------------------------------------------------------------------------
        */

        abort_if(
            $record->isClosed(),
            403,
            'Tiket telah ditutup.'
        );

        /*
        |--------------------------------------------------------------------------
        | Save Message
        |--------------------------------------------------------------------------
        */

        $record->sendMessage(
            trim($this->chatMessage)
        );

        /*
        |--------------------------------------------------------------------------
        | Reset
        |--------------------------------------------------------------------------
        */

        $this->chatMessage = '';

        /*
        |--------------------------------------------------------------------------
        | Refresh
        |--------------------------------------------------------------------------
        */

        $this->record->refresh();
    }

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make('edit')
                ->label('Edit Tiket')
                ->icon('heroicon-o-pencil')
                ->color('yellow'),


            Action::make('ambil_tiket')
                ->label('Ambil Tiket')
                ->icon('heroicon-o-wrench-screwdriver')
                ->visible(
                    fn($record) => $record->status === 'Open'
                )
                ->action(function ($record) {

                    $record->updateStatus(
                        'In Progress',
                        'Tiket mulai dikerjakan oleh '
                        . auth()->user()->name
                    );

                }),

            Action::make('selesai')
                ->label('Selesai')
                ->icon('heroicon-o-check-circle')
                ->color('success')
                ->visible(
                    fn($record) => $record->status === 'In Progress'
                )
                ->requiresConfirmation()
                ->form([
                    Textarea::make('catatan')
                        ->required(),
                ])
                ->action(function ($record, array $data) {

                    $record->closeAsCompleted(
                        $data['catatan']
                    );

                }),

            Action::make('tolak')
                ->label('Tolak')
                ->color('danger')
                ->icon('heroicon-o-x-circle')
                ->visible(
                    fn($record) => $record->status === 'In Progress'
                )
                ->requiresConfirmation()
                ->form([
                    Textarea::make('catatan')
                        ->required(),
                ])
                ->action(function ($record, array $data) {

                    $record->closeAsRejected(
                        $data['catatan']
                    );

                }),

            Action::make('reopen')
                ->label('Reopen Ticket')
                ->color('primary')
                ->icon('heroicon-o-arrow-path')
                ->visible(
                    fn($record) => $record->isClosed()
                )
                ->requiresConfirmation()
                ->form([
                    Textarea::make('catatan')
                        ->label('Alasan Reopen')
                        ->required(),
                ])
                ->action(function ($record, array $data) {

                    $record->reopen(
                        $data['catatan']
                    );

                }),
        ];
    }
}
