<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsPemohon
{
    public function handle($request, Closure $next)
    {
        if (!auth()->check()) {
            abort(403);
        }

        if (!auth()->user()->hasRole('pemohon')) {
            abort(403);
        }

        return $next($request);
    }
}
