<?php

namespace App\Filament\Resources\LogPengajuanBarangs;

use App\Filament\Resources\LogPengajuanBarangs\Pages\CreateLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Pages\EditLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Pages\ListLogPengajuanBarangs;
use App\Filament\Resources\LogPengajuanBarangs\Pages\ViewLogPengajuanBarang;
use App\Filament\Resources\LogPengajuanBarangs\Schemas\LogPengajuanBarangForm;
use App\Filament\Resources\LogPengajuanBarangs\Schemas\LogPengajuanBarangInfolist;
use App\Filament\Resources\LogPengajuanBarangs\Tables\LogPengajuanBarangsTable;
use App\Models\Modules\Pengajuan\Models\LogPengajuan;

use UnitEnum;
use BackedEnum;
use Filament\Resources\Resource;
use Filament\Support\Icons\Heroicon;

// Filament Forms imports
use Filament\Schemas\Schema;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\DatePicker;

// Filament Tables(Data) imports
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\BadgeColumn;
use Filament\Tables\Filters\Filter;
use Filament\Actions\Action;
use Illuminate\Database\Eloquent\Builder;
use Filament\Tables\Actions\BulkAction;
use Filament\Actions\DeleteBulkAction;
use Filament\Actions\ViewAction;
use Filament\Actions\EditAction;


class LogPengajuanBarangResource extends Resource
{
    protected static ?string $slug = 'log-pengajuan-barang';
    protected static ?string $model = LogPengajuan::class; // Model yang digunakan untuk resource ini
    protected static ?string $navigationLabel = 'Timeline Pengajuan Barang'; // Label yang muncul di navigasi
    protected static ?string $pluralLabel = 'Timeline Pengajuan Barang'; // Label jamak untuk resource ini
    protected static ?string $modelLabel = 'LogPengajuan'; // Label untuk model, digunakan dalam berbagai tempat di Filament

    // protected static string|BackedEnum|null $navigationIcon = 'heroicon-o-clock';
    protected static UnitEnum|string|null $navigationGroup = 'Monitoring';
    protected static ?string $recordTitleAttribute = 'LogPengajuan';

    public static function form(Schema $schema): Schema
    {
        return LogPengajuanBarangForm::configure($schema);
    }

    public static function infolist(Schema $schema): Schema
    {
        return LogPengajuanBarangInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->headerActions([

            ])
            ->columns([
                TextColumn::make('index')
                    ->label('#')
                    ->rowIndex(),

                TextColumn::make('pengajuan.id')
                    ->label('Kode Pengajuan')
                    ->searchable(),

                TextColumn::make('user.name')
                    ->label('User'),

                BadgeColumn::make('kategori_log')
                    ->label('Kategori Log')
                    ->colors([
                        'primary' => 'Status',
                        'success' => 'Perubahan Data',
                        'warning' => 'Catatan',
                    ]),

                TextColumn::make('keterangan')
                    ->label('Keterangan')
                    ->searchable(),

                TextColumn::make('created_at')
                    ->label('Waktu Log')
                    ->dateTime('d M Y H:i:s')
                    ->searchable(
                        query: fn(Builder $query, string $search) =>
                        $query->whereDate('created_at', $search)
                    ),
            ])
            ->defaultSort('created_at', 'desc')

            ->filters([
                Filter::make('created_at')
                    ->label('Filter Tanggal')
                    ->form([
                        DatePicker::make('from')
                            ->label('Dari Tanggal'),

                        DatePicker::make('until')
                            ->label('Sampai Tanggal'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['from'],
                                fn(Builder $query, $date) => $query->whereDate('created_at', '>=', $date)
                            )
                            ->when(
                                $data['until'],
                                fn(Builder $query, $date) => $query->whereDate('created_at', '<=', $date)
                            );
                    }),
                Filter::make('kategori_log')
                    ->label('Filter Kategori')
                    ->form([
                        Select::make('kategori_log')
                            ->options([
                                'Status' => 'Status',
                                'Perubahan Data' => 'Perubahan Data',
                                'Catatan' => 'Catatan',
                            ])
                            ->label('Kategori Log'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query->when(
                            $data['kategori_log'],
                            fn(Builder $query, $kategori) => $query->where('kategori_log', $kategori)
                        );
                    }),
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
            'index' => ListLogPengajuanBarangs::route('/'),
            'create' => CreateLogPengajuanBarang::route('/create'),
            'view' => ViewLogPengajuanBarang::route('/{record}'),
            'edit' => EditLogPengajuanBarang::route('/{record}/edit'),
        ];
    }
}
