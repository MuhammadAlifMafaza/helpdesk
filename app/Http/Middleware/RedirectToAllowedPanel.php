<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

/** Redirect authenticated users away from a panel they are not permitted to use. */
class RedirectToAllowedPanel
{
    public function handle(Request $request, Closure $next): Response
    {
        $user = $request->user();
        if (!$user) {
            return $next($request);
        }

        $path = trim($request->path(), '/');
        $isAdminPanel = $path === 'admin' || str_starts_with($path, 'admin/');
        $isPemohonPanel = $path === 'pemohon' || str_starts_with($path, 'pemohon/');

        if ($isAdminPanel && !$user->hasAnyRole(['admin', 'teknisi', 'super_admin'])) {
            return $user->hasRole('pemohon')
                ? redirect()->to('/pemohon')
                : abort(403, 'Akun Anda tidak memiliki akses ke panel Admin.');
        }

        if ($isPemohonPanel && !$user->hasRole('pemohon')) {
            return $user->hasAnyRole(['admin', 'teknisi', 'super_admin'])
                ? redirect()->to('/admin')
                : abort(403, 'Akun Anda tidak memiliki akses ke panel Pemohon.');
        }

        return $next($request);
    }
}
