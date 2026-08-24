<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages;

use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Actions\DeleteAction;
use Filament\Actions\ViewAction;
use Filament\Resources\Pages\EditRecord;
use Illuminate\Database\Eloquent\Model;

class EditPengajuanBarang extends EditRecord
{
    protected static string $resource = PengajuanBarangResource::class;

    protected function handleRecordUpdate(
        Model $record,
        array $data
    ): Model {
        unset(
            $data['user_id'],
            $data['status'],
            $data['kode_pengajuan'],
            $data['pemohon'],
        );

        $record->updateDataPemohon($data);

        return $record->refresh();
    }

    protected function getHeaderActions(): array
    {
        return [
            ViewAction::make(),

            DeleteAction::make()
                ->label('Batalkan Permintaan')
                ->icon('heroicon-o-x-circle')
                ->color('danger')
                ->requiresConfirmation()
                ->visible(
                    fn (PengajuanBarang $record): bool => $record->canPemohonDelete()
                )
                ->modalHeading('Batalkan Pengajuan Barang')
                ->modalDescription(
                    'Pengajuan barang yang dibatalkan tidak akan ditampilkan lagi pada daftar pengajuan aktif.'
                )
                ->modalSubmitActionLabel('Ya, Batalkan')
                ->successNotificationTitle(
                    'Pengajuan barang berhasil dibatalkan'
                )
                ->before(
                    function (PengajuanBarang $record): void {
                        abort_unless(
                            $record->canPemohonDelete(),
                            403,
                            'Pengajuan barang tidak dapat dibatalkan pada status saat ini.'
                        );
                    }
                )
                ->using(
                    function (PengajuanBarang $record): bool {
                        return $record->cancelByPemohon();
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
            'Pengajuan barang tidak dapat diubah pada status saat ini.'
        );
    }
}
