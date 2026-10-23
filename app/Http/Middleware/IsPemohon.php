<?php

namespace App\Http\Middleware;

use App\Models\User;
use Closure;
use Illuminate\Http\Request;

class IsPemohon
{
    public function handle(Request $request, Closure $next)
    {
        $user = $request->user();

        if (! $user instanceof User) {
            return redirect('/pemohon/login');
        }

        if (! $user->hasRole('pemohon')) {
            $homeUrl = $user->homeUrl();

            if ($homeUrl === null) {
                abort(403);
            }

            return redirect()->to($homeUrl);
        }

        return $next($request);
    }
}
