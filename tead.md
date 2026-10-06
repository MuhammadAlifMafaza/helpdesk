```php
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
use Filament\Notifications\Notification;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;

class PengajuanBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table

            /*
            |--------------------------------------------------------------------------
            | Default Sorting
            |--------------------------------------------------------------------------
            |
            | created_at merupakan field database sehingga aman digunakan
            | sebagai default sorting.
            |
            */
            ->defaultSort('created_at', 'desc')

            /*
            |--------------------------------------------------------------------------
            | Columns
            |--------------------------------------------------------------------------
            */
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
                | Kode Pengajuan
                |--------------------------------------------------------------------------
                |
                | kode_pengajuan merupakan accessor.
                | Jangan gunakan sortable() / searchable() native di sini.
                |
                */

                TextColumn::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->copyable()
                    ->copyMessage('Kode pengajuan disalin')
                    ->copyMessageDuration(1500)
                    ->weight('bold'),

                /*
                |--------------------------------------------------------------------------
                | Pemohon
                |--------------------------------------------------------------------------
                |
                | user.name berasal dari relationship sehingga searchable/sortable
                | masih dapat ditangani oleh Filament/Eloquent.
                |
                */

                TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable()
                    ->sortable()
                    ->placeholder('-'),

                /*
                |--------------------------------------------------------------------------
                | Kategori Barang
                |--------------------------------------------------------------------------
                |
                | Berasal dari:
                | PengajuanBarang
                | -> barang
                | -> kategoriBarang
                | -> nama_kategori
                |
                */

                TextColumn::make('barang.kategoriBarang.nama_kategori')
                    ->label('Kategori Barang')
                    ->searchable()
                    ->sortable()
                    ->placeholder('Tidak tersedia')
                    ->wrap(),

                /*
                |--------------------------------------------------------------------------
                | Nama Barang
                |--------------------------------------------------------------------------
                */

                TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->sortable()
                    ->placeholder('-')
                    ->wrap(),

                /*
                |--------------------------------------------------------------------------
                | Jumlah
                |--------------------------------------------------------------------------
                */

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
                        fn (?string $state): string => match ($state) {
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
                        fn (?string $state): string => match ($state) {
                            'Open' => 'info',
                            'In Progress' => 'warning',
                            'Close' => 'success',
                            default => 'gray',
                        }
                    )
                    ->sortable(),

                /*
                |--------------------------------------------------------------------------
                | Hasil Pengajuan
                |--------------------------------------------------------------------------
                |
                | status_outcome adalah accessor yang membaca log.
                | Tidak menggunakan sortable().
                |
                */

                TextColumn::make('status_outcome')
                    ->label('Hasil')
                    ->badge()
                    ->icon(
                        fn (?string $state): string => match ($state) {
                            'Completed' =>
                                'heroicon-o-check-circle',

                            'Rejected' =>
                                'heroicon-o-x-circle',

                            default =>
                                'heroicon-o-minus-circle',
                        }
                    )
                    ->color(
                        fn (?string $state): string => match ($state) {
                            'Completed' => 'success',
                            'Rejected' => 'danger',
                            default => 'gray',
                        }
                    )
                    ->placeholder('Belum ditentukan'),

                /*
                |--------------------------------------------------------------------------
                | Waktu Pengajuan
                |--------------------------------------------------------------------------
                |
                | created_at merupakan field database.
                |
                */

                TextColumn::make('created_at')
                    ->label('Waktu Pengajuan')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn (PengajuanBarang $record): ?string =>
                            $record->created_at
                                ?->timezone('Asia/Jakarta')
                                ->format('H:i:s')
                    )
                    ->sortable(),

                /*
                |--------------------------------------------------------------------------
                | Waktu Diterima
                |--------------------------------------------------------------------------
                |
                | waktu_mulai adalah accessor dari log.
                | Tidak menggunakan sortable().
                |
                */

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Diterima')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn (PengajuanBarang $record): ?string =>
                            $record->waktu_mulai
                                ?->timezone('Asia/Jakarta')
                                ->format('H:i:s')
                    )
                    ->placeholder('-'),

                /*
                |--------------------------------------------------------------------------
                | Waktu Selesai
                |--------------------------------------------------------------------------
                |
                | waktu_selesai adalah accessor dari log.
                | Tidak menggunakan sortable().
                |
                */

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Selesai')
                    ->dateTime('d M Y')
                    ->timezone('Asia/Jakarta')
                    ->description(
                        fn (PengajuanBarang $record): ?string =>
                            $record->waktu_selesai
                                ?->timezone('Asia/Jakarta')
                                ->format('H:i:s')
                    )
                    ->placeholder('-'),

                /*
                |--------------------------------------------------------------------------
                | Durasi
                |--------------------------------------------------------------------------
                |
                | durasi_pengerjaan adalah accessor hasil kalkulasi.
                | Tidak menggunakan sortable().
                |
                */

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

                /*
                |--------------------------------------------------------------------------
                | Filter Status
                |--------------------------------------------------------------------------
                */

                SelectFilter::make('status')
                    ->label('Status Pengajuan')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Close' => 'Close',
                    ]),

                /*
                |--------------------------------------------------------------------------
                | Filter Outcome
                |--------------------------------------------------------------------------
                |
                | Outcome bukan kolom database.
                | Karena itu filter membaca log Close.
                |
                */

                SelectFilter::make('status_outcome')
                    ->label('Hasil Pengajuan')
                    ->options([
                        'Completed' => 'Selesai',
                        'Rejected' => 'Ditolak',
                    ])
                    ->query(
                        function ($query, array $data) {

                            $outcome = $data['value'] ?? null;

                            if (blank($outcome)) {
                                return $query;
                            }

                            return $query->whereHas(
                                'logs',
                                function ($query) use ($outcome): void {

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
                                            fn ($query) =>
                                                $query->where(
                                                    'keterangan',
                                                    'like',
                                                    '%[SELESAI]%'
                                                )
                                        )
                                        ->when(
                                            $outcome === 'Rejected',
                                            fn ($query) =>
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

                /*
                |--------------------------------------------------------------------------
                | Filter Soft Delete
                |--------------------------------------------------------------------------
                */

                TrashedFilter::make()
                    ->label('Data Terhapus'),
            ])

            /*
            |--------------------------------------------------------------------------
            | Record Actions
            |--------------------------------------------------------------------------
            */

            ->recordActions([

                /*
                |--------------------------------------------------------------------------
                | Ambil Pengajuan
                |--------------------------------------------------------------------------
                */

                Action::make('ambil_tiket')
                    ->tooltip('Ambil Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-wrench-screwdriver')
                    ->color('warning')
                    ->visible(
                        fn (PengajuanBarang $record): bool =>
                            $record->isOpen()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
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

                            Notification::make()
                                ->success()
                                ->title('Pengajuan berhasil diambil')
                                ->body(
                                    "{$record->kode_pengajuan} sekarang berstatus In Progress."
                                )
                                ->send();
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | Selesaikan Pengajuan
                |--------------------------------------------------------------------------
                */

                Action::make('selesai')
                    ->tooltip('Selesaikan Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->visible(
                        fn (PengajuanBarang $record): bool =>
                            $record->isInProgress()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Catatan Penyelesaian')
                            ->required()
                            ->rows(4)
                            ->maxLength(2000),
                    ])
                    ->modalHeading('Konfirmasi Penyelesaian')
                    ->modalDescription(
                        'Pengajuan akan ditutup sebagai pengajuan yang selesai.'
                    )
                    ->modalSubmitActionLabel('Selesaikan Pengajuan')
                    ->action(
                        function (
                            PengajuanBarang $record,
                            array $data
                        ): void {

                            $record->closeAsCompleted(
                                $data['catatan']
                            );

                            Notification::make()
                                ->success()
                                ->title('Pengajuan diselesaikan')
                                ->body(
                                    "{$record->kode_pengajuan} telah diselesaikan."
                                )
                                ->send();
                        }
                    ),

                /*
                |--------------------------------------------------------------------------
                | Tolak Pengajuan
                |--------------------------------------------------------------------------
                */

                Action::make('tolak')
                    ->tooltip('Tolak Pengajuan')
                    ->label('')
                    ->icon('heroicon-o-x-circle')
                    ->color('danger')
                    ->visible(
                        fn (PengajuanBarang $record): bool =>
                            $record->isInProgress()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Penolakan')
                            ->required()
                            ->rows(4)
                            ->maxLength(2000),
                    ])
                    ->modalHeading('Konfirmasi Penolakan')
                    ->modalDescription(
                        'Pengajuan akan ditutup sebagai pengajuan yang ditolak.'
                    )
                    ->modalSubmitActionLabel('Tolak Pengajuan')
                    ->action(
                        function (
                            PengajuanBarang $record,
                            array $data
                        ): void {

                            $record->closeAsRejected(
                                $data['catatan']
                            );

                            Notification::make()
                                ->success()
                                ->title('Pengajuan ditolak')
                                ->body(
                                    "{$record->kode_pengajuan} telah ditutup sebagai ditolak."
                                )
                                ->send();
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
                        fn (PengajuanBarang $record): bool =>
                            $record->isClosed()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Buka Kembali')
                            ->required()
                            ->rows(4)
                            ->maxLength(2000),
                    ])
                    ->modalHeading('Buka Kembali Pengajuan')
                    ->modalDescription(
                        'Status pengajuan akan dikembalikan menjadi In Progress.'
                    )
                    ->modalSubmitActionLabel('Buka Kembali')
                    ->action(
                        function (
                            PengajuanBarang $record,
                            array $data
                        ): void {

                            $record->reopen(
                                $data['catatan']
                            );

                            Notification::make()
                                ->success()
                                ->title('Pengajuan dibuka kembali')
                                ->body(
                                    "{$record->kode_pengajuan} kembali berstatus In Progress."
                                )
                                ->send();
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
                        fn (PengajuanBarang $record): bool =>
                            $record->trashed()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
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
                        fn (PengajuanBarang $record): bool =>
                            $record->canStaffEdit()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
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
                        fn (PengajuanBarang $record): bool =>
                            $record->isClosed()
                            && auth()->user()?->hasAnyRole([
                                'admin',
                                'super_admin',
                            ])
                    )
                    ->requiresConfirmation()
                    ->modalHeading('Hapus Pengajuan Barang')
                    ->modalDescription(
                        'Data pengajuan akan dipindahkan ke tempat sampah.'
                    )
                    ->modalSubmitActionLabel('Ya, Hapus'),

                /*
                |--------------------------------------------------------------------------
                | Force Delete
                |--------------------------------------------------------------------------
                */

                ForceDeleteAction::make()
                    ->label('')
                    ->tooltip('Hapus Permanen')
                    ->visible(
                        fn (PengajuanBarang $record): bool =>
                            $record->trashed()
                            && auth()->user()?->hasRole('super_admin')
                    )
                    ->requiresConfirmation()
                    ->modalHeading('Hapus Permanen')
                    ->modalDescription(
                        'Data akan dihapus secara permanen dan tidak dapat dipulihkan.'
                    )
                    ->modalSubmitActionLabel('Hapus Permanen'),
            ])

            /*
            |--------------------------------------------------------------------------
            | Toolbar / Bulk Actions
            |--------------------------------------------------------------------------
            */

            ->toolbarActions([

                BulkActionGroup::make([

                    /*
                    |--------------------------------------------------------------------------
                    | Restore
                    |--------------------------------------------------------------------------
                    */

                    RestoreBulkAction::make()
                        ->label('Pulihkan Data')
                        ->visible(
                            fn (): bool =>
                                auth()->user()?->hasAnyRole([
                                    'admin',
                                    'super_admin',
                                ])
                        ),

                    /*
                    |--------------------------------------------------------------------------
                    | Soft Delete
                    |--------------------------------------------------------------------------
                    */

                    DeleteBulkAction::make()
                        ->label('Hapus Terpilih')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Pengajuan Barang')
                        ->modalDescription(
                            'Hanya pengajuan berstatus Close yang akan dipindahkan '
                            . 'ke tempat sampah. Pengajuan yang belum Close akan dilewati.'
                        )
                        ->modalSubmitActionLabel('Ya, Hapus')
                        ->visible(
                            fn (): bool =>
                                auth()->user()?->hasAnyRole([
                                    'admin',
                                    'super_admin',
                                ])
                        )
                        ->action(
                            function ($records): void {

                                $closedRecords = $records->filter(
                                    fn (PengajuanBarang $record): bool =>
                                        $record->isClosed()
                                        && ! $record->trashed()
                                );

                                $skippedCount =
                                    $records->count()
                                    - $closedRecords->count();

                                $closedRecords->each(
                                    fn (PengajuanBarang $record): mixed =>
                                        $record->delete()
                                );

                                if ($closedRecords->isNotEmpty()) {

                                    Notification::make()
                                        ->success()
                                        ->title(
                                            'Pengajuan berhasil dihapus'
                                        )
                                        ->body(
                                            $closedRecords->count()
                                            . ' pengajuan berstatus Close '
                                            . 'dipindahkan ke tempat sampah.'
                                            . (
                                                $skippedCount > 0
                                                    ? ' '
                                                    . $skippedCount
                                                    . ' pengajuan dilewati.'
                                                    : ''
                                            )
                                        )
                                        ->send();

                                    return;
                                }

                                Notification::make()
                                    ->warning()
                                    ->title(
                                        'Tidak ada pengajuan yang dihapus'
                                    )
                                    ->body(
                                        'Tidak terdapat pengajuan berstatus Close '
                                        . 'yang dapat dihapus dari data terpilih.'
                                    )
                                    ->send();
                            }
                        ),

                    /*
                    |--------------------------------------------------------------------------
                    | Force Delete
                    |--------------------------------------------------------------------------
                    */

                    ForceDeleteBulkAction::make()
                        ->label('Hapus Permanen')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Permanen')
                        ->modalDescription(
                            'Data yang dipilih akan dihapus secara permanen '
                            . 'dan tidak dapat dipulihkan.'
                        )
                        ->modalSubmitActionLabel('Hapus Permanen')
                        ->visible(
                            fn (): bool =>
                                auth()->user()?->hasRole('super_admin')
                        ),
                ]),
            ]);
    }
}
```
