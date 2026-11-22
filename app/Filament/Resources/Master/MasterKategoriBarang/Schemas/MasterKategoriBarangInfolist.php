<?php

namespace App\Filament\Resources\Master\MasterKategoriBarang\Schemas;

use Filament\Infolists\Components\RepeatableEntry;
use Filament\Infolists\Components\TextEntry;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;

class MasterKategoriBarangInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Informasi Kategori Barang')
                    ->schema([
                        TextEntry::make('nama_kategori')
                            ->label('Nama Kategori')
                            ->weight('bold'),

                        TextEntry::make('is_active')
                            ->label('Status')
                            ->badge()
                            ->formatStateUsing(fn (bool $state): string => $state ? 'Aktif' : 'Tidak Aktif')
                            ->color(fn (bool $state): string => $state ? 'success' : 'gray'),

                        TextEntry::make('deskripsi')
                            ->label('Deskripsi')
                            ->placeholder('Tidak ada deskripsi.'),

                        TextEntry::make('jumlah_pengajuan_barang')
                            ->label('Jumlah Pengajuan')
                            ->formatStateUsing(fn (int $state): string => "{$state} pengajuan")
                            ->badge()
                            ->color('info'),

                        TextEntry::make('created_at')
                            ->label('Dibuat')
                            ->dateTime('d M Y H:i')
                            ->timezone('Asia/Jakarta'),

                        TextEntry::make('updated_at')
                            ->label('Terakhir Diperbarui')
                            ->dateTime('d M Y H:i')
                            ->timezone('Asia/Jakarta'),
                    ])
                    ->columnSpanFull()
                    ->columns(2),

                Section::make('Pengajuan Terkait')
                    ->description('Daftar pengajuan yang menggunakan kategori ini.')
                    ->schema([
                        RepeatableEntry::make('pengajuanBarang')
                            ->label('Daftar Pengajuan')
                            ->schema([
                                TextEntry::make('nama_barang')
                                    ->hiddenLabel()
                                    ->weight('bold'),

                                TextEntry::make('user.name')
                                    ->hiddenLabel()
                                    ->placeholder('Pemohon tidak tersedia')
                                    ->color('gray'),

                                TextEntry::make('status')
                                    ->hiddenLabel()
                                    ->badge(),
                            ])
                            ->columns(3)
                            ->contained(false)
                            ->columnSpanFull(),
                    ])
                    ->collapsible()
                    ->columnSpanFull(),
            ]);
    }
}
