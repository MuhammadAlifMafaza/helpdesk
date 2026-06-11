<?php

namespace App\Filament\Resources\KegiatanTeknisi;

use App\Filament\Resources\KegiatanTeknisi\Pages\CreateKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\EditKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ListKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ViewKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Schemas\KegiatanTeknisiForm;
use App\Filament\Resources\KegiatanTeknisi\Schemas\KegiatanTeknisiInfolist;
use App\Filament\Resources\KegiatanTeknisi\Tables\KegiatanTeknisiTable;
use app\Models\Modules\Log\Models\LogHarian as KegiatanTeknisi;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class KegiatanTeknisiResource extends Resource
{
    protected static ?string $model = KegiatanTeknisi::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'LogHarian';

    public static function form(Schema $schema): Schema
    {
        return KegiatanTeknisiForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return KegiatanTeknisiInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return KegiatanTeknisiTable::configure($table);
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
            'index' => ListKegiatanTeknisi::route('/'),
            'create' => CreateKegiatanTeknisi::route('/create'),
            'view' => ViewKegiatanTeknisi::route('/{record}'),
            'edit' => EditKegiatanTeknisi::route('/{record}/edit'),
        ];
    }
}
