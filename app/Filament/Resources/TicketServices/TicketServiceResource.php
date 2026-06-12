<?php

namespace App\Filament\Resources\TicketServices;

use App\Filament\Resources\TicketServices\Pages\CreateTicketService;
use App\Filament\Resources\TicketServices\Pages\EditTicketService;
use App\Filament\Resources\TicketServices\Pages\ListTicketServices;
use App\Filament\Resources\TicketServices\Pages\ViewTicketService;
use App\Models\Modules\Perbaikan\models\TiketPerbaikan as TicketService;
use BackedEnum;

/* FILAMENT IMPORT */
use Filament\Support\Colors\Color;
// Filament Actions imports
use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
use Filament\Forms\Components\Select;
// Filament Forms imports
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;
// Filament Resources imports
use Filament\Infolists\Components\ViewEntry;
use Filament\Resources\Resource;
use Filament\Schemas\Components\Section;
// Filament Details imports
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;
use UnitEnum;

class TicketServiceResource extends Resource
{
    protected static ?string $model = TicketService::class;

    // url slug
    protected static ?string $slug = 'ticket-services';

    // navigation
    protected static UnitEnum|string|null $navigationGroup = 'Service Desk'; // Navigation Group

    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-wrench-screwdriver'; // Navigation Icon

    protected static ?string $navigationLabel = 'Tiket Perbaikan'; // Navigation Label

    protected static ?int $navigationSort = 1;

    protected static ?string $recordTitleAttribute = 'keluhan';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                Select::make('user_id')
                    ->relationship(
                        'user',
                        'name'
                    )
                    ->label('Nama Pemohon')
                    ->searchable()
                    ->preload()
                    ->required(),
                Select::make('ruangan_id')
                    ->relationship(
                        'ruangan',
                        'nama_ruangan'
                    )
                    ->label('Nama Ruangan')
                    ->searchable()
                    ->preload()
                    ->required(),

                TextInput::make('keluhan')
                    ->label('Keluhan')
                    ->required()
                    ->maxLength(255),

                Select::make('kepemilikan')
                    ->options([
                        'Inventaris Kantor' => 'Inventaris Kantor',
                        'Pribadi' => 'Pribadi',
                        'Lainnya' => 'Lainnya',
                    ])
                    ->label('Kepemilikan')
                    ->required(),

                Textarea::make('deskripsi')
                    ->label('Deskripsi')
                    ->rows(5)
                    ->required(),
                Select::make('status')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Close' => 'Closed',
                    ])
                    ->default('Open')
                    ->label('Status Tiket')
                    ->required()
                    ->disabled(),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return $schema
            ->columns(1)
            ->schema([

                Section::make('Informasi Tiket')
                    ->columns(2)
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('kode_tiket')
                            ->label('Nomor Tiket'),

                        TextEntry::make('user.name')
                            ->label('Nama Pemohon'),

                        TextEntry::make('ruangan.nama_ruangan')
                            ->label('Ruangan'),

                        TextEntry::make('keluhan'),

                        TextEntry::make('kepemilikan'),
                        TextEntry::make('status')
                            ->badge()
                            ->color(fn(string $state) => match ($state) {
                                'Open' => 'danger',
                                'In Progress' => 'warning',
                                'Close' => 'success',
                                default => 'gray',
                            }),
                        TextEntry::make('close_outcome')
                            ->label('Hasil Close')
                            ->badge()
                            ->color(fn(?string $state): string => match ($state) {
                                'Completed' => 'success',
                                'Rejected' => 'danger',
                                default => 'gray',
                            }),

                        TextEntry::make('created_at')
                            ->dateTime(),

                        TextEntry::make('updated_at')
                            ->dateTime(),

                    ]),
                Section::make('Deskripsi Kerusakan')
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('deskripsi')
                            ->columnSpanFull(),

                    ]),

                Section::make('Timeline Aktivitas')
                    ->columnSpanFull()
                    ->schema([
                        ViewEntry::make('id')
                            ->view('filament.pages.tiket.timeline'),
                    ]),

                Section::make('Diskusi')
                    ->columnSpanFull()
                    ->schema([

                        ViewEntry::make('id')
                            ->view(
                                'filament.pages.tiket.chat'
                            ),


                    ]),
            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex(),

                TextColumn::make('user.name')
                    ->label('Pemohon'),

                TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan'),

                TextColumn::make('keluhan')
                    ->label('Keluhan')
                    ->wrap()
                    ->searchable(),

                TextColumn::make('status')
                    ->badge()
                    ->color(fn(string $state) => match ($state) {
                        'Open' => 'danger',
                        'In Progress' => 'warning',
                        'Close' => 'success',
                        default => 'gray',
                    }),
                TextColumn::make('close_outcome')
                    ->badge()
                    ->color(fn(?string $state): string => match ($state) {
                        'Completed' => 'success',
                        'Rejected' => 'danger',
                        default => 'gray',
                    }),
                TextColumn::make('created_at')->dateTime('d M Y'),

            ])

            ->actions([
                Action::make('ambil_tiket')
                    ->label('Ambil Tiket')
                    ->icon('heroicon-o-wrench-screwdriver')
                    ->visible(
                        fn($record) => $record->status === 'Open'
                    )
                    ->action(function ($record) {

                        $record->updateStatus(
                            'In Progress',
                            'Tiket mulai dikerjakan oleh '
                            . auth()->user()->name
                        );

                    }),
                Action::make('selesai')
                    ->label('Selesai')
                    ->icon('heroicon-o-check-circle')
                    ->color('success')
                    ->visible(
                        fn($record) => $record->status === 'In Progress'
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->required(),
                    ])
                    ->action(function ($record, array $data) {

                        $record->closeAsCompleted(
                            $data['catatan']
                        );

                    }),
                Action::make('tolak')
                    ->label('Tolak')
                    ->color('danger')
                    ->icon('heroicon-o-x-circle')
                    ->visible(
                        fn($record) => $record->status === 'In Progress'
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->required(),
                    ])
                    ->action(function ($record, array $data) {

                        $record->closeAsRejected(
                            $data['catatan']
                        );

                    }),
                Action::make('reopen')
                    ->label('Reopen Ticket')
                    ->color('primary')
                    ->icon('heroicon-o-arrow-path')
                    ->visible(
                        fn($record) => $record->isClosed()
                    )
                    ->requiresConfirmation()
                    ->form([
                        Textarea::make('catatan')
                            ->label('Alasan Reopen')
                            ->required(),
                    ])
                    ->action(function ($record, array $data) {

                        $record->reopen(
                            $data['catatan']
                        );

                    }),
                ViewAction::make(),
                EditAction::make()
                    ->visible(function ($record) {

                        if (
                            auth()->user()->hasRole('admin')
                            || auth()->user()->hasRole('super_admin')
                        ) {
                            return true;
                        }

                        return !$record->isLocked();
                    }),
                DeleteAction::make()
                    ->visible(function ($record) {

                        if (
                            auth()->user()->hasRole('admin')
                            || auth()->user()->hasRole('super_admin')
                        ) {
                            return true;
                        }

                        return !$record->isLocked();
                    }),
            ])
            ->actionsColumnLabel('Action Button');

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
            'super_admin',
            'admin',
        ]);
    }
}
