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

#[Fillable(['name', 'email', 'password', 'unit_bidang'])]
#[Hidden(['password', 'remember_token'])]
class User extends Authenticatable implements FilamentUser
{
    use HasRoles, HasFactory, Notifiable;

    protected $guard_name = 'web';

    protected $table = 'users';

    protected $fillable = [
        'name',
        'email',
        'password',
        'unit_bidang'
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
        return $this->name ?: $this->email ?: 'User';
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
            'super_admin',
            'admin',
            'teknisi',
            // 'pemohon',
        ]);
    }
}
