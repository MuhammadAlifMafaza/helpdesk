<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Tables;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Forms\Components\Textarea;
use Filament\Tables\Table;

class PengajuanBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->defaultSort('created_at', 'desc')

            ->columns([
                /*
                |--------------------------------------------------------------------------
                | Nomor
                |--------------------------------------------------------------------------
                */

                TextColumn::make('index')
                    ->label('No.')
                    ->rowIndex(),

                /*
                |--------------------------------------------------------------------------
                | Identitas Pengajuan
                |--------------------------------------------------------------------------
                */

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

                /*
                |--------------------------------------------------------------------------
                | Master Barang
                |--------------------------------------------------------------------------
                */

                TextColumn::make('barang.kategoriBarang.nama_kategori')
                    ->label('Kategori Barang')
                    ->badge()
                    ->searchable()
                    ->placeholder('Tidak tersedia'),

                TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->wrap()
                    ->weight('medium'),

                /*
                |--------------------------------------------------------------------------
                | Detail Pengajuan
                |--------------------------------------------------------------------------
                */

                TextColumn::make('spesifikasi_barang')
                    ->label('Spesifikasi Barang')
                    ->wrap()
                    ->limit(60)
                    ->tooltip(
                        fn(?string $state): ?string => filled($state)
                            ? $state
                            : null
                    )
                    ->placeholder('-')
                    ->toggleable(),

                TextColumn::make('jumlah')
                    ->label('Jumlah')
                    ->sortable(),

                /*
                |--------------------------------------------------------------------------
                | Status
                |--------------------------------------------------------------------------
                */

                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->icon(
                        fn(string $state): string => match ($state) {
                            'Open' => 'heroicon-o-folder-open',
                            'In Progress' => 'heroicon-o-arrow-path',
                            'Close' => 'heroicon-o-check-circle',
                            default => 'heroicon-o-question-mark-circle',
                        }
                    )
                    ->color(
                        fn(string $state): string => match ($state) {
                            'Open' => 'info',
                            'In Progress' => 'warning',
                            'Close' => 'success',
                            default => 'gray',
                        }
                    ),

                TextColumn::make('status_outcome')
                    ->label('Hasil')
                    ->badge()
                    ->icon(
                        fn(?string $state): string => match ($state) {
                            'Completed' => 'heroicon-o-check-circle',
                            'Rejected' => 'heroicon-o-x-circle',
                            'Reopen' => 'heroicon-o-arrow-path',
                            default => 'heroicon-o-question-mark-circle',
                        }
                    )
                    ->color(
                        fn(?string $state): string => match ($state) {
                            'Completed' => 'success',
                            'Rejected' => 'danger',
                            'Reopen' => 'warning',
                            default => 'gray',
                        }
                    )
                    ->placeholder('-'),

                /*
                |--------------------------------------------------------------------------
                | Waktu Proses
                |--------------------------------------------------------------------------
                */

                TextColumn::make('created_at')
                    ->label('Waktu Pengajuan')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record): ?string => $record->created_at
                                ?->timezone('Asia/Jakarta')
                            ->format('H:i:s')
                    )
                    ->sortable(),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Diterima')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record): ?string => $record->waktu_mulai
                                ?->timezone('Asia/Jakarta')
                            ->format('H:i:s')
                    )
                    ->placeholder('-')
                    ->sortable(),

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn($record): ?string => $record->waktu_selesai
                                ?->timezone('Asia/Jakarta')
                            ->format('H:i:s')
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
                        fn(PengajuanBarang $record): bool =>
                            $record->canPemohonEdit()
                    ),

                /*
                |--------------------------------------------------------------------------
                | Batalkan
                |--------------------------------------------------------------------------
                */
                DeleteAction::make()
                    ->label('Batalkan')
                    ->tooltip('Batalkan Pengajuan')
                    ->icon('heroicon-o-x-circle')
                    ->color('danger')
                    ->requiresConfirmation()

                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->canPemohonDelete()
                    )

                    ->modalHeading('Batalkan Pengajuan')

                    ->modalDescription(
                        'Pengajuan yang dibatalkan tidak akan ditampilkan lagi '
                        . 'pada daftar pengajuan aktif.'
                    )

                    ->modalSubmitActionLabel('Ya, Batalkan')

                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Pembatalan')
                            ->placeholder(
                                'Tuliskan alasan pembatalan pengajuan (opsional).'
                            )
                            ->rows(4)
                            ->maxLength(1000),
                    ])

                    ->action(
                        function (PengajuanBarang $record, array $data): void {

                            if (!$record->canPemohonDelete()) {
                                abort(
                                    403,
                                    'Pengajuan tidak dapat dibatalkan '
                                    . 'pada status saat ini.'
                                );
                            }

                            $success = $record->cancelByPemohon(
                                $data['catatan'] ?? null
                            );

                            if (!$success) {
                                abort(
                                    403,
                                    'Pengajuan tidak dapat dibatalkan '
                                    . 'pada status saat ini.'
                                );
                            }
                        }
                    )

                    ->successNotificationTitle(
                        'Pengajuan berhasil dibatalkan'
                    ),
            ]);
    }
}
