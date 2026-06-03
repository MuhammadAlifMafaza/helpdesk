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

// Filament Forms imports
use Filament\Schemas\Schema;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;

// Filament Tables imports
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Filters\Filter;
use Filament\Actions\Action;
use Filament\Forms\Components\DatePicker;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\BulkAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\ViewAction;
use Filament\Actions\EditAction;


class PengajuanBarangResource extends Resource
{
    protected static ?string $model = PengajuanBarang::class;


    protected static ?string $slug = 'pengajuan-barang';
    protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-archive-box';
    protected static UnitEnum|string|null $navigationGroup = 'Service Desk';
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

                BadgeColumn::make('status')
                    ->colors([
                        'warning' => 'Open',
                        'info' => 'In Progress',
                        'success' => 'Close',
                        // 'danger' => 'Close',
                    ]),

                TextColumn::make('created_at')
                    ->dateTime('d/m/Y H:i'),
            ])
            ->actions([
                ViewAction::make(),
                EditAction::make(),
            ])
            ->defaultSort('created_at', 'desc');
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
