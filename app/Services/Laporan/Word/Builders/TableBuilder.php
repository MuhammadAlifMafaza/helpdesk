<?php

namespace App\Services\Laporan\Word\Builders;

use PhpOffice\PhpWord\Element\Section;

class TableBuilder
{

    private const HEADER_STYLE = [
        'bold' => true,
        'size' => 10,
    ];

    private const BODY_STYLE = [
        'size' => 10,
    ];

    private const HEADER_CELL = [
        'bgColor' => 'D9EAD3',
        'valign' => 'center',
    ];

    private const BODY_CELL = [
        'valign' => 'center',
    ];

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
        | Style
        |--------------------------------------------------------------------------
        */


        /*
        |--------------------------------------------------------------------------
        | Header
        |--------------------------------------------------------------------------
        */

        $table->addRow();

        foreach ($headers as $header) {

            $table

                ->addCell(
                    1200,
                    self::HEADER_CELL
                )

                ->addText(

                    $header,

                    self::HEADER_STYLE,

                    [

                        'alignment' => 'center',

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
