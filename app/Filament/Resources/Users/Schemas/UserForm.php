<?php

namespace App\Filament\Resources\Users\Schemas;

use App\Models\User;
use App\Services\Auth\LoginIdentifier;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Section;
use Filament\Schemas\Schema;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Query\Builder as QueryBuilder;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;
use Illuminate\Validation\ValidationException;
use Spatie\Permission\Models\Role;

class UserForm
{
    public static function configure(Schema $schema): Schema
    {
        return $schema
            ->components([
                Section::make('Informasi Akun')
                    ->description('Data utama yang digunakan untuk masuk ke sistem.')
                    ->columns(2)
                    ->schema([
                        TextInput::make('name')
                            ->label('Nama Pengguna')
                            ->required()
                            ->maxLength(255),

                        TextInput::make('email')
                            ->label('Email')
                            ->email()
                            ->required()
                            ->unique(ignoreRecord: true)
                            ->maxLength(255),

                        TextInput::make('login_id')
                            ->label('Username / NIM / NIDN')
                            ->helperText('Opsional. Isi ID institusi atau username agar pengguna dapat masuk selain menggunakan email.')
                            ->nullable()
                            ->maxLength(100)
                            ->rules(['nullable', 'regex:/\A[A-Za-z0-9._-]+\z/'])
                            ->unique(ignoreRecord: true)
                            ->dehydrateStateUsing(fn (?string $state): ?string => LoginIdentifier::normalize($state)),

                        TextInput::make('password')
                            ->label('Password')
                            ->password()
                            ->revealable()
                            ->helperText(fn ($record): string => $record ? 'Kosongkan jika tidak ingin mengubah password.' : '')
                            ->required(fn ($record): bool => $record === null)
                            ->dehydrated(fn ($state): bool => filled($state))
                            ->maxLength(255),
                    ]),

                Section::make('Akses dan Penempatan')
                    ->columns(2)
                    ->schema([
                        TextInput::make('unit_bidang')
                            ->label('Unit / Bidang')
                            ->required()
                            ->maxLength(255),

                        Select::make('roles')
                            ->label('Role Pengguna')
                            ->relationship(
                                'roles',
                                'name',
                                modifyQueryUsing: fn (Builder $query): Builder => Auth::user()?->hasRole('super_admin')
                                    ? $query
                                    : $query->where('name', '!=', 'super_admin'),
                            )
                            ->rules([
                                Rule::exists('roles', 'id')->where(
                                    fn (QueryBuilder $query): QueryBuilder => Auth::user()?->hasRole('super_admin')
                                        ? $query
                                        : $query->where('name', '!=', 'super_admin'),
                                ),
                            ])
                            ->saveRelationshipsUsing(function (Select $component): void {
                                $role = Role::query()->find($component->getState());
                                $record = $component->getRecord();
                                $actor = Auth::user();

                                if (! $record instanceof User || ! $role || ! $actor) {
                                    throw ValidationException::withMessages([
                                        'data.roles' => 'Peran pengguna yang dipilih tidak valid.',
                                    ]);
                                }

                                if (! $actor->hasRole('super_admin') && $role->name === 'super_admin') {
                                    throw ValidationException::withMessages([
                                        'data.roles' => 'Hanya super admin yang dapat memberikan peran super admin.',
                                    ]);
                                }

                                if (
                                    $record->exists
                                    && $record->hasRole('super_admin')
                                    && $role->name !== 'super_admin'
                                    && User::role('super_admin')->count() <= 1
                                ) {
                                    throw ValidationException::withMessages([
                                        'data.roles' => 'Peran super admin terakhir tidak dapat dihapus.',
                                    ]);
                                }

                                $record->syncRoles([$role]);
                            })
                            ->preload()
                            ->searchable()
                            ->required(),
                    ]),

            ]);
    }
}
