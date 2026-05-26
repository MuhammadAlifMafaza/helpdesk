<?php

namespace App\Filament\Resources\LogPerbaikans;

use App\Filament\Resources\LogPerbaikans\Pages\CreateLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Pages\EditLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Pages\ListLogPerbaikans;
use App\Filament\Resources\LogPerbaikans\Pages\ViewLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Schemas\LogPerbaikanForm;
use App\Filament\Resources\LogPerbaikans\Schemas\LogPerbaikanInfolist;
use App\Filament\Resources\LogPerbaikans\Tables\LogPerbaikansTable;
use App\Models\LogPerbaikan;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class LogPerbaikanResource extends Resource
{
    protected static ?string $model = LogPerbaikan::class;
    protected static ?string $slug = 'log-perbaikan';

    protected static ?string $navigationGroup = 'Monitoring';

    protected static ?string $navigationLabel = 'Timeline Perbaikan';

    protected static ?string $navigationIcon = 'heroicon-o-clock';
    protected static ?string $recordTitleAttribute = 'LogPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return LogPerbaikanForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return LogPerbaikanInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return LogPerbaikansTable::configure($table);
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
            'index' => ListLogPerbaikans::route('/'),
            'create' => CreateLogPerbaikan::route('/create'),
            'view' => ViewLogPerbaikan::route('/{record}'),
            'edit' => EditLogPerbaikan::route('/{record}/edit'),
        ];
    }
}
