<?php

namespace App\Filament\Resources\PengajuanBarangs\Schemas;

use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
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
                    ->default(fn (): ?string => auth()->user()?->name)
                    ->afterStateHydrated(function (Set $set, ?PengajuanBarang $record): void {
                        if ($record?->user_id) {
                            $set('pemohon', $record->user?->name);
                        }
                    })
                    ->disabled()
                    ->dehydrated(false),

                Select::make('kategori_barang_id')
                    ->label('Kategori Barang')
                    ->options(function (?PengajuanBarang $record): array {
                        $query = MasterKategoriBarang::query()
                            ->withTrashed()
                            ->orderBy('nama_kategori');

                        if ($record?->kategori_barang_id) {
                            $currentKategoriId = $record->kategori_barang_id;

                            $query->where(function ($query) use ($currentKategoriId): void {
                                $query
                                    ->where(function ($query): void {
                                        $query
                                            ->where('is_active', true)
                                            ->whereNull('deleted_at');
                                    })
                                    ->orWhere($query->getModel()->getQualifiedKeyName(), $currentKategoriId);
                            });
                        } else {
                            $query
                                ->where('is_active', true)
                                ->whereNull('deleted_at');
                        }

                        return $query->pluck('nama_kategori', 'id')->all();
                    })
                    ->searchable()
                    ->preload()
                    ->native(false)
                    ->required()
                    ->helperText('Pilih kategori barang yang sesuai.'),

                TextInput::make('nama_barang')
                    ->label('Nama Barang')
                    ->required()
                    ->maxLength(255)
                    ->placeholder('Ketik nama barang yang diajukan.'),

                TextInput::make('jumlah')
                    ->label('Jumlah')
                    ->numeric()
                    ->integer()
                    ->minValue(1)
                    ->default(1)
                    ->required(),

                Textarea::make('spesifikasi_barang')
                    ->label('Spesifikasi Barang')
                    ->placeholder('Contoh: tipe/model, ukuran atau kapasitas, spesifikasi teknis, dan kompatibilitas yang dibutuhkan.')
                    ->helperText('Opsional. Isi spesifikasi atau kebutuhan teknis khusus sesuai barang yang dipilih.')
                    ->rows(4)
                    ->maxLength(2000),

                Textarea::make('alasan')
                    ->label('Alasan / Tujuan Pengajuan Barang')
                    ->required()
                    ->rows(4)
                    ->maxLength(1000)
                    ->placeholder('Jelaskan alasan pengajuan barang atau tujuan dari penggunaannya')
                    ->columnSpanFull(),

                Section::make('Contoh Barang')
                    ->description('Pilih salah satu cara untuk memberikan referensi barang.')
                    ->schema([
                        Select::make('jenis_contoh_barang')
                            ->label('Jenis Contoh Barang')
                            ->options([
                                'gambar' => 'Unggah gambar',
                                'tautan' => 'Masukkan tautan',
                            ])
                            ->placeholder('Pilih jenis contoh barang')
                            ->default(fn (?PengajuanBarang $record): ?string => filled($record?->contoh_barang_path)
                                ? 'gambar'
                                : (filled($record?->contoh_barang_url) ? 'tautan' : null))
                            ->live()
                            ->dehydrated(false)
                            ->afterStateUpdated(function (Set $set, ?string $state): void {
                                if ($state === 'gambar') {
                                    $set('contoh_barang_url', null);
                                } elseif ($state === 'tautan') {
                                    $set('contoh_barang_path', null);
                                } else {
                                    $set('contoh_barang_path', null);
                                    $set('contoh_barang_url', null);
                                }
                            }),

                        FileUpload::make('contoh_barang_path')
                            ->label('Gambar Contoh Barang')
                            ->image()
                            ->acceptedFileTypes(['image/jpeg', 'image/png', 'image/webp'])
                            ->maxSize(5120)
                            ->disk('public')
                            ->directory('pengajuan-barang/contoh')
                            ->visibility('public')
                            ->helperText('Format JPEG, PNG, atau WebP; ukuran maksimal 5 MB.')
                            ->visible(fn (Get $get): bool => $get('jenis_contoh_barang') === 'gambar')
                            ->afterStateUpdated(function (Set $set, mixed $state): void {
                                if (filled($state)) {
                                    $set('contoh_barang_url', null);
                                }
                            }),

                        TextInput::make('contoh_barang_url')
                            ->label('Tautan Contoh Barang')
                            ->url()
                            ->maxLength(2048)
                            ->placeholder('https://contoh-marketplace.com/produk')
                            ->helperText('Masukkan tautan produk dari marketplace atau e-commerce.')
                            ->live(onBlur: true)
                            ->visible(fn (Get $get): bool => $get('jenis_contoh_barang') === 'tautan')
                            ->afterStateUpdated(function (Set $set, ?string $state): void {
                                if (filled($state)) {
                                    $set('contoh_barang_path', null);
                                }
                            }),
                    ]),
            ]);
    }
}
