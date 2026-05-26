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

use UnitEnum;
use BackedEnum;
use Filament\Tables;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\ViewAction;
use Filament\Actions\EditAction;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Tables\Columns\TextColumn;
use Filament\Resources\Resource;
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Table;

class TicketServiceResource extends Resource
{
    protected static ?string $model = TicketService::class;

    // url slug untuk resource, Navigation label, dan icon
    protected static ?string $slug = 'ticket-services';
    protected static ?string $navigationLabel = 'Tiket Perbaikan';
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-wrench-screwdriver';
    protected static UnitEnum|string|null $navigationGroup = 'Service Desk';
    protected static ?int $navigationSort = 1;
    protected static ?string $recordTitleAttribute = 'TiketPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                Select::make('ruangan_id')
                    ->relationship('ruangan', 'nama_ruangan')
                    ->searchable()
                    ->preload()
                    ->required(),

                TextInput::make('judul')
                    ->required()
                    ->maxLength(255),

                Textarea::make('deskripsi')
                    ->required()
                    ->rows(5),

                Select::make('prioritas')
                    ->options([
                        'Low' => 'Low',
                        'Medium' => 'Medium',
                        'High' => 'High',
                        'Critical' => 'Critical',
                    ])
                    ->default('Medium')
                    ->required(),

                Select::make('status')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Pending' => 'Pending',
                        'Completed' => 'Completed',
                        'Closed' => 'Closed',
                    ])
                    ->default('Open')
                    ->required(),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return TicketServiceInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                TextColumn::make('id')
                    ->label('Id Tiket')
                    ->searchable(),

                TextColumn::make('Keluhan')
                    ->searchable(),

                TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan'),

                TextColumn::make('status')
                    ->badge(),

                TextColumn::make('prioritas')
                    ->badge(),

                TextColumn::make('created_at')
                    ->dateTime('d M Y'),
                TextColumn::make('updated_at')
                    ->dateTime('d M Y'),

            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
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
