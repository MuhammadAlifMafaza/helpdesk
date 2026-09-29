<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas;

use App\Models\Modules\Master\Barang\Models\MasterBarang;
use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Utilities\Get;
use Filament\Schemas\Components\Utilities\Set;
use Filament\Schemas\Schema;

class PengajuanBarangForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->schema([
                /*
                |--------------------------------------------------------------------------
                | Kode Pengajuan
                |--------------------------------------------------------------------------
                */

                TextInput::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->disabled()
                    ->dehydrated(false)
                    ->visibleOn(['edit', 'view']),

                /*
                |--------------------------------------------------------------------------
                | Pemohon
                |--------------------------------------------------------------------------
                */

                TextInput::make('pemohon')
                    ->label('Pemohon')
                    ->default(
                        fn (): ?string => auth()->user()?->name
                    )
                    ->afterStateHydrated(
                        function (Set $set, ?PengajuanBarang $record): void {
                            if (! $record?->user_id) {
                                return;
                            }

                            $set('pemohon', $record->user?->name);
                        }
                    )
                    ->disabled()
                    ->dehydrated(false),

                /*
                |--------------------------------------------------------------------------
                | Kategori Barang
                |--------------------------------------------------------------------------
                */

                Select::make('kategori_barang_id')
                    ->label('Kategori Barang')
                    ->options(
                        function (?PengajuanBarang $record): array {
                            $query = MasterKategoriBarang::query()
                                ->orderBy('nama_kategori');

                            /*
                             * Pengajuan baru:
                             * hanya kategori aktif.
                             *
                             * Pengajuan lama:
                             * kategori yang sedang digunakan tetap
                             * dapat ditampilkan agar data historis
                             * tidak rusak ketika kategori menjadi
                             * nonaktif.
                             */

                            if (
                                $record?->barang?->kategori_barang_id
                            ) {
                                $currentKategoriId =
                                    $record->barang->kategori_barang_id;

                                $query->where(function ($query) use ($currentKategoriId): void {
                                    $query
                                        ->where(function ($query): void {
                                            $query
                                                ->where('is_active', true)
                                                ->whereNull('deleted_at');
                                        })
                                        ->orWhere(
                                            $query->getModel()->getQualifiedKeyName(),
                                            $currentKategoriId
                                        );
                                });
                            } else {
                                $query
                                    ->where('is_active', true)
                                    ->whereNull('deleted_at');
                            }

                            return $query
                                ->pluck(
                                    'nama_kategori',
                                    'id'
                                )
                                ->toArray();
                        }
                    )
                    ->searchable()
                    ->preload()
                    ->native(false)
                    ->live()
                    ->required(
                        fn (
                            ?PengajuanBarang $record
                        ): bool => $record === null
                            || filled($record->barang_id)
                    )
                    ->dehydrated(false)
                    ->afterStateHydrated(
                        function (Set $set, ?PengajuanBarang $record): void {
                            if (! $record?->barang_id) {
                                return;
                            }

                            $set(
                                'kategori_barang_id',
                                $record->barang?->kategori_barang_id
                            );
                        }
                    )
                    ->afterStateUpdated(
                        function (Set $set): void {
                            /*
                             * Ketika kategori berubah, barang lama
                             * tidak boleh tetap terpilih.
                             */
                            $set('barang_id', null);

                            /*
                             * Keterangan barang juga harus
                             * mengikuti barang yang baru dipilih.
                             */
                            $set('spesifikasi_barang', null);
                        }
                    )
                    ->helperText(
                        'Pilih kategori barang yang sesuai.'
                    ),

                /*
                |--------------------------------------------------------------------------
                | Master Barang
                |--------------------------------------------------------------------------
                */

                Select::make('barang_id')
                    ->label('Nama Barang')
                    ->options(
                        function (Get $get, ?PengajuanBarang $record): array {
                            $kategoriId =
                                $get('kategori_barang_id');

                            if (! $kategoriId) {
                                return [];
                            }

                            $currentBarangId =
                                $record?->barang_id
                                ?: $get('barang_id');

                            return MasterBarang::query()
                                ->where(
                                    'kategori_barang_id',
                                    $kategoriId
                                )
                                ->where(
                                    function ($query) use ($currentBarangId): void {
                                        /*
                                         * Barang yang dapat dipilih
                                         * untuk transaksi baru.
                                         */
                                        $query->where(
                                            function ($query): void {
                                                $query
                                                    ->where(
                                                        'is_active',
                                                        true
                                                    )
                                                    ->whereNull(
                                                        'deleted_at'
                                                    )
                                                    ->whereHas(
                                                        'kategoriBarang',
                                                        function ($query): void {
                                                            $query
                                                                ->where(
                                                                    'is_active',
                                                                    true
                                                                )
                                                                ->whereNull(
                                                                    'deleted_at'
                                                                );
                                                        }
                                                    );
                                            }
                                        );

                                        /*
                                         * Jika sedang mengedit
                                         * transaksi lama, barang yang
                                         * sedang digunakan tetap
                                         * ditampilkan untuk menjaga
                                         * histori transaksi.
                                         */
                                        if ($currentBarangId) {
                                            $query->orWhere(
                                                $query->getModel()->getQualifiedKeyName(),
                                                $currentBarangId
                                            );
                                        }
                                    }
                                )
                                ->orderBy('nama_barang')
                                ->pluck(
                                    'nama_barang',
                                    'id'
                                )
                                ->toArray();
                        }
                    )
                    ->searchable()
                    ->preload()
                    ->native(false)
                    ->live()
                    ->required(
                        fn (
                            ?PengajuanBarang $record
                        ): bool => $record === null
                            || filled($record->barang_id)
                    )
                    ->disabled(
                        fn (
                            Get $get
                        ): bool => blank(
                            $get('kategori_barang_id')
                        )
                    )
                    ->afterStateHydrated(
                        function (Set $set, ?PengajuanBarang $record): void {
                            if (! $record) {
                                return;
                            }

                            $set(
                                'barang_id',
                                $record->barang_id
                            );

                            $set(
                                'spesifikasi_barang',
                                $record->spesifikasi_barang
                                ?: $record->barang?->keterangan
                            );
                        }
                    )
                    ->afterStateUpdated(
                        function (Set $set, ?int $state): void {
                            if (! $state) {
                                $set(
                                    'spesifikasi_barang',
                                    null
                                );

                                return;
                            }

                            $barang = MasterBarang::query()
                                ->withTrashed()
                                ->with('kategoriBarang')
                                ->find($state);

                            $set(
                                'spesifikasi_barang',
                                $barang?->keterangan
                            );
                        }
                    )
                    ->helperText(
                        'Nama barang dikelola melalui Master Barang.'
                    ),

                /*
                |--------------------------------------------------------------------------
                | Keterangan Barang
                |--------------------------------------------------------------------------
                */

                Textarea::make('spesifikasi_barang')
                    ->label('Keterangan Barang')
                    ->disabled()
                    ->dehydrated(false)
                    ->rows(3)
                    ->placeholder(
                        'Keterangan akan terisi otomatis dari Master Barang.'
                    )
                    ->columnSpanFull(),

                /*
                |--------------------------------------------------------------------------
                | Jumlah
                |--------------------------------------------------------------------------
                */

                TextInput::make('jumlah')
                    ->label('Jumlah')
                    ->numeric()
                    ->integer()
                    ->minValue(1)
                    ->default(1)
                    ->required(),

                /*
                |--------------------------------------------------------------------------
                | Alasan
                |--------------------------------------------------------------------------
                */

                Textarea::make('alasan')
                    ->label('Alasan Pengajuan')
                    ->required()
                    ->rows(4)
                    ->maxLength(1000)
                    ->placeholder(
                        'Jelaskan alasan pengajuan barang'
                    )
                    ->columnSpanFull(),
            ]);
    }
}
