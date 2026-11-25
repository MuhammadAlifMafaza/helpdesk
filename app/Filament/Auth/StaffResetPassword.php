<?php

namespace App\Filament\Auth;

use Filament\Auth\Pages\PasswordReset\ResetPassword as BaseResetPassword;
use Illuminate\Contracts\Support\Htmlable;

class StaffResetPassword extends BaseResetPassword
{
    protected string $view = 'filament.auth.staff-password-reset';

    protected static string $layout = 'filament-panels::components.layout.base';

    public function getTitle(): string|Htmlable
    {
        return 'Atur kata sandi Staff';
    }

    public function getHeading(): string|Htmlable|null
    {
        return 'Buat kata sandi baru';
    }
}
