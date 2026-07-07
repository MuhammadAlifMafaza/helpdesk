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

                TextColumn::make('tiket.kode_tiket')
                    ->label('Kode Tiket')
                    ->copyable()
                    ->searchable(
                        query: fn(
                        Builder $query,
                        string $search
                    ) => $query->searchTimeline($search)
                    )->weight('bold'),

                TextColumn::make('nama_pemohon')
                    ->label('Nama Pemohon')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('lokasi')
                    ->label('Lokasi')
                    ->searchable()
                    ->sortable()
                    ->wrap(),

                BadgeColumn::make('kepemilikan')
                    ->label('No Tiket')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('nama_teknisi')
                    ->label('Nama Teknisi')
                    ->sortable()
                    ->placeholder('Belum Ada Teknisi'),

                BadgeColumn::make('tiket.status')
                    ->color(fn($record) => $record->tiket->status_color),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Mulai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->sortable(),

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->placeholder('Masih dalam pengerjaan')
                    ->sortable(),

                TextColumn::make('durasi_pengerjaan_menit')
                    ->label('Durasi Pengerjaan')
                    ->dateTime('H:i:s')
                    ->timezone('Asia/Jakarta')
                    ->placeholder('')
                    ->sortable(),

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
