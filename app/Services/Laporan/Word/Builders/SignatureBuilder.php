<?php

namespace App\Services\Laporan\Word\Builders;

use Carbon\Carbon;
use PhpOffice\PhpWord\Element\Section;

class SignatureBuilder
{
    public function build(
        Section $section,
        string $title,
        string $name,
        string $city = 'Pekalongan',
        Carbon|string|null $date = null,
        string $alignment = 'right',
    ): void {

        $date = $date instanceof Carbon
            ? $date
            : Carbon::parse($date ?? now());

        $section->addTextBreak(2);

        $section->addText(
            "{$city}, {$date->translatedFormat('d F Y')}",
            [],
            [
                'alignment' => $alignment,
            ]
        );

        $section->addText(
            $title,
            [
                'bold' => true,
            ],
            [
                'alignment' => $alignment,
            ]
        );

        /*
        |--------------------------------------------------------------------------
        | Space tanda tangan
        |--------------------------------------------------------------------------
        */

        $section->addTextBreak(4);

        $section->addText(
            $name,
            [
                'bold' => true,
                'underline' => 'single',
            ],
            [
                'alignment' => $alignment,
            ]
        );
    }
}
