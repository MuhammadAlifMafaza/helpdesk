<?php

namespace App\Filament\Resources\KegiatanTeknisi\Schemas;

use Filament\Forms\Components\DatePicker;
// Filament Action Imports
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;

class KegiatanTeknisiForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                DatePicker::make('tanggal')
                    ->label('Tanggal')
                    ->required()
                    ->default(now()),

                Select::make('ruangan_id')
                    ->label('Ruangan')
                    ->relationship(
                        'ruangan',
                        'nama_ruangan',
                        modifyQueryUsing: fn (Builder $query, ?Model $record): Builder => $query
                            ->where(fn (Builder $query): Builder => $query
                                ->where('is_active', true)
                                ->when($record?->ruangan_id, fn (Builder $query, int $roomId): Builder => $query->orWhereKey($roomId))),
                    )
                    ->searchable()
                    ->preload()
                    ->required(),

                Select::make('petugas')
                    ->label('Nama Petugas')
                    ->relationship(
                        'petugas',
                        'name',
                        fn (Builder $query) => $query->role(['teknisi', 'admin'])
                    )
                    ->multiple()
                    ->default([auth()->id()])
                    ->searchable()
                    ->preload()
                    ->nullable(),

                Textarea::make('deskripsi_kegiatan')
                    ->label('Catatan Kegiatan')
                    ->placeholder('Tuliskan catatan kegiatan teknisi di sini...')
                    ->rows(8)
                    ->required()
                    ->columnSpanFull(),

            ]);
    }
}
