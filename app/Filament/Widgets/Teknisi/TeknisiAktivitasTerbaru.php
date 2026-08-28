<?php

namespace App\Filament\Widgets\Teknisi;

use App\Models\Modules\Teknisi\Models\KegiatanTeknisi;
use Filament\Actions\BulkActionGroup;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget;
use Illuminate\Database\Eloquent\Builder;

class TeknisiAktivitasTerbaru extends TableWidget
{
    public function table(Table $table): Table
    {
        return $table
            ->query(fn (): Builder => KegiatanTeknisi::query())
            ->columns([
                //
            ])
            ->filters([
                //
            ])
            ->headerActions([
                //
            ])
            ->recordActions([
                //
            ])
            ->toolbarActions([
                BulkActionGroup::make([
                    //
                ]),
            ]);
    }
}
