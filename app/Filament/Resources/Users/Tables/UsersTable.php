<?php

namespace App\Filament\Resources\Users\Tables;

use Filament\Actions\EditAction;
use Filament\Tables\Table;

class UsersTable
{
    public static function configure(Table $table): Table
    {
        return $table
            ->columns([
                //
                // TextColumn::make('index')->label('No')->rowIndex(),
                // TextColumn::make('name')->label('Nama Pengguna')->searchable()->sortable(),
                // TextColumn::make('email')->label('Email')->searchable()->sortable(),
                // // TextColumn::make('password')->label('Password'),
                // TextColumn::make('role')->label('Role')->searchable()->sortable(),
            ])
            ->filters([
                //

            ])
            ->recordActions([
                EditAction::make(),

            ])
        ;
    }
}
