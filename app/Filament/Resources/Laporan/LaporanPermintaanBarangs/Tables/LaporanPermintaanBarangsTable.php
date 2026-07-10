<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Tables;

use Filament\Actions\ViewAction;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\DatePicker;

class LaporanPermintaanBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table

            ->columns([
                TextColumn::make('rowIndex')
                    ->label('No')
                    ->rowIndex(),

                TextColumn::make('pengajuan.kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->searchable(['no_pengajuan']) // Sesuai kolom di DB
                    ->sortable()
                    ->weight('bold'),

                TextColumn::make('nama_pemohon')
                    ->label('Pemohon')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('nama_barang')
                    ->label('Barang')
                    ->searchable()
                    ->wrap(),

                // Menggunakan Helper dari Model yang baru kita buat
                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->formatStateUsing(fn($record) => $record->status_label)
                    ->color(fn($record) => $record->status_color)
                    ->icon(fn($record) => $record->status_icon),

                TextColumn::make('outcome')
                    ->label('Hasil Persetujuan')
                    ->badge()
                    ->formatStateUsing(fn($record) => $record->outcome_label)
                    ->color(fn($record) => $record->outcome_color),

                // 1. Kolom Waktu Mulai dengan deskripsi (misal: "2 hari yang lalu")
                TextColumn::make('pengajuan.waktu_mulai')
                    ->label('Waktu Mulai')
                    ->dateTime('d M Y, H:i')
                    ->description(fn($record) => $record->pengajuan?->waktu_mulai?->diffForHumans())
                    ->sortable()
                    ->toggleable(),

                // 2. Kolom Waktu Selesai
                TextColumn::make('pengajuan.waktu_selesai')
                    ->label('Waktu Selesai')
                    ->dateTime('d M Y, H:i')
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),

                // 3. Kolom Durasi dengan Deskripsi Penggunaan Jam & Kategori
                TextColumn::make('pengajuan.durasi_pengerjaan')
                    ->label('Durasi Pengerjaan')
                    // Menambahkan teks kecil di bawahnya: "Kategori: Cepat (≈ 2.5 Jam)"
                    ->description(function ($record) {
                        if (!$record->pengajuan?->waktu_selesai && $record->status === 'In Progress') {
                            return 'Sedang Dihitung...';
                        }

                        // Memanggil helper getDurasiJamAttribute() dari model LaporanPermintaanBarang
                        $jam = $record->durasi_jam > 0 ? " (≈ {$record->durasi_jam} Jam)" : '';

                        // Memanggil helper getProcessCategoryAttribute()
                        return "Kategori: {$record->process_category}" . $jam;
                    })
                    ->toggleable(),

            ])
            // 2. Definisikan Filter (Menggunakan Scope dari Model)
            ->filters([
                Filter::make('periode')
                    ->form([
                        DatePicker::make('dari_tanggal'),
                        DatePicker::make('sampai_tanggal'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->periode(
                            $data['dari_tanggal'] ?? null,
                            $data['sampai_tanggal'] ?? null
                        );
                    }),

                SelectFilter::make('status')
                    ->options([
                        'Open' => 'Menunggu Persetujuan',
                        'In Progress' => 'Sedang Diproses',
                        'Close' => 'Selesai',
                    ])
                    ->query(fn(Builder $query, array $data) => $query->status($data['value'])),
            ])
            ->actions([
                ViewAction::make(),
            ])
            ->bulkActions([]);
    }
}
