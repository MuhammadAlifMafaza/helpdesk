<?php

namespace App\Filament\Pages\Admin;

use Filament\Pages\Page;

class AdminDashboard extends Page
{
    protected string $view = 'filament.pages.admin.admin-dashboard';

    protected static bool $shouldRegisterNavigation = false;

    public static function canAccess(): bool
    {
        return auth()->check() && auth()->user()->hasAnyRole(['admin', 'super_admin']);
    }
}
