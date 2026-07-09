<?php

namespace App\Services\Laporan\Word\Builders;

use PhpOffice\PhpWord\Element\Section;

class TableBuilder
{
    /**
     * Build Table
     */
    public function build(
        Section $section,
        array $headers,
        array $rows
    ): void {

        $table = $section->addTable('MainTable');

        /*
        |--------------------------------------------------------------------------
        | Header
        |--------------------------------------------------------------------------
        */

        $table->addRow();

        foreach ($headers as $header) {
            $label = is_array($header) ? ($header['label'] ?? '') : (string) $header;
            $width = is_array($header) ? ($header['width'] ?? 1500) : 1500;

            $table
                ->addCell(
                    $width,
                    [
                        'bgColor' => 'D9EAD3',
                    ]
                )
                ->addText(
                    $label,
                    [
                        'bold' => true,
                    ]
                );

        }

        /*
        |--------------------------------------------------------------------------
        | Data
        |--------------------------------------------------------------------------
        */

        foreach ($rows as $row) {

            $table->addRow();

            foreach ($row as $value) {

                $table
                    ->addCell()
                    ->addText(
                        (string) $value
                    );
            }
        }
    }
}
