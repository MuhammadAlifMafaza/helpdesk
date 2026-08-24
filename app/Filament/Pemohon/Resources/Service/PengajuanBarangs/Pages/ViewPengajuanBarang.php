<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages;

use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

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
                ->color('edit')
                ->visible(
                    fn ($record): bool => $record->canPemohonEdit()
                ),
        ];
    }
}
