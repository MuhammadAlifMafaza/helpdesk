<?php

namespace App\Filament\Resources\Laporan\LaporanPerbaikans\Tables;

use App\Models\Modules\Laporan\Models\LaporanPerbaikan;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\BadgeColumn;

class LaporanPerbaikansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->defaultSort('waktu_mulai', 'desc')
            ->striped()

            ->columns([

                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex()
                    ->alignCenter(),

                TextColumn::make('kode_tiket')
                    ->label('Kode Tiket')
                    ->copyable()
                    ->weight('bold')
                    ->searchable(
                        query: fn(
                        Builder $query,
                        string $search
                    ) => $query->searchLaporan($search)
                    ),

                TextColumn::make('nama_pemohon')
                    ->label('Nama Pemohon')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('lokasi')
                    ->label('Lokasi')
                    ->searchable()
                    ->sortable()
                    ->wrap(),

                BadgeColumn::make('ownership_label')
                    ->label('Kepemilikan')
                    ->color(fn($record) => $record->ownership_color)->label('Kepemilikan Barang')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('nama_teknisi_label')
                    ->label('Nama Teknisi')
                    ->sortable(),

                BadgeColumn::make('status_label')
                    ->label('Status')
                    ->color(fn($record) => $record->status_color),

                BadgeColumn::make('service_category')
                    ->label('Kategori')
                    ->color(fn($record) => $record->service_category_color),

                TextColumn::make('tanggal_mulai')
                    ->label('Mulai')
                    ->placeholder('Tiket Masih Belum Dikerjakan')
                    ->description(
                        fn($record) => $record->Jam_mulai
                    ),

                TextColumn::make('tanggal_selesai')
                    ->label('Selesai')
                    ->placeholder('Masih Dikerjakan')
                    ->description(
                        fn($record) => $record->jam_selesai
                    ),

                TextColumn::make('durasi')
                    ->label('Durasi Pengerjaan')
                    ->timezone('Asia/Jakarta'),

            ])

            ->filters([
                //
            ])

            ->toolbarActions([
                // BulkActionGroup::make([
                //     DeleteBulkAction::make(),
                // ]),
            ]);
    }
}
