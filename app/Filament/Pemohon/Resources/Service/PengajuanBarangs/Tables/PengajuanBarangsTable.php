<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Tables;

use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class PengajuanBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('index')
                    ->label('No')
                    ->rowIndex(),

                TextColumn::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->searchable()
                    ->copyable()
                    ->weight('bold'),


                TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable(),

                TextColumn::make('nama_barang')
                    ->searchable(),

                TextColumn::make('jumlah')
                    ->sortable(),

                TextColumn::make('status')
                    ->badge()
                    ->icon(fn(string $state) => match ($state) {
                        'Open' => 'heroicon-o-folder-open',
                        'In Progress' => 'heroicon-o-arrow-path',
                        'Close' => 'heroicon-o-check-circle',
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
                    ->label('Waktu Permintaan Dibuat')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->created_at->format('H:i:s')
                    ),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Permintaan Diterima')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->created_at->format('H:i:s')
                    ),

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Permintaan Selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record) => $record->created_at->format('H:i:s')
                    ),

                TextColumn::make('durasi_pengerjaan')
                    ->timezone('Asia/Jakarta'),

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
