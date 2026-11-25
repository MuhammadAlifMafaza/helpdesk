@php
    $activePage = $activePage ?? 'profile';
@endphp

<nav aria-label="Navigasi akun" class="flex w-full flex-wrap gap-1 rounded-xl border border-gray-200 bg-white p-2 shadow-sm dark:border-gray-800 dark:bg-gray-900 sm:p-3">
    <a href="{{ \App\Filament\Pages\AccountProfile::getUrl() }}"
       @class([
           'inline-flex min-h-12 items-center gap-3 rounded-lg px-5 py-3 text-base font-medium transition sm:px-6',
           'bg-primary-50 text-primary-700 dark:bg-primary-950 dark:text-primary-300' => $activePage === 'profile',
           'text-gray-600 hover:bg-gray-50 hover:text-gray-950 dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-white' => $activePage !== 'profile',
       ])>
        <x-filament::icon icon="heroicon-o-user-circle" class="size-5" />
        Profil
    </a>
    <a href="{{ \App\Filament\Pages\AccountSettings::getUrl() }}"
       @class([
           'inline-flex min-h-11 items-center gap-2 rounded-lg px-4 py-2.5 text-sm font-medium transition sm:px-5',
           'bg-primary-50 text-primary-700 dark:bg-primary-950 dark:text-primary-300' => $activePage === 'settings',
           'text-gray-600 hover:bg-gray-50 hover:text-gray-950 dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-white' => $activePage !== 'settings',
       ])>
        <x-filament::icon icon="heroicon-o-adjustments-horizontal" class="size-5" />
        Pengaturan akun
    </a>
    <a href="{{ \App\Filament\Pages\AccountSecurity::getUrl() }}"
       @class([
           'inline-flex min-h-12 items-center gap-3 rounded-lg px-5 py-3 text-base font-medium transition sm:px-6',
           'bg-primary-50 text-primary-700 dark:bg-primary-950 dark:text-primary-300' => $activePage === 'security',
           'text-gray-600 hover:bg-gray-50 hover:text-gray-950 dark:text-gray-300 dark:hover:bg-gray-800 dark:hover:text-white' => $activePage !== 'security',
       ])>
        <x-filament::icon icon="heroicon-o-shield-check" class="size-5" />
        Keamanan
    </a>
</nav>
