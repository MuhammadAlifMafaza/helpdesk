<?php

namespace App\Services\Laporan\Pdf;

use Illuminate\Database\Eloquent\Builder;
use Barryvdh\DomPDF\Facade\Pdf;
use Symfony\Component\HttpFoundation\BinaryFileResponse;
use Illuminate\Support\Facades\Storage;

abstract class BasePdfExporter
{
    protected Builder $query;
    protected string $filename = 'laporan.pdf';
    protected string $view;

    public function __construct(Builder $query)
    {
        $this->query = clone $query;
    }

    abstract protected function prepareData(): array;

    protected function generateFilename(): string
    {
        $timestamp = now()->format('d-m-Y_H-i');
        $name = str($this->filename)->beforeLast('.')->slug('-');
        return "{$name}_{$timestamp}.pdf";
    }

    protected function generatePdf()
    {
        $data = $this->prepareData();
        return Pdf::loadView($this->view, $data)->setPaper('A4', 'landscape');
    }

    /* |--------------------------------------------------------------------------
    | Fitur 1: Unduh File PDF
    |--------------------------------------------------------------------------
    */
    public function download(): BinaryFileResponse
    {
        // Bersihkan memori buffer
        if (ob_get_level() > 0) {
            ob_end_clean();
        }

        $tempFile = sys_get_temp_dir() . DIRECTORY_SEPARATOR . $this->generateFilename();

        // Simpan PDF ke folder temporary
        $this->generatePdf()->save($tempFile);

        // Download dan hapus setelah terkirim
        return response()->download(
            $tempFile,
            $this->generateFilename()
        )->deleteFileAfterSend(true);
    }

    /* |--------------------------------------------------------------------------
    | Fitur 2: Print Preview di Browser
    |--------------------------------------------------------------------------
    */
    public function stream(): string
    {
        if (ob_get_level() > 0) {
            ob_end_clean();
        }

        $filename = 'preview_' . $this->generateFilename();
        
        // [PERBAIKAN] Pastikan folder 'pdf' benar-benar dibuat sebelum menyimpan file
        if (!Storage::disk('public')->exists('pdf')) {
            Storage::disk('public')->makeDirectory('pdf');
        }
        
        // Simpan ke storage/app/public/pdf
        Storage::disk('public')->put('pdf/' . $filename, $this->generatePdf()->output());
        
        return Storage::url('pdf/' . $filename);
    }
}
