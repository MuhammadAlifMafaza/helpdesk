<?php

namespace App\Filament\Resources\KegiatanTeknisi\Pages;

use App\Filament\Resources\KegiatanTeknisi\KegiatanTeknisiResource;
use Filament\Actions\EditAction;
use Filament\Resources\Pages\ViewRecord;

class ViewKegiatanTeknisi extends ViewRecord
{
    protected static string $resource = KegiatanTeknisiResource::class;

    protected function getHeaderActions(): array
    {
        return [
            EditAction::make(),
        ];
    }

    /**
     * Judul & breadcrumb: "Lihat Kegiatan Edi Purwanto 22 Okt 2026".
     * Format deterministik, tidak tergantung isi catatan.
     * translatedFormat() (bukan format()) agar nama bulan ikut locale "id".
     */
    public function getRecordTitle(): string
    {
        $record = $this->getRecord();
        $tanggal = $record->tanggal;
        $namaBulan = match ((int) $tanggal->format('n')) {
            1 => 'Jan',
            2 => 'Feb',
            3 => 'Mar',
            4 => 'Apr',
            5 => 'Mei',
            6 => 'Jun',
            7 => 'Jul',
            8 => 'Agu',
            9 => 'Sep',
            10 => 'Okt',
            11 => 'Nov',
            12 => 'Des',
        };

        return sprintf(
            'Kegiatan %s %s %s %s',
            $record->teknisi?->name,
            $tanggal->format('d'),
            $namaBulan,
            $tanggal->format('Y')
        );
    }
}
