<?php

namespace App\Filament\Resources\KegiatanTeknisi;

use App\Filament\Resources\KegiatanTeknisi\Pages\CreateKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\EditKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ListKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ViewKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Schemas\KegiatanTeknisiForm;
use App\Filament\Resources\KegiatanTeknisi\Schemas\KegiatanTeknisiInfolist;
use App\Filament\Resources\KegiatanTeknisi\Tables\KegiatanTeknisiTable;
use App\Models\Modules\Teknisi\Models\KegiatanTeknisi;

use UnitEnum;
use BackedEnum;

use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;

class KegiatanTeknisiResource extends Resource
{
    protected static ?string $model = KegiatanTeknisi::class;

    protected static ?string $plural = 'kegiatan-teknisi';
    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedBookOpen;
    protected static ?string $pluralLabel = 'Catatan Kegiatan Teknisi';
    protected static ?string $navigationLabel = 'Kegiatan Teknisi';
    protected static ?string $recordTitleAttribute = 'LogHarian';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                TextColumn::make('')
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return KegiatanTeknisiInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('id')
                    ->label('#'),

                TextColumn::make('tanggal')
                    ->label('Tanggal Kegiatan')
                    ->date('d/m/Y'),

                TextColumn::make('deskripsi_kegiatan')
                    ->label('Deskripsi Kegiatan'),


            ]);
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
