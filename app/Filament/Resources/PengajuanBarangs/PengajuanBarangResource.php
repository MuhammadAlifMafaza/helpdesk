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
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

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
use Filament\Actions\RestoreAction;
use Filament\Actions\ForceDeleteAction;

// Filament Forms imports
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Textarea;
use Filament\Forms\Components\TextInput;
use Filament\Infolists\Components\TextEntry;

// Filament Resources imports
use Filament\Infolists\Components\ViewEntry;
use Filament\Schemas\Components\Section;

// Filament Table imports
use Filament\Schemas\Schema;
use Filament\Tables\Table;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Filters\TrashedFilter;

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
        return $schema
            ->columns(2)
            ->schema([

                Section::make('Informasi Pengajuan')
                    ->columns(2)
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('kode_pengajuan')
                            ->label('Nomor Pengajuan'),

                        TextEntry::make('user.name')
                            ->label('Nama Pemohon'),

                        TextEntry::make('status')
                            ->badge()
                            ->icon(fn(string $state) => match ($state) {
                                'Open' => 'heroicon-o-folder-open',
                                'In Progress' => 'heroicon-o-arrow-path',
                                'Close' => 'heroicon-o-check-circle',
                                default => 'heroicon-o-question-mark-circle',
                            })
                            ->color(fn(string $state) => match ($state) {
                                'Open' => 'info',
                                'In Progress' => 'warning',
                                'Close' => 'success',
                                default => 'gray',
                            }),

                        TextEntry::make('nama_barang'),

                        TextEntry::make('status_outcome')
                            ->badge()
                            ->icon(fn(?string $state) => match ($state) {
                                'Completed' => 'heroicon-o-check-circle',
                                'Rejected' => 'heroicon-o-x-circle',
                                'Reopen' => 'heroicon-o-arrow-path',
                                default => 'heroicon-o-question-mark-circle',
                            })
                            ->color(fn(?string $state): string => match ($state) {
                                'Completed' => 'success',
                                'Rejected' => 'danger',
                                'Reopen' => 'warning',
                                default => 'gray',
                            }),

                        TextEntry::make('jumlah')
                            ->label('Jumlah Barang'),

                        TextEntry::make('created_at')
                            ->dateTime(),

                        TextEntry::make('alasan'),

                        TextEntry::make('updated_at')
                            ->dateTime(),

                    ]),

                Section::make('Deskripsi Kerusakan')
                    ->columnSpanFull()
                    ->schema([

                        TextEntry::make('deskripsi')
                            ->hiddenLabel()
                            ->columnSpanFull(),

                    ]),

                Section::make('Timeline Aktivitas')
                    ->columnSpan(1)
                    ->schema([

                        ViewEntry::make('id')
                            ->view('filament.pages.tiket.timeline'),

                    ]),

                Section::make('Diskusi')
                    ->columnSpan(1)
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
                    ->label('Pemohon')
                    ->searchable(),

                TextColumn::make('nama_barang')
                    ->searchable(),

                TextColumn::make('jumlah')
                    ->sortable(),

                TextColumn::make('status')
                    ->badge()
                    ->icon(fn(string $state) => match ($state) {
                        'Open' => 'heroicon-o-folder-open',
                        'In Progress' => 'heroicon-o-arrow-path',
                        'Close' => 'heroicon-o-check-circle',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn(string $state) => match ($state) {
                        'Open' => 'info',
                        'In Progress' => 'warning',
                        'Close' => 'success',
                        default => 'gray',
                    }),

                TextColumn::make('status_outcome')
                    ->badge()
                    ->icon(fn(?string $state) => match ($state) {
                        'Completed' => 'heroicon-o-check-circle',
                        'Rejected' => 'heroicon-o-x-circle',
                        'Reopen' => 'heroicon-o-arrow-path',
                        default => 'heroicon-o-question-mark-circle',
                    })
                    ->color(fn(?string $state): string => match ($state) {
                        'Completed' => 'success',
                        'Rejected' => 'danger',
                        'Reopen' => 'warning',
                        default => 'gray',
                    }),

                TextColumn::make('created_at')
                    ->label('Tanggal Permintaan Dibuat')
                    ->dateTime('d M Y'),

                TextColumn::make('waktu_mulai')
                    ->label('Waktu Permintaan Diterima')
                    ->dateTime('d M Y h:m:s'),

                TextColumn::make('waktu_selesai')
                    ->label('Waktu Permintaan Selesai')
                    ->dateTime('d M Y h:m:s'),

                TextColumn::make('durasi_pengerjaan')
                    ->timezone(''),

            ])

            ->filters([
                TrashedFilter::make(),

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

                        $record->sendMessage(
                            'Teknisi '
                            . auth()->user()->name
                            . ' mengambil tiket ini.'
                        );
                    })
                ,

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

                    })
                    ->modalHeading('Konfirmasi Penyelesaian')
                    ->modalDescription(
                        'Tindakan ini akan menutup tiket.'
                    )
                ,

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

                    })
                    ->modalHeading('Konfirmasi Penyelesaian')
                    ->modalDescription(
                        'Tindakan ini akan menutup tiket.'
                    )
                ,

                Action::make('reopen')
                    ->label('Reopen Ticket')
                    ->color('primary')
                    ->icon('heroicon-o-arrow-path')
                    ->visible(
                        fn($record) =>
                        $record->isClosed()
                        &&
                        (
                            auth()->user()->hasRole('admin')
                            ||
                            auth()->user()->hasRole('super_admin')
                        )
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

                    })
                ,

                ViewAction::make(),

                RestoreAction::make()
                    ->visible(fn($record) => $record->trashed()),

                EditAction::make()
                    ->visible(
                        fn($record) =>
                        $record->canEdit()
                    ),

                DeleteAction::make()
                    ->visible(
                        fn($record) =>
                        $record->isClosed()
                        &&
                        (
                            auth()->user()->hasRole('admin')
                            ||
                            auth()->user()->hasRole('super_admin')
                        )
                    )
                    ->requiresConfirmation()
                ,

                ForceDeleteAction::make()
                    ->visible(
                        fn() =>
                        auth()->user()->hasRole('super_admin')
                    ),

            ])
            ->actionsColumnLabel('Action Button');
    }

    public static function getEloquentQuery(): Builder
    {
        return parent::getEloquentQuery()
            ->withoutGlobalScopes([
                SoftDeletingScope::class,
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
            'index' => ListPengajuanBarangs::route('/'),
            'create' => CreatePengajuanBarang::route('/create'),
            'view' => ViewPengajuanBarang::route('/{record}'),
            'edit' => EditPengajuanBarang::route('/{record}/edit'),
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
