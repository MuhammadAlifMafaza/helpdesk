<?php

namespace App\Filament\Pages\Teknisi;

use Filament\Pages\Page;

class TeknisiDashboard extends Page
{
    protected string $view = 'filament.pages.teknisi.teknisi-dashboard';

    protected static bool $shouldRegisterNavigation = false;

    public static function canAccess(): bool
    {
        return auth()->check() && auth()->user()->role === 'teknisi';
    }
}
