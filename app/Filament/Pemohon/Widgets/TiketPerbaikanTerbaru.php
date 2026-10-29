<?php

namespace App\Filament\Pemohon\Widgets;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget;

class TiketPerbaikanTerbaru extends TableWidget
{
    protected static bool $isLazy = true;

    protected static ?string $heading = 'Tiket Perbaikan Terbaru';

    protected static ?int $sort = 4;

    protected int|string|array $columnSpan = 'full';

    public static function canView(): bool
    {
        return auth()->user()?->hasRole('pemohon') ?? false;
    }

    public function table(Table $table): Table
    {
        return $table
            ->poll('60s')
            ->emptyStateHeading('Anda belum memiliki tiket perbaikan')
            ->recordUrl(fn (TiketPerbaikan $record): ?string => TiketPerbaikanResource::canView($record) ? TiketPerbaikanResource::getUrl('view', ['record' => $record], panel: 'pemohon') : null)
            ->query(
                TiketPerbaikan::query()
                    ->where('user_id', auth()->id())
                    ->with('ruangan')
                    ->latest('created_at')
            )
            ->columns([

                Tables\Columns\TextColumn::make('kode_tiket')
                    ->label('Kode Tiket')
                    ->searchable()
                    ->sortable()
                    ->weight('medium'),

                Tables\Columns\TextColumn::make('keluhan')
                    ->label('Keluhan')
                    ->limit(45)
                    ->wrap(),

                Tables\Columns\TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan')
                    ->placeholder('-'),

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
