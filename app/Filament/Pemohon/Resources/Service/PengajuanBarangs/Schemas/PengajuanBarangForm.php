<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas;

use Filament\Schemas\Schema;

use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;

class PengajuanBarangForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextInput::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->disabled()
                    ->dehydrated(false),

                TextInput::make('user_id')
                    ->label('Pemohon')
                    ->default(auth()->user()->name)
                    ->disabled()
                    ->required(),

                TextInput::make('nama_barang')
                    ->required()
                    ->maxLength(255),

                TextInput::make('jumlah')
                    ->numeric()
                    ->default(1)
                    ->required(),

                Select::make('status')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Close' => 'Close',
                        // 'Close' => 'Rejected',
                    ])
                    ->default('Open')
                    ->required()
                    ->disabled(),

                Textarea::make('alasan')
                    ->rows(4)
                    ->required(),
            ]);

    }
}
