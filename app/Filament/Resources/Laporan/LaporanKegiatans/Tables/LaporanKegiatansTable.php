<?php

namespace App\Filament\Resources\Laporan\LaporanKegiatans\Tables;


use Filament\Actions\ViewAction;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Illuminate\Database\Eloquent\Builder;
use Filament\Forms\Components\DatePicker;
class LaporanKegiatansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('rowIndex')
                    ->label('No')
                    ->rowIndex(),

                TextColumn::make('tanggal_kegiatan')
                    ->label('Hari / Tanggal')
                    // Format bahasa Indonesia bawaan Carbon, misal: "Monday, 10 Jul 2026"
                    ->formatStateUsing(fn($state) => $state ? $state->locale('id')->translatedFormat('l, d F Y') : '-')
                    ->description(fn($record) => $record->tanggal_kegiatan?->diffForHumans())
                    ->sortable()
                    ->searchable(['tanggal']),

                TextColumn::make('nama_teknisi')
                    ->label('Nama Teknisi')
                    ->searchable()
                    ->sortable()
                    ->weight('bold')
                    ->color('primary'),

                TextColumn::make('deskripsi')
                    ->label('Deskripsi Kegiatan')
                    ->searchable(['deskripsi_kegiatan'])
                    ->wrap(),
            ])
            ->filters([
                // Filter berdasarkan rentang tanggal kegiatan
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
            ])
            ->actions([
                ViewAction::make(),
            ])
            ->bulkActions([]);
    }
}
