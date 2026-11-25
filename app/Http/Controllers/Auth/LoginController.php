<?php

namespace App\Http\Controllers\Auth;

// use App\Http\Controllers\Controller;
use App\Services\Auth\LoginIdentifier;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class LoginController
{
    public function showLoginForm(): View
    {
        return view('auth.login');
    }

    public function login(Request $request): RedirectResponse
    {
        $validated = $request->validate([
            'identifier' => ['required_without:email', 'string', 'max:255'],
            'email' => ['required_without:identifier', 'string', 'max:255'],
            'password' => ['required', 'string'],
        ]);

        $identifier = $validated['identifier'] ?? $validated['email'];
        $credentials = LoginIdentifier::credentials($identifier, $validated['password']);

        if (Auth::attempt($credentials, $request->boolean('remember'))) {
            $request->session()->regenerate();

            $user = Auth::user();

            // Menolak login untuk user role admin atau teknisi melalui halaman login biasa
            if ($user->hasAnyRole(['super_admin', 'admin', 'teknisi'])) {
                Auth::logout();

                return back()->withErrors([
                    'identifier' => 'Akses ditolak. Silakan gunakan login panel Staff.',
                ]);
            }

            return redirect()->intended('/');
        }

        return back()->withErrors([
            'identifier' => 'Email atau ID login maupun kata sandi tidak sesuai.',
        ]);
    }

    public function logout(Request $request): RedirectResponse
    {
        Auth::logout();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect('/login');
    }
}
