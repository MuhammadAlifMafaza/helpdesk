<?php

namespace App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs;

use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Pages\CreateLogPengajuanBarang;
use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Pages\EditLogPengajuanBarang;
use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Pages\ListLogPengajuanBarangs;
use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Schemas\LogPengajuanBarangForm;
use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Tables\LogPengajuanBarangsTable;
use App\Models\Monitoring\LogPengajuanBarang;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class LogPengajuanBarangResource extends Resource
{
    protected static ?string $model = LogPengajuanBarang::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'LogPengajuan';

    public static function form(Schema $schema): Schema
    {
        return LogPengajuanBarangForm::configure($schema);
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
            'edit' => EditLogPengajuanBarang::route('/{record}/edit'),
        ];
    }
}
