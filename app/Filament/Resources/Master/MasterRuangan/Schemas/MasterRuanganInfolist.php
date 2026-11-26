<?php

namespace App\Filament\Resources\Master\MasterRuangan\Schemas;

use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class MasterRuanganInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->schema([
                Section::make('Informasi Ruangan')
                    ->columns(2)
                    ->schema([
                        TextEntry::make('nama_ruangan')
                            ->label('Nama Ruangan'),

                        TextEntry::make('nama_gedung')
                            ->label('Nama Gedung'),

                        TextEntry::make('is_active')
                            ->label('Status')
                            ->badge()
                            ->formatStateUsing(fn (bool $state): string => $state ? 'Aktif' : 'Diarsipkan')
                            ->color(fn (bool $state): string => $state ? 'success' : 'gray'),
                    ]),

                Section::make('Metadata')
                    ->columns(2)
                    ->schema([
                        TextEntry::make('created_at')
                            ->label('Dibuat')
                            ->dateTime('d M Y H:i')
                            ->timezone('Asia/Jakarta'),

                        TextEntry::make('updated_at')
                            ->label('Terakhir Diubah')
                            ->dateTime('d M Y H:i')
                            ->timezone('Asia/Jakarta'),
                    ]),
            ]);
    }
}
