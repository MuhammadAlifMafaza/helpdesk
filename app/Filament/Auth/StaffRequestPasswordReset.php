<?php

namespace App\Filament\Auth;

use Filament\Auth\Pages\PasswordReset\RequestPasswordReset as BaseRequestPasswordReset;
use Illuminate\Contracts\Support\Htmlable;

class StaffRequestPasswordReset extends BaseRequestPasswordReset
{
    protected string $view = 'filament.auth.staff-password-request';

    protected static string $layout = 'filament-panels::components.layout.base';

    public function getTitle(): string|Htmlable
    {
        return 'Lupa kata sandi Staff';
    }

    public function getHeading(): string|Htmlable|null
    {
        return 'Pulihkan akses staff';
    }
}
