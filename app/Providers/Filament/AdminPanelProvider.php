<?php

namespace App\Providers\Filament;

use App\Filament\Auth\StaffLogin;
use App\Filament\Auth\StaffRequestPasswordReset;
use App\Filament\Auth\StaffResetPassword;
use App\Filament\Pages\AccountProfile;
use App\Filament\Pages\AccountSecurity;
use App\Filament\Pages\AccountSettings;
use App\Filament\Pages\Dashboard;
use App\Http\Middleware\RedirectToAllowedPanel;
use BezhanSalleh\FilamentShield\FilamentShieldPlugin;
use Filament\Http\Middleware\Authenticate;
use Filament\Http\Middleware\AuthenticateSession;
use Filament\Http\Middleware\DisableBladeIconComponents;
use Filament\Http\Middleware\DispatchServingFilamentEvent;
use Filament\Navigation\MenuItem;
use Filament\Navigation\NavigationGroup;
use Filament\Panel;
use Filament\PanelProvider;
use Filament\Support\Colors\Color;
use Filament\View\PanelsRenderHook;
use Illuminate\Contracts\View\View;
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
            ->login(StaffLogin::class)
            ->passwordReset(StaffRequestPasswordReset::class, StaffResetPassword::class)
            ->profile(AccountProfile::class, isSimple: false)
            ->id('admin')
            ->path('admin')
            ->brandName('Helpdesk IWIMA')
            ->viteTheme('resources/css/filament/theme.css')
            ->brandLogo(asset('branding/logo-tag.svg'))
            ->brandLogoHeight('2.5rem')
            ->favicon(asset('branding/logo.svg'))
            ->globalSearch(false)
            ->colors([
                'primary' => Color::hex('#004B87'),
                'pending' => Color::Amber,
                'chat' => Color::Cyan,
                'update' => Color::Indigo,
                'delete' => Color::Red,
                'process' => Color::Orange,
                'approve' => Color::Green,
                'reject' => Color::Red,
                'reopen' => Color::Yellow,
            ])
            ->sidebarCollapsibleOnDesktop()
            ->collapsedSidebarWidth('5rem')
            ->maxContentWidth('full')
            ->discoverResources(
                in: app_path('Filament/Resources'),
                for: 'App\Filament\Resources'
            )
            ->discoverPages(in: app_path('Filament/Pages'), for: 'App\Filament\Pages')
            ->pages([
                Dashboard::class,
                AccountSettings::class,
                AccountSecurity::class,
            ])
            ->userMenuItems([
                'settings' => MenuItem::make()->label('Pengaturan akun')->icon('heroicon-o-adjustments-horizontal')->url(fn (): string => AccountSettings::getUrl()),
            ])
            ->discoverWidgets(in: app_path('Filament/Widgets'), for: 'App\Filament\Widgets')
            ->widgets([
            ])
            ->databaseNotifications()
            ->databaseNotificationsPolling('30s')
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
                RedirectToAllowedPanel::class,
            ])
            ->plugins([
                FilamentShieldPlugin::make(),
            ])
            ->homeUrl(fn () => match (auth()->user()?->getRoleNames()->first()) {
                default => '/admin',
            })
            ->authMiddleware([
                Authenticate::class,
                'auth',
            ])
            ->renderHook(
                PanelsRenderHook::FOOTER,
                fn (): View => view('components.helpdesk-panel-footer')
            )
            ->navigationGroups([
                NavigationGroup::make('Service Desk')
                    ->collapsed(true),
                NavigationGroup::make('Teknisi')
                    ->collapsed(true),
                NavigationGroup::make('Monitoring')
                    ->collapsed(true)
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
