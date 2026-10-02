<?php

namespace App\Filament\Resources\PengajuanBarangs\Tables;

use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Actions\Action;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\ForceDeleteBulkAction;
use Filament\Actions\RestoreAction;
use Filament\Actions\RestoreBulkAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Textarea;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Notifications\Notification;
use Filament\Support\Exceptions\Halt;
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
                    ->weight('bold')
                    ->sortable(),

                TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable()
                    ->sortable(),

                TextColumn::make('barang.kategoriBarang.nama_kategori')
                    ->label('Kategori Barang')
                    ->searchable()
                    ->sortable()
                    ->placeholder('Tidak tersedia')
                    ->wrap(),

                TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->sortable()
                    ->wrap(),

                TextColumn::make('jumlah')
                    ->label('Jumlah')
                    ->numeric()
                    ->sortable(),

                TextColumn::make('status')
                    ->label('Status')
                    ->badge()
                    ->icon(
                        fn(string $state): string => match ($state) {
                            'Open' =>
                                'heroicon-o-folder-open',

                            'In Progress' =>
                                'heroicon-o-arrow-path',

                            'Close' =>
                                'heroicon-o-check-circle',

                            default =>
                                'heroicon-o-question-mark-circle',
                        }
                    )
                    ->color(
                        fn(string $state): string => match ($state) {
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
                            default => 'heroicon-o-minus-circle',
                        }
                    )
                    ->color(
                        fn(?string $state): string => match ($state) {
                            'Completed' => 'success',
                            'Rejected' => 'danger',
                            default => 'gray',
                        }
                    )
                    ->placeholder('Belum ditentukan')
                    ->sortable(),

                TextColumn::make('created_at')
                    ->label('Waktu Pengajuan')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn(
                        PengajuanBarang $record
                    ): ?string =>
                            $record->created_at
                                    ?->timezone('Asia/Jakarta')
                                ->format('H:i:s')
                    )
                    ->sortable(),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Diterima')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn(
                        PengajuanBarang $record
                    ): ?string =>
                            $record->waktu_mulai
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
                        fn(
                        PengajuanBarang $record
                    ): ?string =>
                            $record->waktu_selesai
                                    ?->timezone('Asia/Jakarta')
                                ->format('H:i:s')
                    )
                    ->placeholder('-')
                    ->sortable(),

                TextColumn::make('durasi_pengerjaan')
                    ->label('Durasi')
                    ->placeholder('-')
                    ->sortable(),
            ])

            ->filters([

                SelectFilter::make('status')
                    ->label('Status')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Close' => 'Close',
                    ]),

                SelectFilter::make('status_outcome')
                    ->label('Hasil Pengajuan')
                    ->options([
                        'Completed' => 'Selesai',
                        'Rejected' => 'Ditolak',
                    ])
                    ->query(
                        function ($query, array $data) {

                            if (blank($data['value'] ?? null)) {
                                return $query;
                            }

                            $outcome = $data['value'];

                            return $query->whereHas(
                                'logs',
                                function ($query) use ($outcome) {

                                    $query
                                        ->where(
                                            'kategori_log',
                                            'Status'
                                        )
                                        ->where(
                                            'data_baru',
                                            'Close'
                                        )
                                        ->when(
                                            $outcome === 'Completed',
                                            fn($query) =>
                                                $query->where(
                                                    'keterangan',
                                                    'like',
                                                    '%[SELESAI]%'
                                                )
                                        )
                                        ->when(
                                            $outcome === 'Rejected',
                                            fn($query) =>
                                                $query->where(
                                                    'keterangan',
                                                    'like',
                                                    '%[DITOLAK]%'
                                                )
                                        );
                                }
                            );
                        }
                    ),

                TrashedFilter::make()
                    ->label('Data Terhapus'),
            ])

            ->recordActions([

                /*
                |--------------------------------------------------------------------------
                | Ambil Tiket
                |--------------------------------------------------------------------------
                */

                Action::make('ambil_tiket')
                    ->tooltip('Ambil Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-wrench-screwdriver')
                    ->color('warning')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->isOpen()
                    )
                    ->requiresConfirmation()
                    ->modalHeading('Ambil Pengajuan')
                    ->modalDescription(
                        'Pengajuan akan dipindahkan ke status In Progress.'
                    )
                    ->modalSubmitActionLabel('Ya, Ambil Pengajuan')
                    ->action(
                        function (PengajuanBarang $record): void {

                            $namaUser =
                                auth()->user()?->name
                                ?? 'System';

                            $record->updateStatus(
                                'In Progress',
                                "Pengajuan mulai diproses oleh {$namaUser}"
                            );

                            $record->sendMessage(
                                "Pengajuan diambil oleh {$namaUser}."
                            );
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | Selesai
                |--------------------------------------------------------------------------
                */

                Action::make('selesai')
                    ->tooltip('Selesaikan Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->isInProgress()
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Catatan Penyelesaian')
                            ->required()
                            ->rows(4),
                    ])
                    ->modalHeading('Konfirmasi Penyelesaian')
                    ->modalDescription(
                        'Pengajuan akan ditutup sebagai pengajuan yang selesai.'
                    )
                    ->modalSubmitActionLabel('Selesaikan')
                    ->action(
                        function (PengajuanBarang $record, array $data): void {

                            $record->closeAsCompleted(
                                $data['catatan']
                            );
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | Tolak
                |--------------------------------------------------------------------------
                */

                Action::make('tolak')
                    ->tooltip('Tolak Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-x-circle')
                    ->color('danger')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->isInProgress()
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Penolakan')
                            ->required()
                            ->rows(4),
                    ])
                    ->modalHeading('Konfirmasi Penolakan')
                    ->modalDescription(
                        'Pengajuan akan ditutup sebagai pengajuan yang ditolak.'
                    )
                    ->modalSubmitActionLabel('Tolak Pengajuan')
                    ->action(
                        function (PengajuanBarang $record, array $data): void {

                            $record->closeAsRejected(
                                $data['catatan']
                            );
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | Reopen
                |--------------------------------------------------------------------------
                */

                Action::make('reopen')
                    ->tooltip('Buka Kembali')
                    ->label('')
                    ->icon('heroicon-o-arrow-path')
                    ->color('warning')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->isClosed()
                            && auth()->user()->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Buka Kembali')
                            ->required()
                            ->rows(4),
                    ])
                    ->modalHeading('Buka Kembali Pengajuan')
                    ->modalDescription(
                        'Status pengajuan akan dikembalikan menjadi In Progress.'
                    )
                    ->action(
                        function (PengajuanBarang $record, array $data): void {

                            $record->reopen(
                                $data['catatan']
                            );
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | View
                |--------------------------------------------------------------------------
                */

                ViewAction::make()
                    ->label('')
                    ->tooltip('Lihat Detail'),

                /*
                |--------------------------------------------------------------------------
                | Restore
                |--------------------------------------------------------------------------
                */

                RestoreAction::make()
                    ->label('')
                    ->tooltip('Pulihkan Data')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->trashed()
                    ),

                /*
                |--------------------------------------------------------------------------
                | Edit
                |--------------------------------------------------------------------------
                */

                EditAction::make()
                    ->label('')
                    ->tooltip('Edit Pengajuan')
                    ->visible(
                        fn(
                        PengajuanBarang $record
                    ): bool =>
                            $record->canStaffEdit()
                    ),

                /*
                |--------------------------------------------------------------------------
                | Soft Delete
                |--------------------------------------------------------------------------
                */

                DeleteAction::make()
                    ->label('')
                    ->tooltip('Hapus Data')
                    ->visible(
                        fn(PengajuanBarang $record): bool =>
                            $record->isClosed()
                            && auth()->user()->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation(),

                /*
                |--------------------------------------------------------------------------
                | Force Delete
                |--------------------------------------------------------------------------
                */

                ForceDeleteAction::make()
                    ->label('')
                    ->tooltip('Hapus Permanen')
                    ->visible(
                        fn($record): bool =>
                            auth()->user()->hasRole('super_admin')
                            && $record->trashed()
                    ),
            ])

            /*
            |--------------------------------------------------------------------------
            | Bulk Actions
            |--------------------------------------------------------------------------
            */

            ->toolbarActions([
                BulkActionGroup::make([

                    RestoreBulkAction::make()
                        ->label('Pulihkan Data')
                        ->visible(
                            fn(): bool =>
                                auth()->user()->hasAnyRole([
                                    'admin',
                                    'super_admin',
                                ])
                        ),

                    DeleteBulkAction::make()
                        ->label('Hapus Terpilih')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Pengajuan Barang')
                        ->modalDescription(
                            'Pengajuan dengan status closed akan dipindahkan ke tempat sampah. '
                            . 'Pengajuan yang belum closed akan dilewati.'
                        )
                        ->modalSubmitActionLabel('Ya, Hapus')
                        ->visible(
                            fn(): bool => auth()->user()->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                        )
                        ->action(function ($records) {
                            $closedRecords = $records->filter(
                                fn(PengajuanBarang $record): bool => $record->isClosed()
                            );

                            $skippedCount = $records->count() - $closedRecords->count();

                            $closedRecords->each(
                                fn(PengajuanBarang $record) => $record->delete()
                            );

                            if ($closedRecords->isNotEmpty()) {
                                Notification::make()
                                    ->success()
                                    ->title('Pengajuan berhasil dihapus')
                                    ->body(
                                        $closedRecords->count()
                                        . ' pengajuan berstatus closed telah dipindahkan ke tempat sampah.'
                                        . (
                                            $skippedCount > 0
                                            ? ' '
                                            . $skippedCount
                                            . ' pengajuan yang belum closed dilewati.'
                                            : ''
                                        )
                                    )
                                    ->send();
                            } else {
                                Notification::make()
                                    ->warning()
                                    ->title('Tidak ada pengajuan yang dihapus')
                                    ->body(
                                        'Semua pengajuan yang dipilih belum berstatus closed.'
                                    )
                                    ->send();
                            }
                        }),

                    ForceDeleteBulkAction::make()
                        ->label('Hapus Permanen')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Permanen')
                        ->modalDescription(
                            'Pengajuan yang dipilih akan dihapus secara permanen dari database.'
                        )
                        ->visible(
                            fn(): bool =>
                                auth()->user()->hasRole('super_admin')
                        ),
                ]),
            ]);
    }
}
