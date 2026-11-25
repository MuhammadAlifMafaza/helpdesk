<?php

namespace App\Filament\Pages;

use Filament\Auth\Pages\EditProfile;
use Filament\Forms\Components\TextInput;
use Filament\Schemas\Schema;

class AccountProfile extends EditProfile
{
    protected string $view = 'filament.pages.account-profile';

    public bool $isEditing = false;

    public function form(Schema $schema): Schema
    {
        return parent::form($schema)->components([
            TextInput::make('login_id')
                ->label('Username / ID')
                ->maxLength(100)
                ->disabled(),

            TextInput::make('name')
                ->label('Nama lengkap')
                ->required()
                ->maxLength(100)
                ->live(onBlur: true)
                ->disabled(fn (): bool => ! $this->isEditing),

            TextInput::make('email')
                ->label('Email')
                ->email()
                ->required()
                ->unique(ignoreRecord: true)
                ->maxLength(100)->live(onBlur: true)
                ->disabled(fn (): bool => ! $this->isEditing),

            TextInput::make('unit_bidang')
                ->label('Unit / Bidang')
                ->maxLength(100)
                ->live(onBlur: true)
                ->disabled(fn (): bool => ! $this->isEditing),
        ]);
    }

    public function defaultForm(Schema $schema): Schema
    {
        return parent::defaultForm($schema)->inlineLabel(false);
    }

    protected function mutateFormDataBeforeSave(#[\SensitiveParameter] array $data): array
    {
        unset($data['login_id']);

        return $data;
    }

    protected function getFormActions(): array
    {
        return [];
    }

    public function edit(): void
    {
        $this->isEditing = true;
    }

    public function cancelEditing(): void
    {
        $this->isEditing = false;
        $this->resetErrorBag();
        $this->fillForm();
    }

    public function finishEditing(): void
    {
        $this->isEditing = false;
        $this->fillForm();
    }

    public function save(): void
    {
        if (! $this->isEditing) {
            return;
        }

        parent::save();

        if ($this->getErrorBag()->isEmpty()) {
            $this->isEditing = false;
        }
    }
}
