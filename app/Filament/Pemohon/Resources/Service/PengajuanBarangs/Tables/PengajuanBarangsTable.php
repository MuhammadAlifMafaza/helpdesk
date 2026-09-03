<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Tables;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class PengajuanBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')
            ->columns([
                TextColumn::make('index')
                    ->label('No.')
                    ->rowIndex(),

                TextColumn::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->searchable()
                    ->copyable()
                    ->copyMessage('Kode pengajuan disalin')
                    ->copyMessageDuration(1500)
                    ->weight('bold'),

                TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable(),

                TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->wrap(),

                TextColumn::make('jumlah')
                    ->label('Jumlah')
                    ->sortable(),

                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->icon(fn (string $state): string => match ($state) {
                        'Open' => 'heroicon-o-folder-open',
                        'In Progress' => 'heroicon-o-arrow-path',
                        'Close' => 'heroicon-o-check-circle',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn (string $state): string => match ($state) {
                        'Open' => 'info',
                        'In Progress' => 'warning',
                        'Close' => 'success',
                        default => 'gray',
                    }),

                TextColumn::make('status_outcome')
                    ->label('Hasil')
                    ->badge()
                    ->icon(fn (?string $state): string => match ($state) {
                        'Completed' => 'heroicon-o-check-circle',
                        'Rejected' => 'heroicon-o-x-circle',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn (?string $state): string => match ($state) {
                        'Completed' => 'success',
                        'Rejected' => 'danger',
                        default => 'gray',
                    })
                    ->placeholder('-'),

                TextColumn::make('created_at')
                    ->label('Waktu Pengajuan')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn ($record): ?string => $record->created_at?->timezone('Asia/Jakarta')->format('H:i:s')
                    )
                    ->sortable(),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Diterima')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn ($record): ?string => $record->waktu_mulai?->timezone('Asia/Jakarta')->format('H:i:s')
                    )
                    ->placeholder('-')
                    ->sortable(),

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn ($record): ?string => $record->waktu_selesai?->timezone('Asia/Jakarta')->format('H:i:s')
                    )
                    ->placeholder('-')
                    ->sortable(),

                TextColumn::make('durasi_pengerjaan')
                    ->label('Durasi')
                    ->placeholder('-'),
            ])

            ->filters([
                //
            ])

            ->recordActions([

                /*
                |--------------------------------------------------------------------------
                | View
                |--------------------------------------------------------------------------
                */

                ViewAction::make(),

                /*
                |--------------------------------------------------------------------------
                | Edit
                |--------------------------------------------------------------------------
                */

                EditAction::make()
                    ->visible(
                        fn (PengajuanBarang $record): bool => $record->canPemohonEdit()
                    ),

                /*
                |--------------------------------------------------------------------------
                | Batalkan Tiket
                |--------------------------------------------------------------------------
                */

                DeleteAction::make()
                    ->label('batalkan')
                    ->tooltip('Batalkan Tiket')
                    ->icon('heroicon-o-x-circle')
                    ->color('danger')
                    ->requiresConfirmation()
                    ->visible(
                        fn (PengajuanBarang $record): bool => $record->canPemohonDelete()
                    )
                    ->modalHeading('Batalkan Tiket')
                    ->modalDescription(
                        'Tiket yang dibatalkan tidak akan ditampilkan lagi pada daftar tiket aktif.'
                    )
                    ->modalSubmitActionLabel('Ya, Batalkan')
                    ->successNotificationTitle(
                        'Tiket berhasil dibatalkan'
                    )
                    ->before(
                        function (PengajuanBarang $record): void {

                            if (! $record->canPemohonDelete()) {
                                abort(
                                    403,
                                    'Tiket tidak dapat dibatalkan pada status saat ini.'
                                );
                            }
                        }
                    ),
            ]);
    }
}
