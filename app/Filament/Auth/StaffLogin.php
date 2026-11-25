<?php

namespace App\Filament\Auth;

use App\Services\Auth\LoginIdentifier;
use Filament\Auth\Pages\Login as BaseLogin;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Components\Component;
use Illuminate\Contracts\Support\Htmlable;
use Illuminate\Validation\ValidationException;
use SensitiveParameter;

class StaffLogin extends BaseLogin
{
    protected string $view = 'filament.auth.staff-login';

    protected static string $layout = 'filament-panels::components.layout.base';

    protected function getEmailFormComponent(): Component
    {
        return TextInput::make('identifier')
            ->label('Email atau Username / NIM / NIDN')
            ->required()
            ->maxLength(255)
            ->autocomplete('username')
            ->autofocus();
    }

    protected function getCredentialsFromFormData(#[SensitiveParameter] array $data): array
    {
        return LoginIdentifier::credentials($data['identifier'], $data['password']);
    }

    protected function throwFailureValidationException(): never
    {
        throw ValidationException::withMessages([
            'data.identifier' => 'Email atau ID login maupun kata sandi tidak sesuai.',
        ]);
    }

    public function getHeading(): string|Htmlable|null
    {
        return 'Masuk ke panel staff';
    }

    public function getSubheading(): string|Htmlable|null
    {
        return 'Gunakan akun resmi teknisi atau administrator Helpdesk IWIMA.';
    }
}
