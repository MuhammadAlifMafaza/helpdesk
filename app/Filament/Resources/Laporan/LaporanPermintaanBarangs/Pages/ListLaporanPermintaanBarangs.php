<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages;

use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\LaporanPermintaanBarangResource;
use Filament\Resources\Pages\ListRecords;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use App\Services\Laporan\LaporanExportService;

// Nanti kita akan buat class Export ini (sementara biarkan di-import)
use App\Exports\LaporanPermintaanExport;
use App\Services\Laporan\Word\LaporanPermintaanWord;
use App\Services\Laporan\Pdf\LaporanPermintaanPdf;

class ListLaporanPermintaanBarangs extends ListRecords
{
    protected static string $resource = LaporanPermintaanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ActionGroup::make([
                // Tombol Export Excel
                Action::make('excel')
                    ->disabled()
                    ->label('Excel (coming soon)')
                    ->icon('heroicon-o-document-chart-bar')
                    // ->color('success')
                    ->color('gray')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportExcel(
                            $this->getFilteredTableQuery(),
                            LaporanPermintaanExport::class,
                            'Laporan-Permintaan-Barang-' . now()->format('(d-m-Y)') . '.xlsx'
                        );
                    }),

                // Tombol Export Word
                Action::make('word')
                    ->disabled()
                    ->label('Word (coming soon)')
                    ->icon('heroicon-o-document-text')
                    // ->color('info')
                    ->color('gray')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportWord(
                            query: $this->getFilteredTableQuery(),
                            wordExporter: LaporanPermintaanWord::class,
                        );
                    }),

                // Tombol Export PDF
                Action::make('pdf')
                    ->label('PDF')
                    ->icon('heroicon-o-document-arrow-down')
                    ->color('danger')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportPDF(
                            query: $this->getFilteredTableQuery(),
                            exportClass: LaporanPermintaanPdf::class,
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
                            exportClass: LaporanPermintaanPdf::class,
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
