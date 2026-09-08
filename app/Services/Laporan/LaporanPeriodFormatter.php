<?php

namespace App\Services\Laporan;

use Carbon\Carbon;

class LaporanPeriodFormatter
{
    public static function format(?array $filter): string
    {
        $from = self::parse($filter['dari_tanggal'] ?? $filter['from'] ?? null);
        $until = self::parse($filter['sampai_tanggal'] ?? $filter['until'] ?? null);

        if (! $from && ! $until) {
            return '-';
        }

        if ($from && $until) {
            if ($from->isSameMonth($until)) {
                return self::month($from);
            }

            return self::month($from).' - '.self::month($until);
        }

        return $from
            ? 'Mulai '.self::month($from)
            : 'Sampai '.self::month($until);
    }

    private static function parse(?string $date): ?Carbon
    {
        return filled($date) ? Carbon::parse($date)->locale('id') : null;
    }

    private static function month(Carbon $date): string
    {
        return $date->translatedFormat('F Y');
    }
}
