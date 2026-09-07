<?php

namespace App\Filament\Resources\KegiatanTeknisi\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Schema;

class KegiatanTeknisiInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                TextEntry::make('teknisi.name')
                    ->label('Dibuat Oleh'),

                TextEntry::make('tanggal')
                    ->label('Tanggal')
                    ->date('d M Y'),

                TextEntry::make('ruangan.nama_ruangan')
                    ->label('Ruangan'),

                TextEntry::make('nama_petugas')
                    ->label('Petugas yang Mengerjakan')
                    ->placeholder('-')
                    ->columnSpanFull(),

                TextEntry::make('deskripsi_kegiatan')
                    ->label('Catatan Kegiatan')
                    ->prose()
                    ->columnSpanFull(),

                TextEntry::make('created_at')
                    ->label('Dibuat')
                    ->dateTime('d M Y H:i'),

                TextEntry::make('updated_at')
                    ->label('Terakhir Diubah')
                    ->dateTime('d M Y H:i'),

            ]);
    }
}
