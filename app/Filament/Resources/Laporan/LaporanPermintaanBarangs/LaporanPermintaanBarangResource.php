<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs;

use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages\CreateLaporanPermintaanBarang;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages\EditLaporanPermintaanBarang;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages\ListLaporanPermintaanBarangs;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages\ViewLaporanPermintaanBarang;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Schemas\LaporanPermintaanBarangForm;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Schemas\LaporanPermintaanBarangInfolist;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Tables\LaporanPermintaanBarangsTable;
use App\Models\Modules\Laporan\Models\LaporanPermintaanBarang;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class LaporanPermintaanBarangResource extends Resource
{
    protected static ?string $model = LaporanPermintaanBarang::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'LaporanPermintaanBarang';

    public static function form(Schema $schema): Schema
    {
        return LaporanPermintaanBarangForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return LaporanPermintaanBarangInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return LaporanPermintaanBarangsTable::configure($table);
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
            'index' => ListLaporanPermintaanBarangs::route('/'),
            'create' => CreateLaporanPermintaanBarang::route('/create'),
            'view' => ViewLaporanPermintaanBarang::route('/{record}'),
            'edit' => EditLaporanPermintaanBarang::route('/{record}/edit'),
        ];
    }
}
