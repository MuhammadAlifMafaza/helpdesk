<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas;

use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;

class PengajuanBarangForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->disabled()
                    ->dehydrated(false)
                    ->visibleOn(['edit', 'view']),

                TextInput::make('pemohon')
                    ->label('Pemohon')
                    ->default(
                        fn (): ?string => auth()->user()?->name
                    )
                    ->disabled()
                    ->dehydrated(false),

                TextInput::make('nama_barang')
                    ->label('Nama Barang')
                    ->required()
                    ->maxLength(255)
                    ->placeholder('Masukkan nama barang'),

                TextInput::make('jumlah')
                    ->label('Jumlah')
                    ->numeric()
                    ->integer()
                    ->minValue(1)
                    ->default(1)
                    ->required(),

                Textarea::make('alasan')
                    ->label('Alasan Pengajuan')
                    ->required()
                    ->rows(4)
                    ->maxLength(1000)
                    ->placeholder('Jelaskan alasan pengajuan barang'),
            ]);
    }
}