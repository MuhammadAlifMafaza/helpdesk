<?php

namespace App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages;

use App\Exports\LaporanPermintaanExport;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\LaporanPermintaanBarangResource;
use App\Services\Laporan\LaporanExportService;
use App\Services\Laporan\Pdf\LaporanPermintaanPdf;
use App\Services\Laporan\Word\LaporanPermintaanWord;
// Nanti kita akan buat class Export ini (sementara biarkan di-import)
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Resources\Pages\ListRecords;

class ListLaporanPermintaanBarangs extends ListRecords
{
    protected static string $resource = LaporanPermintaanBarangResource::class;

    protected function getHeaderActions(): array
    {
        return [
            ActionGroup::make([
                // Tombol Export Excel
                Action::make('excel')
                    ->label('Excel')
                    ->icon('heroicon-o-document-chart-bar')
                    ->color('success')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportExcel(
                            $this->getFilteredTableQuery(),
                            LaporanPermintaanExport::class,
                            'Laporan-Permintaan-Barang-'.now()->format('(d-m-Y)').'.xlsx'
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
