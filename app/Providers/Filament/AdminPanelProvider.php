<?php

namespace App\Providers\Filament;

use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\NavigationGroup;
use Filament\Pages\Dashboard;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\Widgets\AccountWidget;
use Filament\Widgets\FilamentInfoWidget;
use Illuminate\Cookie\Middleware\AddQueuedCookiesToResponse;
use Illuminate\Cookie\Middleware\EncryptCookies;
use Illuminate\Foundation\Http\Middleware\PreventRequestForgery;
use Illuminate\Routing\Middleware\SubstituteBindings;
use Illuminate\Session\Middleware\StartSession;
use Illuminate\View\Middleware\ShareErrorsFromSession;

class AdminPanelProvider extends PanelProvider
{
    public function panel(Panel $panel): Panel
    {
        return $panel
            ->default()
            ->login()
            ->id('admin')
            ->path('admin')
            ->brandName('Helpdesk System')
            ->brandLogo(asset('branding/logo-tag.svg'))
            ->brandLogoHeight('4rem')
            ->favicon(asset('branding/logo.svg'))
            ->colors([
                'primary' => Color::Blue,
                'yellow' => Color::rgb('224,125,255'),
                'pending' => Color::Amber,
            ])
            ->sidebarCollapsibleOnDesktop()
            ->collapsedSidebarWidth('5rem')
            ->maxContentWidth('full')
            ->discoverResources(in: app_path('Filament/Resources'), for: 'App\Filament\Resources')
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\Filament\Pages')
            ->pages([
                Dashboard::class,
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\Filament\Widgets')
            ->widgets([
                AccountWidget::class,
                FilamentInfoWidget::class,
            ])
            ->middleware([
                EncryptCookies::class,
                AddQueuedCookiesToResponse::class,
                StartSession::class,
                AuthenticateSession::class,
                ShareErrorsFromSession::class,
                PreventRequestForgery::class,
                SubstituteBindings::class,
                DisableBladeIconComponents::class,
                DispatchServingFilamentEvent::class,
            ])
            ->plugins([
                FilamentShieldPlugin::make(),
            ])
            ->homeUrl(fn () => match (auth()->user()?->getRoleNames()->first()) {
                'admin' => '/admin/admin-dashboard',
                'teknisi' => '/admin/teknisi-dashboard',
                default => '/admin',
            })
            ->authMiddleware([
                Authenticate::class,
                'auth',
            ])
            ->navigationGroups([
                NavigationGroup::make('Service Desk')
                    ->collapsed(true),
                NavigationGroup::make('Monitoring')
                    ->collapsed(false)
                    ->icon('heroicon-o-clock'),
                NavigationGroup::make('Laporan')
                    ->collapsed(true)
                    ->icon('heroicon-o-document-text'),
                NavigationGroup::make('Master Data')
                    ->collapsed(true),
                NavigationGroup::make('Filament Shield')
                    ->collapsed(true)
                    ->icon('heroicon-o-shield-check'),

            ]);

    }
}
