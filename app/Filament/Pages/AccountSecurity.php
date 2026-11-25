<?php

namespace App\Filament\Pages;

use Filament\Notifications\Notification;
use Filament\Pages\Page;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules\Password;

class AccountSecurity extends Page
{
    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-shield-check';

    protected static ?string $navigationLabel = 'Keamanan akun';

    protected static ?string $title = 'Keamanan akun';

    protected static ?string $slug = 'keamanan-akun';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'filament.pages.account-security';

    public bool $isEditing = false;

    public string $currentPassword = '';

    public string $password = '';

    public string $passwordConfirmation = '';

    public function edit(): void
    {
        $this->isEditing = true;
    }

    public function cancelEditing(): void
    {
        $this->reset(['currentPassword', 'password', 'passwordConfirmation']);
        $this->isEditing = false;
    }

    public function save(): void
    {
        $this->validate([
            'currentPassword' => ['required', 'current_password'],
            'password' => ['required', 'confirmed:passwordConfirmation', Password::min(8)],
        ]);

        $user = auth()->user();
        $user->password = Hash::make($this->password);
        $user->save();

        $this->cancelEditing();
        Notification::make()->title('Kata sandi berhasil diperbarui')->success()->send();
    }
}
