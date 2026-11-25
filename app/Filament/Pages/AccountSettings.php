<?php

namespace App\Filament\Pages;

use Filament\Notifications\Notification;
use Filament\Pages\Page;

class AccountSettings extends Page
{
    protected static string|\BackedEnum|null $navigationIcon = 'heroicon-o-adjustments-horizontal';

    protected static ?string $navigationLabel = 'Pengaturan akun';

    protected static ?string $title = 'Pengaturan akun';

    protected static ?string $slug = 'pengaturan-akun';

    protected static bool $shouldRegisterNavigation = false;

    protected string $view = 'filament.pages.account-settings';

    public array $preferences = [];

    public bool $isEditing = false;

    public array $savedPreferences = [];

    public function mount(): void
    {
        $this->preferences = array_merge([
            'locale' => 'id',
            'timezone' => 'Asia/Jakarta',
            'theme' => 'system',
            'notifications' => true,
        ], auth()->user()->preferences ?? []);
        $this->savedPreferences = $this->preferences;
    }

    public function save(): void
    {
        if (! $this->isEditing) {
            return;
        }

        $this->validate([
            'preferences.locale' => ['required', 'in:id,en'],
            'preferences.timezone' => ['required', 'timezone'],
            'preferences.theme' => ['required', 'in:system,light,dark'],
            'preferences.notifications' => ['required', 'boolean'],
        ]);

        $user = auth()->user();
        $user->preferences = $this->preferences;
        $user->save();
        $this->savedPreferences = $this->preferences;
        $this->isEditing = false;

        Notification::make()->title('Pengaturan berhasil disimpan')->success()->send();
    }

    public function edit(): void
    {
        $this->isEditing = true;
    }

    public function cancelEditing(): void
    {
        $this->preferences = $this->savedPreferences;
        $this->isEditing = false;
        $this->resetValidation();
    }

    public function finishEditing(): void
    {
        $this->isEditing = false;
    }
}
