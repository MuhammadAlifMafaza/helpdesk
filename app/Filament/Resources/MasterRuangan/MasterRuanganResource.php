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
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class MasterRuanganResource extends Resource
{
    protected static ?string $model = MasterRuangan::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'app\Models\Modules\Master\Models\MasterRuangan.php';

    public static function form(Schema $schema): Schema
    {
        return MasterRuanganForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return MasterRuanganInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return MasterRuanganTable::configure($table);
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
