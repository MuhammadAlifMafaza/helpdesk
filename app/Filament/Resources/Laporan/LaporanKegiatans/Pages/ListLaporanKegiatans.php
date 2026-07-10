<?php

namespace App\Filament\Resources\Laporan\LaporanKegiatans\Pages;

use App\Filament\Resources\Laporan\LaporanKegiatans\LaporanKegiatanResource;
use Filament\Resources\Pages\ListRecords;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use App\Services\Laporan\LaporanExportService;

// Import Class Exporter (Kita akan membuatnya setelah ini)
use App\Exports\LaporanKegiatanExport;
use App\Services\Laporan\Word\LaporanKegiatanWord;
use App\Services\Laporan\Pdf\LaporanKegiatanPdf;

class ListLaporanKegiatans extends ListRecords
{
    protected static string $resource = LaporanKegiatanResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ActionGroup::make([
                // Tombol Export Excel
                Action::make('excel')
                    ->label('Export Excel')
                    ->icon('heroicon-o-document-chart-bar')
                    ->color('success')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportExcel(
                            $this->getFilteredTableQuery(),
                            LaporanKegiatanExport::class,
                            'Laporan-Kegiatan-Teknisi-' . now()->format('(d-m-Y)') . '.xlsx'
                        );
                    }),

                // Tombol Export Word
                Action::make('word')
                    ->label('Export Word')
                    ->icon('heroicon-o-document')
                    ->color('info')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportWord(
                            query: $this->getFilteredTableQuery(),
                            wordExporter: LaporanKegiatanWord::class,
                        );
                    }),

                // Tombol Export PDF
                Action::make('pdf')
                    ->label('Export PDF')
                    ->icon('heroicon-o-document-arrow-down')
                    ->color('danger')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportPDF(
                            query: $this->getFilteredTableQuery(),
                            exportClass: LaporanKegiatanPdf::class,
                        );
                    }),

                // Tombol Print Preview
                Action::make('print')
                    ->label('Print Preview')
                    ->icon('heroicon-o-printer')
                    ->color('warning')
                    ->action(function () {
                        $url = app(LaporanExportService::class)->print(
                            query: $this->getFilteredTableQuery(),
                            exportClass: LaporanKegiatanPdf::class,
                        );
                        return redirect($url);
                    }),
            ])
                ->label('Export Dokumen')
                ->icon('heroicon-o-arrow-down-tray')
                ->button(),
        ];
    }
}