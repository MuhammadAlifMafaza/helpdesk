<?php

namespace App\Filament\Pages\Admin;

use Filament\Pages\Page;


class AdminDashboard extends Page
{
    protected static ?string $navigationLabel = 'Dashboard';
    protected static $navigationGroup = 'Dashboard';
    protected static ?int $navigationSort = -100;
    protected static string $view = 'filament.pages.admin-dashboard';

    public static function canAccess(): bool
    {
        return auth()->check() && auth()->user()->hasAnyRole(['admin', 'super_admin']);
    }
}
