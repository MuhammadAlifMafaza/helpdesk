<?php

namespace App\Filament\Resources\TicketServices\Tables;

use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Table;

class TicketServicesTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                // kolom data
                TextColumn::make('index')->label('No')->rowIndex(),
                TextColumn::make('Keluhan')->label('Nama Layanan')->searchable()->sortable(),
                TextColumn::make('kepemilikan')->label('Kepemilikan')->searchable()->sortable()->toggleable(),
                TextColumn::make('deskripsi')->label('Deskripsi')->searchable()->sortable()->toggleable(isToggledHiddenByDefault: true),
                TextColumn::make('status')->label('Status')->searchable()->sortable(),

            ])
            ->filters([
                SelectFilter::make('status')
                    ->options([
                        'Open' => 'Menunggu',
                        'In Progress' => 'Diproses',
                        'Close' => 'Ditutup',
                    ]),
                SelectFilter::make('kepemilikan')
                    ->options([
                        'Inventaris Kantor' => 'Inventaris Kantor',
                        'Pribadi' => 'Pribadi',
                        'Lainnya' => 'Lainnya',
                    ]),
            ])
            ->recordActions([
                ViewAction::make(),
                EditAction::make(),
                DeleteAction::make(),
            ]);
    }
}
