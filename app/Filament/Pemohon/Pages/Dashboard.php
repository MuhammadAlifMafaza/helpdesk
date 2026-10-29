<?php

namespace App\Filament\Pemohon\Pages;

use App\Filament\Pemohon\Widgets;
use Filament\Pages\Dashboard as BaseDashboard;

class Dashboard extends BaseDashboard
{
    protected static ?string $title = 'Dashboard';

    protected static ?string $navigationLabel = 'Dashboard';

    protected static ?string $slug = 'dashboard';

    protected string $view = 'filament.pemohon.pages.dashboard';

    public function getWidgets(): array
    {
        return auth()->user()?->hasRole('pemohon') ? [
            Widgets\Statistik\TiketPerbaikanStats::class,
            Widgets\Statistik\PengajuanBarangStats::class,
            Widgets\AktivitasLayananChart::class,
            Widgets\TiketPerbaikanTerbaru::class,
            Widgets\PengajuanBarangTerbaru::class,
        ] : [];
    }
}
