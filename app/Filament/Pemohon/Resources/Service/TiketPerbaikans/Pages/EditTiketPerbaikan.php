<?php

namespace App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Resources\Pages\EditRecord;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;

class EditTiketPerbaikan extends EditRecord
{
    protected static string $resource = TiketPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),

            DeleteAction::make()
                ->label('Batalkan')
                ->icon('heroicon-o-x-circle')
                ->color('danger')
                ->requiresConfirmation()
                ->visible(
                    fn(TiketPerbaikan $record): bool =>
                    $record->canPemohonDelete()
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

                        if (!$record->canPemohonDelete()) {
                            abort(
                                403,
                                'Tiket tidak dapat dibatalkan pada status saat ini.'
                            );
                        }
                    }
                ),
        ];
    }

    protected function authorizeAccess(): void
    {
        parent::authorizeAccess();

        abort_unless(
            $this->record->canPemohonEdit(),
            403,
            'Tiket tidak dapat diubah pada status saat ini.'
        );
    }

}
