<?php

namespace App\Services\Laporan;

use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Facades\Excel;
use Symfony\Component\HttpFoundation\BinaryFileResponse;

class LaporanExportService
{
    /* Export Excel */
    public function exportExcel(
        Builder $query,
        string $export,
        string $filename
    ): BinaryFileResponse {

        return Excel::download(
            new $export($query),
            $filename
        );

    }
    /* Export Word */
    public function exportWord(
        Builder $query,
        string $wordExporter,
    ): BinaryFileResponse {

        $export = new $wordExporter($query);

        $path = $export->generate();

        return response()->download(
            $path
        )->deleteFileAfterSend();

    }
    /* Export PDF */
    public function exportPDF(
        Builder $query,
        string $exportClass
    ): BinaryFileResponse {
        $exporter = new $exportClass($query);

        return $exporter->download();
    }

    /* Print Preview */
    public function print(
        Builder $query,
    ) {

    }
}
