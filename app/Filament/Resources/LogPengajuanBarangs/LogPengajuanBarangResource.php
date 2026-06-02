<?php

namespace App\Filament\Resources\LogPengajuanBarangs;

use App\Filament\Resources\LogPengajuanBarangs\Pages\CreateLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Pages\EditLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Pages\ListLogPengajuanBarangs;
use App\Filament\Resources\LogPengajuanBarangs\Pages\ViewLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Schemas\LogPengajuanBarangForm;
use App\Filament\Resources\LogPengajuanBarangs\Schemas\LogPengajuanBarangInfolist;
use App\Filament\Resources\LogPengajuanBarangs\Tables\LogPengajuanBarangsTable;
use App\Models\LogPengajuanBarang;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class LogPengajuanBarangResource extends Resource
{
    protected static ?string $model = LogPengajuanBarang::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'app\Models\Modules\Pengajuan\Models\LogPengajuan';

    public static function form(Schema $schema): Schema
    {
        return LogPengajuanBarangForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return LogPengajuanBarangInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return LogPengajuanBarangsTable::configure($table);
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
            'index' => ListLogPengajuanBarangs::route('/'),
            'create' => CreateLogPengajuanBarang::route('/create'),
            'view' => ViewLogPengajuanBarang::route('/{record}'),
            'edit' => EditLogPengajuanBarang::route('/{record}/edit'),
        ];
    }
}
