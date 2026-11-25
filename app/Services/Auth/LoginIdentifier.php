<?php

namespace App\Services\Auth;

class LoginIdentifier
{
    /**
     * Build credentials for the configured user provider from an email or login ID.
     *
     * @return array{email?: string, login_id?: string, password: string}
     */
    public static function credentials(string $identifier, string $password): array
    {
        $normalizedIdentifier = mb_strtolower(trim($identifier));
        $attribute = filter_var($normalizedIdentifier, FILTER_VALIDATE_EMAIL) !== false
            ? 'email'
            : 'login_id';

        return [
            $attribute => $normalizedIdentifier,
            'password' => $password,
        ];
    }

    public static function normalize(?string $identifier): ?string
    {
        return filled($identifier) ? mb_strtolower(trim($identifier)) : null;
    }
}
