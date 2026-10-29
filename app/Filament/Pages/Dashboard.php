<?php

namespace App\Filament\Pages;

use App\Filament\Widgets\Admin;
use App\Filament\Widgets\Teknisi;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected static ?string $title = 'Dashboard';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'filament.pages.admin-dashboard';

    public function getWidgets(): array
    {
        if (auth()->user()?->hasAnyRole(['admin', 'super_admin'])) {
            return [
                Admin\AdminOverview::class,
                Admin\AdminLayananTrendChart::class,
                Admin\AdminStatusLayananChart::class,
                Admin\AdminTiketTerbaru::class,
                Admin\AdminPengajuanTerbaru::class,
            ];
        }

        return auth()->user()?->hasRole('teknisi') ? [
            Teknisi\TeknisiOverview::class,
            Teknisi\TeknisiTiketAktif::class,
            Teknisi\TeknisiAktivitasChart::class,
            Teknisi\TeknisiStatusChart::class,
        ] : [];
    }
}
