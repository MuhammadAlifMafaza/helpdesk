<?php

namespace App\Filament\Resources\PengajuanBarangs;

use App\Filament\Resources\PengajuanBarangs\Pages\CreatePengajuanBarang;
use App\Filament\Resources\PengajuanBarangs\Pages\EditPengajuanBarang;
use App\Filament\Resources\PengajuanBarangs\Pages\ListPengajuanBarangs;
use App\Filament\Resources\PengajuanBarangs\Pages\ViewPengajuanBarang;
use App\Filament\Resources\PengajuanBarangs\Schemas\PengajuanBarangForm;
use App\Filament\Resources\PengajuanBarangs\Schemas\PengajuanBarangInfolist;
use App\Filament\Resources\PengajuanBarangs\Tables\PengajuanBarangsTable;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;

use BackedEnum;
use UnitEnum;

use Filament\Support\Icons\Heroicon;
use Filament\Resources\Resource;

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
use Filament\Schemas\Components\Section;
// Filament Details imports
use Filament\Schemas\Schema;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Table;

class PengajuanBarangResource extends Resource
{
    protected static ?string $model = PengajuanBarang::class;


    protected static ?string $slug = 'pengajuan-barang';
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-cube';
    protected static UnitEnum|string|null $navigationGroup = 'Service Desk';
    protected static ?string $pluralLabel = 'Pengajuan Barang';
    protected static ?string $navigationLabel = 'Pengajuan Barang';
    protected static ?string $recordTitleAttribute = 'PengajuanBarang';

    public static function form(Schema $schema): Schema
    {
        return $schema
            ->schema([
                Select::make('user_id')
                    ->label('Pemohon')
                    ->relationship(
                        'user',
                        'name'
                    )
                    ->searchable()
                    ->preload()
                    ->required(),

                TextInput::make('nama_barang')
                    ->required()
                    ->maxLength(255),

                TextInput::make('jumlah')
                    ->numeric()
                    ->default(1)
                    ->required(),

                Textarea::make('alasan')
                    ->rows(4)
                    ->required(),

                Select::make('status')
                    ->options([
                        'Open' => 'Open',
                        'In Progress' => 'In Progress',
                        'Close' => 'Close',
                        // 'Close' => 'Rejected',
                    ])
                    ->default('Open')
                    ->required(),
            ]);
    }

    public static function infolist(Schema $schema): Schema
    {
        return PengajuanBarangInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex(),

                TextColumn::make('user.name')
                    ->label('Pemohon')
                    ->searchable(),

                TextColumn::make('nama_barang')
                    ->searchable(),

                TextColumn::make('jumlah')
                    ->sortable(),

                TextColumn::make('status')
                    ->badge()
                    ->color(fn(string $state) => match ($state) {
                        'Open' => 'danger',
                        'In Progress' => 'warning',
                        'Close' => 'success',
                        default => 'gray',
                    }),

                TextColumn::make('status_outcome')
                    ->badge()
                    ->color(fn(?string $state): string => match ($state) {
                        'Completed' => 'success',
                        'Reopen' => 'primary',
                        'Rejected' => 'danger',
                        default => 'gray',
                    }),

                TextColumn::make('created_at')
                    ->dateTime('d/m/Y H:i'),
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
                            'Pengajuan Barang telah ditangani Oleh '
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
            'index' => ListPengajuanBarangs::route('/'),
            'create' => CreatePengajuanBarang::route('/create'),
            'view' => ViewPengajuanBarang::route('/{record}'),
            'edit' => EditPengajuanBarang::route('/{record}/edit'),
        ];
    }
}
