<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;

class IsPemohon
{
    public function handle(Request $request, Closure $next)
    {
        if (!$request->user()) {
            return redirect('/pemohon/login');
        }

        if (!$request->user()->hasRole('pemohon')) {
            abort(403);
        }

        return $next($request); 
    }
}
