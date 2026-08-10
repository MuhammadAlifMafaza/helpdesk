<?php

namespace App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans;

use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Pages\CreateLogTiketPerbaikan;
use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Pages\EditLogTiketPerbaikan;
use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Pages\ListLogTiketPerbaikans;
use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Schemas\LogTiketPerbaikanForm;
use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Tables\LogTiketPerbaikansTable;
use App\Models\Monitoring\LogTiketPerbaikan;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class LogTiketPerbaikanResource extends Resource
{
    protected static ?string $model = LogTiketPerbaikan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'LogPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return LogTiketPerbaikanForm::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return LogTiketPerbaikansTable::configure($table);
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
            'index' => ListLogTiketPerbaikans::route('/'),
            'create' => CreateLogTiketPerbaikan::route('/create'),
            'edit' => EditLogTiketPerbaikan::route('/{record}/edit'),
        ];
    }
}
