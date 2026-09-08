<?php

namespace App\Services\Laporan;

use Illuminate\Database\Eloquent\Builder;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Maatwebsite\Excel\Facades\Excel;

class LaporanExportService
{
    /* Export Excel */
    public function exportExcel(
        Builder $query,
        string $export,
        string $filename,
        string $periode = '-'
    ): BinaryFileResponse {

        return Excel::download(
            new $export($query, $periode),
            $filename
        );

    }
    /* Export Word */
    public function exportWord(
        Builder $query,
        string $wordExporter,
        string $periode = '-'
    ): BinaryFileResponse {

        /** @var \App\Services\Laporan\Word\BaseWordExporter $export */
        $export = new $wordExporter(
            $query,
            $periode
        );

        return $export->download();
    }

    /* Export PDF (Download File) */
    public function exportPDF(
        Builder $query,
        string $exportClass,
        string $periode = '-'
    ): BinaryFileResponse {  // <- Pastikan ini BinaryFileResponse
        $exporter = new $exportClass($query, $periode);
        return $exporter->download();
    }

    /* Print Preview (Tampilkan di Browser) */
    public function print(
        Builder $query,
        string $exportClass,
        string $periode = '-'
    ): string { // <- Ubah ini menjadi 'string' karena mengembalikan URL
        $exporter = new $exportClass($query, $periode);
        return $exporter->stream();
    }
}
