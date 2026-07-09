<?php

namespace App\Services\Laporan\Word\Builders;

use PhpOffice\PhpWord\Element\Section;

class HeaderBuilder
{
    public function build(
        Section $section,
        string $title,
        string $subtitle,
        ?string $periode = null,
        ?string $printedBy = null
    ): void {

        $logoCell->addImage(
            public_path('images/logo-iwima.png'),
            [
                'width' => 58,
                'height' => 58,
            ]
        );
        /*
        |--------------------------------------------------------------------------
        | Nama Kampus
        |--------------------------------------------------------------------------
        */

        $section->addText(
            'INSTITUT WIDYA PRATAMA',
            [
                'bold' => true,
                'size' => 16,
            ],
            [
                'alignment' => 'center',
            ]
        );

        $section->addText(
            'Pusat Pengembangan Sistem dan Data Informasi (P3SDI)',
            [
                'size' => 11,
            ],
            [
                'alignment' => 'center',
            ]
        );

        $section->addTextBreak();

        /*
        |--------------------------------------------------------------------------
        | Judul
        |--------------------------------------------------------------------------
        */

        $section->addText(
            strtoupper($title),
            [
                'bold' => true,
                'size' => 15,
            ],
            [
                'alignment' => 'center',
            ]
        );

        $section->addText(
            strtoupper($subtitle),
            [
                'bold' => true,
                'size' => 15,
            ],
            [
                'alignment' => 'center',
            ]
        );

        $section->addTextBreak();

        /*
        |--------------------------------------------------------------------------
        | Informasi Dokumen
        |--------------------------------------------------------------------------
        */

        $table = $section->addTable();

        $table->addRow();

        $table->addCell(2200)->addText('Periode');

        $table->addCell(300)->addText(':');

        $table->addCell(6000)->addText(
            $periode ?? '-'
        );

        $table->addRow();

        $table->addCell()->addText('Tanggal Cetak');

        $table->addCell()->addText(':');

        $table->addCell()->addText(
            now()->format('d F Y H:i')
        );

        $table->addRow();

        $table->addCell()->addText('Dicetak Oleh');

        $table->addCell()->addText(':');

        $table->addCell()->addText(
            $printedBy ?? '-'
        );

        $section->addTextBreak();
    }
}
