<?php

namespace App\Providers;

use Carbon\Carbon;
use Carbon\CarbonImmutable;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Str;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        RateLimiter::for('login', function (Request $request): Limit {
            $identifier = mb_strtolower(trim((string) $request->input(
                'identifier',
                $request->input('email', ''),
            )));

            return Limit::perMinute(5)->by(Str::transliterate($identifier.'|'.$request->ip()));
        });

        /*
        |----------------------------------------------------------------------
        | Locale Carbon → bahasa Indonesia
        |----------------------------------------------------------------------
        | Menyinkronkan locale Carbon dengan APP_LOCALE sehingga format
        | tanggal berbasis terjemahan (translatedFormat, diffForHumans)
        | menampilkan nama bulan & waktu relatif dalam bahasa Indonesia
        | ("24 Okt 2026", "3 jam yang lalu") alih-alih bahasa Inggris.
        |
        | Catatan: token format PHP polos (format('d M Y')) tidak
        | terpengaruh locale — gunakan translatedFormat() untuk teks bulan.
        */
        $locale = config('app.locale');

        Carbon::setLocale($locale);
        CarbonImmutable::setLocale($locale);
    }
}
