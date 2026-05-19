<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Spatie\Permission\Traits\HasRoles;
use Filament\Models\Contracts\FilamentUser;
use Illuminate\Database\Eloquent\Factories\HasFactory;

#[Fillable(['nama', 'email', 'password', 'unit_bidang', 'is_active'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable implements FilamentUser
{
    use HasRoles, HasFactory, Notifiable;

    protected $guard_name = 'web';

    protected $table = 'users';

    protected $fillable = [
        'nama',
        'email',
        'password',
        'unit_bidang',
        'is_active'
    ];

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
        return $this->nama ?: $this->email ?: 'User';
    }

    public function getNameAttribute(): string
    {
        return $this->nama ?: $this->email ?: 'User';
    }

    /**
     * Get the email attribute.
     */
    public function getEmailAttribute(): string
    {
        return $this->attributes['email'] ?? '';
    }

    public function canAccessPanel(\Filament\Panel $panel): bool
    {
        return $this->hasAnyRole([
            'admin',
            'teknisi',
            'super_admin'
        ]);
    }
}
