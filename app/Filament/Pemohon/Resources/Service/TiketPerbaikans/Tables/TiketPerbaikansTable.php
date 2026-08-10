<?php

namespace App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;


class TiketPerbaikansTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->defaultSort('Created_at', 'desc')
            ->columns([
                TextColumn::make('index')
                    ->label('No')
                    ->rowIndex(),

                TextColumn::make('kode_tiket')
                    ->label('Kode Tiket')
                    ->searchable()
                    ->copyable()
                    ->weight('bold'),

                TextColumn::make('user.name')
                    ->label('Pemohon'),

                TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan'),

                TextColumn::make('keluhan')
                    ->label('Keluhan')
                    ->wrap()
                    ->searchable(),

                TextColumn::make('status')
                    ->badge()
                    ->icon(fn(string $state) => match ($state) {

                        'Open' => 'heroicon-o-exclamation-circle',

                        'In Progress' => 'heroicon-o-wrench-screwdriver',

                        'Close' => 'heroicon-o-check-badge',

                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn(string $state) => match ($state) {
                        'Open' => 'info',
                        'In Progress' => 'warning',
                        'Close' => 'success',
                        default => 'gray',
                    }),

                TextColumn::make('status_outcome')
                    ->badge()
                    ->icon(fn(?string $state) => match ($state) {
                        'Completed' => 'heroicon-o-check-circle',
                        'Rejected' => 'heroicon-o-x-circle',
                        'Reopen' => 'heroicon-o-arrow-path',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn(?string $state): string => match ($state) {
                        'Completed' => 'success',
                        'Rejected' => 'danger',
                        'Reopen' => 'warning',
                        default => 'gray',
                    }),

                TextColumn::make('created_at')
                    ->label('Tanggal Dibuat')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->created_at->format('H:i:s')
                    ),

                TextColumn::make('waktu_mulai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->created_at->format('H:i:s')
                    ),

                TextColumn::make('waktu_selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->waktu_selesai->format('H:i:s')
                    ),

                TextColumn::make('durasi_pengerjaan')
                    ->timezone(''),

            ])

            ->filters([
                    //
                ])

            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
            ])

            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make(),
                ]),
            ]);
    }
}
