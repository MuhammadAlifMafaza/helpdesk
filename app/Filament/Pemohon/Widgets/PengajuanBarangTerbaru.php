<?php

namespace App\Filament\Pemohon\Widgets;

use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget;

class PengajuanBarangTerbaru extends TableWidget
{
    protected static bool $isLazy = true;

    protected static ?string $heading = 'Pengajuan Barang Terbaru';

    protected static ?int $sort = 5;

    protected int|string|array $columnSpan = 'full';

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('pemohon') ?? false;
    }

    public function table(Table $table): Table
    {
        return $table
            ->poll('60s')
            ->emptyStateHeading('Anda belum memiliki pengajuan barang')
            ->recordUrl(fn (PengajuanBarang $record): ?string => PengajuanBarangResource::canView($record) ? PengajuanBarangResource::getUrl('view', ['record' => $record], panel: 'pemohon') : null)
            ->query(
                PengajuanBarang::query()
                    ->where('user_id', auth()->id())
                    ->latest('created_at')
            )
            ->columns([

                Tables\Columns\TextColumn::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->searchable()
                    ->sortable()
                    ->weight('medium'),

                Tables\Columns\TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable()
                    ->wrap(),

                Tables\Columns\TextColumn::make('jumlah')
                    ->label('Jumlah')
                    ->alignCenter(),

                Tables\Columns\TextColumn::make('status')
                    ->label('Status')
                    ->formatStateUsing(fn (string $state): string => match ($state) {
                        'Open' => 'Menunggu', 'In Progress' => 'Diproses', 'Close' => 'Selesai', default => $state
                    })
                    ->badge()
                    ->color(fn (string $state): string => match ($state) {
                        'Open' => 'warning',
                        'In Progress' => 'info',
                        'Close' => 'success',
                        default => 'gray',
                    }),

                Tables\Columns\TextColumn::make('created_at')
                    ->label('Diajukan')
                    ->dateTime('d M Y H:i')
                    ->sortable(),
            ])
            ->defaultSort('created_at', 'desc')
            ->defaultPaginationPageOption(5)
            ->paginated([5]);
    }
}
