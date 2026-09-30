<?php

namespace App\Filament\Resources\PengajuanBarangs\Tables;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\BulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Actions\RestoreBulkAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Textarea;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;
use Illuminate\Database\Eloquent\Collection;
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
                    ->numeric()
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
                        fn(?string $state): string => match ($state) {
                            'Open' => 'heroicon-o-folder-open',
                            'In Progress' => 'heroicon-o-arrow-path',
                            'Close' => 'heroicon-o-check-circle',
                            default => 'heroicon-o-question-mark-circle',
                        }
                    )
                    ->color(
                        fn(?string $state): string => match ($state) {
                            'Open' => 'info',
                            'In Progress' => 'warning',
                            'Close' => 'success',
                            default => 'gray',
                        }
                    )
                    ->sortable(),

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
                    ->placeholder('-')
                    ->sortable(),

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

            /*
            |--------------------------------------------------------------------------
            | Filters
            |--------------------------------------------------------------------------
            */

            ->filters([
                TrashedFilter::make(),
            ])

            /*
            |--------------------------------------------------------------------------
            | Actions
            |--------------------------------------------------------------------------
            */

            ->actions([
                /*
                |----------------------------------------------------------------------
                | Ambil Tiket
                |----------------------------------------------------------------------
                */

                Action::make('ambil_tiket')
                    ->tooltip('Ambil Tiket')
                    ->label('')
                    ->icon('heroicon-o-wrench-screwdriver')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->status === 'Open'
                    )
                    ->action(
                        function (PengajuanBarang $record): void {
                            $record->updateStatus(
                                'In Progress',
                                'Tiket mulai dikerjakan oleh '
                                . auth()->user()->name
                            );

                            $record->sendMessage(
                                'Teknisi '
                                . auth()->user()->name
                                . ' mengambil tiket ini.'
                            );
                        }
                    ),

                /*
                |----------------------------------------------------------------------
                | Selesai
                |----------------------------------------------------------------------
                */
                Action::make('selesai')
                    ->tooltip('Selesai')
                    ->label('')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->status === 'In Progress'
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Catatan Penyelesaian')
                            ->required()
                            ->rows(4),
                    ])
                    ->action(
                        function (PengajuanBarang $record, array $data): void {
                            $record->closeAsCompleted(
                                $data['catatan']
                            );
                        }
                    )
                    ->modalHeading('Konfirmasi Penyelesaian')
                    ->modalDescription(
                        'Tindakan ini akan menutup pengajuan dan mencatat '
                        . 'hasil penyelesaiannya.'
                    ),

                /*
                |----------------------------------------------------------------------
                | Tolak
                |----------------------------------------------------------------------
                */
                Action::make('tolak')
                    ->tooltip('Tolak')
                    ->label('')
                    ->color('danger')
                    ->icon('heroicon-o-x-circle')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->status === 'In Progress'
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Penolakan')
                            ->required()
                            ->rows(4),
                    ])
                    ->action(
                        function (PengajuanBarang $record, array $data): void {
                            $record->closeAsRejected(
                                $data['catatan']
                            );
                        }
                    )
                    ->modalHeading('Konfirmasi Penolakan')
                    ->modalDescription(
                        'Tindakan ini akan menutup pengajuan sebagai '
                        . 'pengajuan yang ditolak.'
                    ),

                /*
                |----------------------------------------------------------------------
                | Reopen
                |----------------------------------------------------------------------
                */
                Action::make('reopen')
                    ->label('')
                    ->tooltip('Buka Kembali')
                    ->color('primary')
                    ->icon('heroicon-o-arrow-path')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->isClosed()
                            && (
                                auth()->user()->hasRole('admin')
                                || auth()->user()->hasRole('super_admin')
                            )
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Buka Kembali')
                            ->required()
                            ->rows(4),
                    ])
                    ->action(
                        function (PengajuanBarang $record, array $data): void {
                            $record->reopen(
                                $data['catatan']
                            );
                        }
                    ),

                /*
                |----------------------------------------------------------------------
                | View
                |----------------------------------------------------------------------
                */
                ViewAction::make()
                    ->label('')
                    ->tooltip('Lihat Detail'),

                /*
                |----------------------------------------------------------------------
                | Restore
                |----------------------------------------------------------------------
                */
                RestoreAction::make()
                    ->label('')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->trashed()
                    ),

                /*
                |----------------------------------------------------------------------
                | Edit
                |----------------------------------------------------------------------
                */
                EditAction::make()
                    ->label('')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->canStaffEdit()
                    ),

                /*
                |----------------------------------------------------------------------
                | Soft Delete
                |----------------------------------------------------------------------
                */
                DeleteAction::make()
                    ->label('')
                    ->tooltip('Batalkan / Soft Delete')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->isClosed()
                            && (
                                auth()->user()->hasRole('admin')
                                || auth()->user()->hasRole('super_admin')
                            )
                    )
                    ->requiresConfirmation(),

                /*
                |----------------------------------------------------------------------
                | Force Delete
                |----------------------------------------------------------------------
                */
                ForceDeleteAction::make()
                    ->label('')
                    ->tooltip('Hapus Permanen')
                    ->visible(
                        fn(): bool =>
                            auth()->user()->hasRole('super_admin')
                    ),
            ])
            ->actionsColumnLabel('Action Button')

            ->BulkActions([
                BulkActionGroup::make([

                    RestoreBulkAction::make()
                        ->label('Pulihkan Data'),

                    BulkAction::make('delete_selected')
                        ->label('Hapus Data')
                        ->icon('heroicon-o-trash')
                        ->color('danger')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Pengajuan Barang')
                        ->modalDescription(
                            'Pengajuan yang dipilih dan memenuhi syarat akan dipindahkan '
                            . 'ke tempat sampah.'
                        )
                        ->modalSubmitActionLabel('Ya, Hapus')
                        ->action(
                            function (Collection $records): void {

                                foreach ($records as $record) {

                                    if (!$record->isClosed()) {
                                        continue;
                                    }

                                    if (
                                        !auth()->user()->hasAnyRole([
                                            'admin',
                                            'super_admin',
                                        ])
                                    ) {
                                        abort(403);
                                    }

                                    $record->delete();
                                }
                            }
                        ),
                ])
            ]);

    }
}
