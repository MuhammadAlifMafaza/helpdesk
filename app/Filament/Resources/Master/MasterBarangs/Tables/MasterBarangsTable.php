<?php

namespace App\Filament\Resources\Master\MasterBarangs\Tables;

use App\Models\Modules\Master\Barang\Models\MasterBarang;
use Filament\Actions\Action;
use Filament\Actions\BulkAction;
use Filament\Actions\BulkActionGroup;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\EditAction;
use Filament\Actions\ForceDeleteAction;
use Filament\Actions\RestoreAction;
use Filament\Actions\RestoreBulkAction;
use Filament\Actions\ViewAction;
use Filament\Notifications\Notification;
use Filament\Tables\Columns\IconColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TernaryFilter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;


class MasterBarangsTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->defaultSort('nama_barang')

            ->columns([
                TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->sortable()
                    ->weight('medium'),

                TextColumn::make('kategoriBarang.nama_kategori')
                    ->label('Kategori')
                    ->searchable()
                    ->sortable()
                    ->badge(),

                TextColumn::make('keterangan')
                    ->label('Keterangan')
                    ->limit(70)
                    ->wrap()
                    ->toggleable(),

                IconColumn::make('is_active')
                    ->label('Status')
                    ->boolean()
                    ->alignCenter(),

                TextColumn::make('created_at')
                    ->label('Dibuat')
                    ->dateTime('d M Y H:i')
                    ->sortable()
                    ->toggleable(
                        isToggledHiddenByDefault: true
                    ),

                TextColumn::make('updated_at')
                    ->label('Diperbarui')
                    ->dateTime('d M Y H:i')
                    ->sortable()
                    ->toggleable(
                        isToggledHiddenByDefault: true
                    ),
            ])

            ->filters([
                SelectFilter::make('kategori_barang_id')
                    ->label('Kategori')
                    ->relationship(
                        'kategoriBarang',
                        'nama_kategori'
                    )
                    ->searchable()
                    ->preload(),

                TernaryFilter::make('is_active')
                    ->label('Status')
                    ->placeholder('Semua')
                    ->trueLabel('Aktif')
                    ->falseLabel('Tidak Aktif'),

                TrashedFilter::make(),
            ])

            ->recordActions([
                ViewAction::make(),

                EditAction::make(),

                Action::make('toggle_active')
                    ->label(
                        fn(MasterBarang $record): string =>
                            $record->isActive()
                            ? 'Nonaktifkan'
                            : 'Aktifkan'
                    )
                    ->icon(
                        fn(MasterBarang $record): string =>
                            $record->isActive()
                            ? 'heroicon-o-x-circle'
                            : 'heroicon-o-check-circle'
                    )
                    ->color(
                        fn(MasterBarang $record): string =>
                            $record->isActive()
                            ? 'warning'
                            : 'success'
                    )
                    ->requiresConfirmation()
                    ->modalHeading(
                        fn(MasterBarang $record): string =>
                            $record->isActive()
                            ? 'Nonaktifkan Barang?'
                            : 'Aktifkan Barang?'
                    )
                    ->modalDescription(
                        fn(MasterBarang $record): string =>
                            $record->isActive()
                            ? 'Barang tidak akan tersedia untuk transaksi baru.'
                            : 'Barang akan tersedia kembali untuk transaksi baru.'
                    )
                    ->action(function (MasterBarang $record): void {
                        $record->update([
                            'is_active' => !$record->is_active,
                        ]);

                        Notification::make()
                            ->title(
                                $record->is_active
                                ? 'Barang diaktifkan'
                                : 'Barang dinonaktifkan'
                            )
                            ->success()
                            ->send();
                    }),

                DeleteAction::make(),

                RestoreAction::make(),

                ForceDeleteAction::make()
                    ->requiresConfirmation()
                    ->modalHeading('Hapus Barang Secara Permanen?')
                    ->modalDescription(
                        'Tindakan ini tidak dapat dibatalkan. Barang hanya dapat dihapus '
                        . 'secara permanen apabila tidak memiliki referensi transaksi.'
                    ),
            ])

            ->toolbarActions([
                BulkActionGroup::make([
                    DeleteBulkAction::make()
                        ->label('Hapus Terpilih')
                        ->requiresConfirmation(),

                    BulkAction::make('force_delete')
                        ->label('Hapus Permanen')
                        ->icon('heroicon-o-trash')
                        ->color('danger')
                        ->requiresConfirmation()
                        ->modalHeading('Hapus Barang Secara Permanen?')
                        ->modalDescription(
                            'Barang yang dipilih akan dihapus secara permanen. '
                            . 'Barang yang masih digunakan dalam transaksi tidak akan dapat dihapus.'
                        )
                        ->action(function ($records): void {

                            $berhasil = 0;
                            $ditolak = 0;

                            foreach ($records as $record) {
                                try {
                                    $record->forceDelete();

                                    $berhasil++;
                                } catch (\Throwable $exception) {
                                    $ditolak++;
                                }
                            }

                            $notification = Notification::make()
                                ->title('Proses hapus permanen selesai');

                            if ($ditolak > 0) {
                                $notification
                                    ->warning()
                                    ->body(
                                        "{$berhasil} barang berhasil dihapus permanen. "
                                        . "{$ditolak} barang tidak dapat dihapus karena masih memiliki referensi transaksi."
                                    );
                            } else {
                                $notification
                                    ->success()
                                    ->body(
                                        "{$berhasil} barang berhasil dihapus permanen."
                                    );
                            }

                            $notification->send();
                        })
                        ->deselectRecordsAfterCompletion(),

                    RestoreBulkAction::make()
                        ->label('Pulihkan Terpilih'),

                    BulkAction::make('activate')
                        ->label('Aktifkan')
                        ->icon('heroicon-o-check-circle')
                        ->color('success')
                        ->requiresConfirmation()
                        ->modalHeading('Aktifkan Barang Terpilih?')
                        ->modalDescription(
                            'Barang yang dipilih akan diaktifkan dan dapat digunakan '
                            . 'untuk transaksi baru.'
                        )
                        ->action(function ($records): void {
                            $records->each(function (MasterBarang $record): void {
                                $record->update([
                                    'is_active' => true,
                                ]);
                            });

                            Notification::make()
                                ->title('Barang berhasil diaktifkan')
                                ->success()
                                ->send();
                        })
                        ->deselectRecordsAfterCompletion(),

                    BulkAction::make('deactivate')
                        ->label('Nonaktifkan')
                        ->icon('heroicon-o-x-circle')
                        ->color('warning')
                        ->requiresConfirmation()
                        ->modalHeading('Nonaktifkan Barang Terpilih?')
                        ->modalDescription(
                            'Barang yang dipilih tidak akan tersedia untuk transaksi baru.'
                        )
                        ->action(function ($records): void {
                            $records->each(function (MasterBarang $record): void {
                                $record->update([
                                    'is_active' => false,
                                ]);
                            });

                            Notification::make()
                                ->title('Barang berhasil dinonaktifkan')
                                ->success()
                                ->send();
                        })
                        ->deselectRecordsAfterCompletion(),
                ]),
            ]);
    }
}
