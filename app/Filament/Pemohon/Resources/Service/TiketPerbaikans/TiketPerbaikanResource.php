<?php

namespace App\Filament\Pemohon\Resources\Service\TiketPerbaikans;

use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\CreateTiketPerbaikan;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\EditTiketPerbaikan;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\ListTiketPerbaikans;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\ViewTiketPerbaikan;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Schemas\TiketPerbaikanForm;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Schemas\TiketPerbaikanInfolist;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Tables\TiketPerbaikansTable;
use App\Models\Service\TiketPerbaikan;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class TiketPerbaikanResource extends Resource
{
    protected static ?string $model = TiketPerbaikan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'TiketPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return TiketPerbaikanForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return TiketPerbaikanInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return TiketPerbaikansTable::configure($table);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => ListTiketPerbaikans::route('/'),
            'create' => CreateTiketPerbaikan::route('/create'),
            'view' => ViewTiketPerbaikan::route('/{record}'),
            'edit' => EditTiketPerbaikan::route('/{record}/edit'),
        ];
    }
}
