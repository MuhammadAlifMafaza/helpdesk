<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Notifications\PemohonResetPassword;
use Closure;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Contracts\View\View;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Str;
use Illuminate\Validation\Rules\Password as PasswordRule;

class PemohonPasswordController extends Controller
{
    public function request(): View
    {
        return view('auth.forgot-password');
    }

    public function email(Request $request): RedirectResponse
    {
        $credentials = $request->validate(['email' => ['required', 'email', 'max:255']]);
        $credentials['pemohon'] = $this->pemohonScope();

        Password::broker('users')->sendResetLink($credentials, function (User $user, string $token): void {
            $user->notify(new PemohonResetPassword($token));
        });

        return back()->with('status', 'Jika email tersebut terdaftar sebagai pemohon, tautan pengaturan ulang kata sandi akan dikirim. Periksa kotak masuk atau folder spam Anda.');
    }

    public function reset(Request $request, string $token): View
    {
        return view('auth.reset-password', [
            'token' => $token,
            'email' => $request->query('email', ''),
        ]);
    }

    public function update(Request $request): RedirectResponse
    {
        $credentials = $request->validate([
            'token' => ['required', 'string'],
            'email' => ['required', 'email', 'max:255'],
            'password' => ['required', 'confirmed', PasswordRule::min(8)],
        ]);
        $credentials['pemohon'] = $this->pemohonScope();

        $status = Password::broker('users')->reset($credentials, function (User $user, string $password): void {
            $user->forceFill([
                'password' => Hash::make($password),
                'remember_token' => Str::random(60),
            ])->save();

            event(new PasswordReset($user));
        });

        if ($status !== Password::PASSWORD_RESET) {
            return back()->withInput($request->only('email'))->withErrors([
                'email' => 'Tautan tidak valid atau sudah kedaluwarsa. Silakan minta tautan baru.',
            ]);
        }

        return redirect()->route('login')->with('status', 'Kata sandi berhasil diperbarui. Silakan masuk menggunakan kata sandi baru.');
    }

    private function pemohonScope(): Closure
    {
        return static function (Builder $query): void {
            $query->whereHas('roles', static function (Builder $roles): void {
                $roles->where('name', 'pemohon')->where('guard_name', 'web');
            })->whereDoesntHave('roles', static function (Builder $roles): void {
                $roles->whereIn('name', ['admin', 'super_admin', 'teknisi'])->where('guard_name', 'web');
            });
        };
    }
}
