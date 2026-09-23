<?php

namespace App\Filament\Resources\Master\MasterBarangs\Schemas;

use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;

class MasterBarangForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Informasi Barang')
                    ->description(
                        'Kelola data barang yang menjadi standar penamaan dalam sistem Helpdesk.'
                    )
                    ->schema([
                        Select::make('kategori_barang_id')
                            ->label('Kategori Barang')
                            ->required()
                            ->searchable()
                            ->preload()
                            ->options(
                                fn(): array =>
                                    MasterKategoriBarang::query()
                                        ->active()
                                        ->orderBy('nama_kategori')
                                        ->pluck(
                                            'nama_kategori',
                                            'id'
                                        )
                                        ->toArray()
                            )
                            ->helperText(
                                'Hanya kategori aktif yang dapat digunakan untuk barang baru.'
                            ),

                        TextInput::make('nama_barang')
                            ->label('Nama Barang')
                            ->required()
                            ->maxLength(255)
                            ->unique(
                                table: 'master_barang',
                                column: 'nama_barang',
                                ignoreRecord: true,
                                modifyRuleUsing: function ($rule, $get) {
                                    return $rule
                                        ->whereNull('deleted_at')
                                        ->where(
                                            'kategori_barang_id',
                                            $get('kategori_barang_id')
                                        );
                                },
                            )
                            ->validationMessages([
                                'unique' =>
                                    'Nama barang sudah digunakan pada kategori tersebut.',
                            ])
                            ->placeholder(
                                'Contoh: SSD NVMe M.2 1TB'
                            )
                            ->helperText(
                                'Gunakan nama barang yang jelas dan konsisten.'
                            ),

                        Textarea::make('keterangan')
                            ->label('Keterangan')
                            ->rows(4)
                            ->maxLength(1000)
                            ->placeholder(
                                'Masukkan spesifikasi atau keterangan standar barang.'
                            )
                            ->columnSpanFull(),

                        Toggle::make('is_active')
                            ->label('Status Barang')
                            ->live()
                            ->onColor('success')
                            ->offColor('danger')
                            ->onIcon('heroicon-m-check-circle')
                            ->offIcon('heroicon-m-x-circle')
                            ->default(true)
                            ->helperText(
                                fn($state): string =>
                                    $state
                                    ? 'Aktif — barang dapat digunakan pada data baru.'
                                    : 'Tidak Aktif — barang tidak dapat digunakan pada data baru.'
                            ),
                    ])
                    ->columns(2),
            ]);
    }
}
