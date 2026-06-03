<?php

namespace App\Filament\Resources\LogPerbaikans;

use App\Filament\Resources\LogPerbaikans\Pages\CreateLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Pages\EditLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Pages\ListLogPerbaikans;
use App\Filament\Resources\LogPerbaikans\Pages\ViewLogPerbaikan;
use App\Filament\Resources\LogPerbaikans\Schemas\LogPerbaikanForm;
use App\Filament\Resources\LogPerbaikans\Schemas\LogPerbaikanInfolist;
use App\Filament\Resources\LogPerbaikans\Tables\LogPerbaikansTable;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;

use BackedEnum;
use UnitEnum;
use Filament\Resources\Resource;
use Filament\Support\Icons\Heroicon;

// Filament Forms imports
use Filament\Schemas\Schema;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;

// Filament Tables(Data) imports
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

class LogPerbaikanResource extends Resource
{
    protected static ?string $slug = 'log-perbaikan';
    protected static ?string $model = LogPerbaikan::class;
    protected static ?string $pluralLabel = 'Timeline Perbaikan';

    // protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-clock';
    protected static UnitEnum|string|null $navigationGroup = 'Monitoring';
    protected static ?string $navigationLabel = 'Timeline Perbaikan';
    protected static ?string $recordTitleAttribute = 'LogPerbaikan';

    public static function form(Schema $schema): Schema
    {
        return LogPerbaikanForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return LogPerbaikanInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([

                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex(),

                TextColumn::make('tiket.id')
                    ->label('Kode Tiket')
                    ->searchable(),

                TextColumn::make('user.name')
                    ->label('User'),

                BadgeColumn::make('kategori_log')
                    ->label('Kategori')
                    ->colors([
                        'primary' => 'Update',
                        'success' => 'Komentar',
                        'warning' => 'Status',
                    ]),

                TextColumn::make('data_lama')
                    ->label('Sebelumnya'),

                TextColumn::make('data_baru')
                    ->label('Perubahan'),

                TextColumn::make('keterangan')
                    ->wrap(),

                TextColumn::make('created_at')
                    ->dateTime('d M Y H:i:s'),
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
            'index' => ListLogPerbaikans::route('/'),
            'create' => CreateLogPerbaikan::route('/create'),
            'view' => ViewLogPerbaikan::route('/{record}'),
            'edit' => EditLogPerbaikan::route('/{record}/edit'),
        ];
    }

    public static function canCreate(): bool
    {
        return false;
    }

    public static function canEdit($record): bool
    {
        return false;
    }

    public static function canDelete($record): bool
    {
        return false;
    }
}
