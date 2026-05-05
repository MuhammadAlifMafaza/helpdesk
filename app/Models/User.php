<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Database\Factories\UserFactory;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;

#[Fillable(['nama', 'email', 'password'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable
{
    use HasRoles;

    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }

    /* Get the name attribute. */
    public function getFilamentName(): string
    {
        return $this->nama ?? 'User';
    }

    public function getNameAttribute()
    {
        return $this->nama;
    }

    /**
     * Get the email attribute.
     */
    public function getEmailAttribute()
    {
        return $this->email;
    }

    public function canAccessPanel(): bool
    {
        return $this->hasAnyRole(['admin', 'teknisi']);
    }
}
