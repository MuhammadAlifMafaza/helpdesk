<?php

namespace App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewTiketPerbaikan extends ViewRecord
{
    protected static string $resource = TiketPerbaikanResource::class;

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
            /*
                            |--------------------------------------------------------------------------
                            | Edit
                            |--------------------------------------------------------------------------
                            */
            EditAction::make()
                ->label('Edit Tiket')
                ->icon('heroicon-o-pencil')
                ->color('edit')
                ->visible(
                    fn (TiketPerbaikan $record): bool => $record->canPemohonEdit()
                ),

            /*
            |--------------------------------------------------------------------------
            | Batalkan Tiket
            |--------------------------------------------------------------------------
            */
            DeleteAction::make()
                ->label('Batalkan')
                ->icon('heroicon-o-x-circle')
                ->color('danger')
                ->requiresConfirmation()
                ->visible(
                    fn (TiketPerbaikan $record): bool => $record->canPemohonDelete()
                )
                ->modalHeading('Batalkan Tiket')
                ->modalDescription(
                    'Tiket yang dibatalkan tidak akan ditampilkan lagi pada daftar tiket aktif.'
                )
                ->modalSubmitActionLabel('Ya, Batalkan')
                ->successNotificationTitle(
                    'Tiket berhasil dibatalkan'
                )
                ->before(
                    function (TiketPerbaikan $record): void {

                        if (! $record->canPemohonDelete()) {
                            abort(
                                403,
                                'Tiket tidak dapat dibatalkan pada status saat ini.'
                            );
                        }
                    }
                ),
        ];
    }
}
