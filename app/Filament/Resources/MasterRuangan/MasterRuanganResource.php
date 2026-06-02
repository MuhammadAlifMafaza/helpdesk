<?php

namespace App\Filament\Resources\MasterRuangan;

use App\Filament\Resources\MasterRuangan\Pages\CreateMasterRuangan;
use App\Filament\Resources\MasterRuangan\Pages\EditMasterRuangan;
use App\Filament\Resources\MasterRuangan\Pages\ListMasterRuangan;
use App\Filament\Resources\MasterRuangan\Pages\ViewMasterRuangan;
use App\Filament\Resources\MasterRuangan\Schemas\MasterRuanganForm;
use App\Filament\Resources\MasterRuangan\Schemas\MasterRuanganInfolist;
use App\Filament\Resources\MasterRuangan\Tables\MasterRuanganTable;
use App\Models\Modules\Master\Models\MasterRuangan;

// import untuk enum data and form
use Filament\Forms\Form;
use Filament\Tables\Table;

use Filament\Forms\Components\TextInput;

use Filament\Tables\Columns\TextColumn;
use Filament\Tables;
use UnitEnum;
use BackedEnum;
use Filament\Actions\EditAction;
use Filament\Actions\DeleteAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;


class MasterRuanganResource extends Resource
{
    protected static ?string $slug = 'master-ruangan';
    protected static ?string $model = MasterRuangan::class;
    protected static ?string $navigationLabel = 'Master Ruangan';
    protected static ?string $recordTitleAttribute = 'Master Ruangan';
    protected static UnitEnum|string|null $navigationGroup = 'Master Data';
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-building-office';
    protected static ?int $navigationSort = 2;

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([

                TextInput::make('nama_ruangan')
                    ->required()
                    ->maxLength(255),

                TextInput::make('nama_gedung')
                    ->required()
                    ->maxLength(255),
                TextInput::make('created_at')
                    ->disabled()
                    ->label('Tanggal Dibuat')
                    ->dateTime('d M Y H:i:s'),
                TextInput::make('updated_at')
                    ->disabled()
                    ->label('Tanggal Diperbarui')
                    ->dateTime('d M Y H:i:s'),
            ]);

    }

    public static function infolist(Schema $schema): Schema
    {
        return MasterRuanganInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        // return MasterRuanganTable::configure($table);
        return $table
            ->columns([
                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex()
                    ->sortable(),

                TextColumn::make('nama_ruangan')
                    ->searchable(),

                TextColumn::make('nama_gedung')
                    ->searchable(),

                TextColumn::make('created_at')
                    ->dateTime('d M Y H:i'),
            ])
            ->actions([
                EditAction::make(),
                DeleteAction::make(),
            ])
            ->bulkActions([
                DeleteBulkAction::make(),
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
            'index' => ListMasterRuangan::route('/'),
            'create' => CreateMasterRuangan::route('/create'),
            'view' => ViewMasterRuangan::route('/{record}'),
            'edit' => EditMasterRuangan::route('/{record}/edit'),
        ];
    }
    public static function canViewAny(): bool
    {
        return auth()->check() &&
            auth()->user()->hasAnyRole([
                'admin',
                'teknisi',
                'super_admin'
            ]);
    }

}
