<?php

namespace App\Filament\Widgets\Admin;

use App\Filament\Resources\PengajuanBarangs\PengajuanBarangResource;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget;

class AdminPengajuanTerbaru extends TableWidget
{
    protected static bool $isLazy = true;

    protected static ?string $heading = 'Pengajuan Barang Terbaru';

    protected int|string|array $columnSpan = 'full';

    protected static ?int $sort = 6;

    protected function getTablePollingInterval(): ?string
    {
        return '30s';
    }

    public function table(Table $table): Table
    {
        return $table
            ->poll('60s')
            ->emptyStateHeading('Belum ada pengajuan barang')
            ->recordUrl(fn (PengajuanBarang $record): ?string => PengajuanBarangResource::canView($record) ? PengajuanBarangResource::getUrl('view', ['record' => $record], panel: 'admin') : null)
            ->query(
                PengajuanBarang::query()
                    ->with('user')
                    ->latest('created_at')
            )
            ->columns([

                Tables\Columns\TextColumn::make('kode_pengajuan')
                    ->label('Kode Pengajuan')
                    ->searchable()
                    ->sortable(),

                Tables\Columns\TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable(),

                Tables\Columns\TextColumn::make('nama_barang')
                    ->label('Nama Barang')
                    ->searchable(),

                Tables\Columns\TextColumn::make('jumlah')
                    ->label('Jumlah')
                    ->numeric(),

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
            ->defaultPaginationPageOption(5)
            ->paginated([5, 10, 25]);
    }

    public static function canView(): bool
    {
        return auth()->user()?->hasAnyRole([
            'admin',
            'super_admin',
        ]) ?? false;
    }
}
