<?php

namespace App\Filament\Resources\KegiatanTeknisi;

use App\Filament\Resources\KegiatanTeknisi\Pages\CreateKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\EditKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ListKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ViewKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Schemas\KegiatanTeknisiInfolist;
use App\Models\Modules\Teknisi\Models\KegiatanTeknisi;
use App\Models\User;
use BackedEnum;
use Filament\Actions\Action;
use Filament\Actions\DeleteAction;
use Filament\Actions\EditAction;
use Filament\Actions\ViewAction;
// Filament Action Imports
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Components\Hidden;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Resources\Resource;
// Filament Tables Import
use Filament\Schemas\Schema;
use Filament\Support\Icons\Heroicon;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Filters\SelectFilter;
use Filament\Tables\Filters\TrashedFilter;
use Filament\Tables\Table;
// Filament Forms Import
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use UnitEnum;

class KegiatanTeknisiResource extends Resource
{
    protected static ?string $model = KegiatanTeknisi::class;

    protected static ?string $slug = 'kegiatan-teknisi';

    protected static ?string $navigationLabel = 'Catatan Kegiatan';

    protected static ?string $pluralLabel = 'Catatan Kegiatan Teknisi';

    protected static UnitEnum|string|null $navigationGroup = 'Teknisi';

    protected static string|BackedEnum|null $navigationIcon = Heroicon::OutlinedClipboardDocumentList;

    protected static ?string $recordTitleAttribute = 'LogHarian';

    public static function form(
        Schema $schema
    ): Schema {

        return $schema

            ->schema([

                Hidden::make('teknisi_id')
                    ->default(auth()->id()),

                DatePicker::make('tanggal')
                    ->label('Tanggal')
                    ->required()
                    ->default(now()),

                Select::make('ruangan_id')
                    ->label('Ruangan')
                    ->relationship('ruangan', 'nama_ruangan')
                    ->searchable()
                    ->preload()
                    ->required(),

                Select::make('nama_petugas')
                    ->label('Nama Petugas')
                    ->multiple()
                    ->options(
                        User::query()
                            ->whereIn('role', ['teknisi', 'admin'])
                            ->pluck('name', 'id')
                            ->toArray()
                    )
                    ->dehydrateStateUsing(function ($state) {
                        if (blank($state)) {
                            return null;
                        }

                        return User::whereIn('id', $state)
                            ->pluck('name')
                            ->implode(', ');
                    })

                    ->searchable()
                    ->preload()
                    ->nullable(),

                Textarea::make('deskripsi_kegiatan')
                    ->label('Catatan Kegiatan')
                    ->rows(8)
                    ->required()
                    ->columnSpanFull(),

            ]);

    }

    public static function infolist(Schema $schema): Schema
    {
        return KegiatanTeknisiInfolist::configure($schema);
    }

    public static function table(Table $table): Table
    {
        return $table

            ->defaultSort('tanggal', 'desc')
            ->columns([
                TextColumn::make('teknisi.name')
                    ->label('Dibuat Oleh')
                    ->searchable(),

                TextColumn::make('nama_petugas')
                    ->label('Nama Petugas')
                    ->placeholder('-')
                    ->wrap()
                    ->searchable(),

                TextColumn::make('ruangan.nama_ruangan')
                    ->label('Ruangan')
                    ->searchable()
                    ->default('-'),

                TextColumn::make('tanggal')
                    ->label('Tanggal')
                    ->date('d M Y')
                    ->timezone('Asia/Jakarta'),

                TextColumn::make('deskripsi_kegiatan')
                    ->label('Catatan Kegiatan')
                    ->limit(60)
                    ->tooltip(fn ($record) => $record->deskripsi_kegiatan)
                    ->wrap()
                    ->searchable(),

                TextColumn::make('created_at')
                    ->label('Dibuat Pada')
                    ->since()
                    ->timezone('Asia/Jakarta'),
            ])

            ->actions([

                ViewAction::make(),

                EditAction::make()
                    ->visible(function ($record) {

                        $user = auth()->user();

                        if (
                            $user->hasRole('super_admin') ||
                            $user->hasRole('admin')
                        ) {
                            return true;
                        }

                        return
                            $user->hasRole('teknisi')
                            &&
                            $record->teknisi_id == $user->id;
                    })
                    ->disabled(fn ($record) => $record->trashed()),

                DeleteAction::make()
                    ->visible(function ($record) {

                        $user = auth()->user();

                        if (
                            $user->hasRole('super_admin') ||
                            $user->hasRole('admin')
                        ) {
                            return true;
                        }

                        return
                            $user->hasRole('teknisi')
                            &&
                            $record->teknisi_id == $user->id;
                    }),

            ])

            ->filters([

                SelectFilter::make('teknisi_id')
                    ->label('Teknisi')
                    ->relationship(
                        'teknisi',
                        'name',
                        fn (Builder $query) => $query->role(['teknisi', 'admin', 'super_admin'])

                    )
                    ->searchable()
                    ->preload(),

                Filter::make('tanggal')
                    ->label('Tanggal Kegiatan')
                    ->form([
                        DatePicker::make('tanggal_mulai')
                            ->label('Dari'),

                        DatePicker::make('tanggal_selesai')
                            ->label('Sampai'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {

                        return $query
                            ->when(
                                $data['tanggal_mulai'],
                                fn (Builder $query, $date) => $query->whereDate('tanggal', '>=', $date)
                            )
                            ->when(
                                $data['tanggal_selesai'],
                                fn (Builder $query, $date) => $query->whereDate('tanggal', '<=', $date)
                            );

                    }),

                SelectFilter::make('bulan')
                    ->label('Bulan')
                    ->options([
                        1 => 'Januari',
                        2 => 'Februari',
                        3 => 'Maret',
                        4 => 'April',
                        5 => 'Mei',
                        6 => 'Juni',
                        7 => 'Juli',
                        8 => 'Agustus',
                        9 => 'September',
                        10 => 'Oktober',
                        11 => 'November',
                        12 => 'Desember',
                    ])
                    ->query(function (Builder $query, array $data) {

                        if (blank($data['value'])) {
                            return $query;
                        }

                        return $query->whereMonth(
                            'tanggal',
                            $data['value']
                        );

                    }),

                SelectFilter::make('tahun')
                    ->label('Tahun')
                    ->options(
                        collect(range(
                            now()->year,
                            now()->year - 5
                        ))
                            ->mapWithKeys(fn ($year) => [
                                $year => $year,
                            ])
                            ->toArray()
                    )
                    ->query(function (Builder $query, array $data) {

                        if (blank($data['value'])) {
                            return $query;
                        }

                        return $query->whereYear(
                            'tanggal',
                            $data['value']
                        );

                    }),

                TrashedFilter::make(),

            ])

            ->defaultSort(
                'tanggal',
                'desc'
            );
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

    public static function canCreate(): bool
    {
        return auth()->user()->hasAnyRole([
            'super_admin',
            'admin',
            'teknisi',
        ]);
    }

    public static function canEdit($record): bool
    {
        $user = auth()->user();

        if (
            $user->hasRole('super_admin') ||
            $user->hasRole('admin')
        ) {
            return true;
        }

        return
            $user->hasRole('teknisi')
            &&
            $record->teknisi_id == $user->id;
    }

    public static function canDelete($record): bool
    {
        $user = auth()->user();

        if (
            $user->hasRole('super_admin') ||
            $user->hasRole('admin')
        ) {
            return true;
        }

        return
            $user->hasRole('teknisi')
            &&
            $record->teknisi_id == $user->id;
    }

    public static function canRestore($record): bool
    {
        return auth()->user()->hasAnyRole([
            'super_admin',
            'admin',
        ]);
    }

    public static function canForceDelete($record): bool
    {
        return false;
    }

    public static function shouldRegisterNavigation(): bool
    {
        return auth()->user()->hasAnyRole([
            'super_admin',
            'admin',
            'teknisi',
        ]);
    }

    // public static function getEloquentQuery(): Builder
    // {
    //     $query = parent::getEloquentQuery()
    //         ->withoutGlobalScopes([
    //             SoftDeletingScope::class,
    //         ]);

    //     $user = auth()->user();

    //     if (
    //         $user->hasRole('super_admin') ||
    //         $user->hasRole('admin')
    //     ) {
    //         return $query;
    //     }

    //     if ($user->hasRole('teknisi')) {

    //         return $query->where(
    //             'teknisi_id',
    //             $user->id
    //         );

    //     }

    //     abort(403);

    // }
}
