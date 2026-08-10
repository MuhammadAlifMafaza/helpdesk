<?php

namespace App\Filament\Pemohon\Resources\Service\PengajuanBarangs;

use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages\CreatePengajuanBarang;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages\EditPengajuanBarang;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages\ListPengajuanBarangs;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages\ViewPengajuanBarang;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas\PengajuanBarangForm;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Schemas\PengajuanBarangInfolist;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Tables\PengajuanBarangsTable;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use BackedEnum;
use UnitEnum;

use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class PengajuanBarangResource extends Resource
{
    protected static ?string $model = PengajuanBarang::class;
    protected static ?string $slug = 'pengajuan-barang';
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-cube';
    protected static UnitEnum|string|null $navigationGroup = 'Pelayanan';
    protected static ?string $pluralLabel = 'Pengajuan Barang';
    protected static ?string $navigationLabel = 'Pengajuan Barang';
    protected static ?string $recordTitleAttribute = 'PengajuanBarang';

    public static function form(Schema $schema): Schema
    {
        return PengajuanBarangForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return PengajuanBarangInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return PengajuanBarangsTable::configure($table);
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
            'index' => ListPengajuanBarangs::route('/'),
            'create' => CreatePengajuanBarang::route('/create'),
            'view' => ViewPengajuanBarang::route('/{record}'),
            'edit' => EditPengajuanBarang::route('/{record}/edit'),
        ];
    }
}
