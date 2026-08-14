<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas;

use Filament\Schemas\Schema;
use Filament\Infolists\Components\TextEntry;
use Filament\Infolists\Components\ViewEntry;
use Filament\Schemas\Components\Section;

class PengajuanBarangInfolist
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->columns(2)
            ->schema([

                Section::make('Informasi Pengajuan')
                    ->columns(2)
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('kode_pengajuan')
                            ->label('Nomor Pengajuan'),

                        TextEntry::make('user.name')
                            ->label('Nama Pemohon'),

                        TextEntry::make('status')
                            ->badge()
                            ->icon(fn (string $state) => match ($state) {
                                'Open' => 'heroicon-o-folder-open',
                                'In Progress' => 'heroicon-o-arrow-path',
                                'Close' => 'heroicon-o-check-circle',
                                default => 'heroicon-o-question-mark-circle',
                            })
                            ->color(fn (string $state) => match ($state) {
                                'Open' => 'info',
                                'In Progress' => 'warning',
                                'Close' => 'success',
                                default => 'gray',
                            }),

                        TextEntry::make('nama_barang'),

                        TextEntry::make('status_outcome')
                            ->badge()
                            ->icon(fn (?string $state) => match ($state) {
                                'Completed' => 'heroicon-o-check-circle',
                                'Rejected' => 'heroicon-o-x-circle',
                                'Reopen' => 'heroicon-o-arrow-path',
                                default => 'heroicon-o-question-mark-circle',
                            })
                            ->color(fn (?string $state): string => match ($state) {
                                'Completed' => 'success',
                                'Rejected' => 'danger',
                                'Reopen' => 'warning',
                                default => 'gray',
                            }),

                        TextEntry::make('jumlah')
                            ->label('Jumlah Barang'),

                        TextEntry::make('created_at')
                            ->dateTime(),

                        // TextEntry::make('alasan'),

                        TextEntry::make('updated_at')
                            ->dateTime(),

                    ]),

                Section::make('Alasan Permintaan')
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('alasan')
                            ->hiddenLabel()
                            ->columnSpanFull(),

                    ]),

                Section::make('Timeline Aktivitas')
                    ->columnSpan(1)
                    ->schema([

                        ViewEntry::make('id')
                            ->view('filament.pages.tiket.timeline'),

                    ]),

                Section::make('Diskusi')
                    ->columnSpan(1)
                    ->schema([

                        ViewEntry::make('id')
                            ->view(
                                'filament.pages.tiket.chat'
                            ),

                    ]),
            ]);

    }
}
