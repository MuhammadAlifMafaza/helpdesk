<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class IsStaff
{
    public function handle(Request $request, Closure $next)
    {
        if (!$request->user()) {
            return redirect('/admin/login');
        }

        if (!$request->user()->hasAnyRole(['admin', 'teknisi'])) {
            abort(403);
        }

        return $next($request);
    }
}
