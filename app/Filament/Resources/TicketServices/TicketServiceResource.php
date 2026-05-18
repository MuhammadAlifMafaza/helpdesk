<?php

namespace App\Filament\Resources\TicketServices;

use App\Filament\Resources\TicketServices\Pages\CreateTicketService;
use App\Filament\Resources\TicketServices\Pages\EditTicketService;
use App\Filament\Resources\TicketServices\Pages\ListTicketServices;
use App\Filament\Resources\TicketServices\Pages\ViewTicketService;
use App\Filament\Resources\TicketServices\Schemas\TicketServiceForm;
use App\Filament\Resources\TicketServices\Schemas\TicketServiceInfolist;
use App\Filament\Resources\TicketServices\Tables\TicketServicesTable;
use App\Models\Modules\Perbaikan\models\TiketPerbaikan as TicketService;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class TicketServiceResource extends Resource
{
    protected static ?string $model = TicketService::class;

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedRectangleStack;

    protected static ?string $recordTitleAttribute = 'TiketPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return TicketServiceForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return TicketServiceInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return TicketServicesTable::configure($table);
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
            'index' => ListTicketServices::route('/'),
            'create' => CreateTicketService::route('/create'),
            'view' => ViewTicketService::route('/{record}'),
            'edit' => EditTicketService::route('/{record}/edit'),
        ];
    }

    public static function canViewAny(): bool
    {
        return auth()->user()->hasAnyRole([
            'admin',
            'teknisi',
            'super_admin',
        ]);
    }

    public static function canCreate(): bool
    {
        return auth()->user()->hasAnyRole([
            'admin',
            'teknisi',
            'super_admin',
        ]);
    }

    public static function canEdit($record): bool
    {
        return auth()->user()->hasAnyRole([
            'admin',
            'teknisi',
            'super_admin',
        ]);
    }

    public static function canDelete($record): bool
    {
        return auth()->user()->hasAnyRole([
            'admin',
            'super_admin',
        ]);
    }
}
