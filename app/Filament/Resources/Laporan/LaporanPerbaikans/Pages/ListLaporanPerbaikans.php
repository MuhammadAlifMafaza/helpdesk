<?php

namespace App\Filament\Resources\Laporan\LaporanPerbaikans\Pages;

use App\Exports\LaporanPerbaikanExport;
use App\Filament\Resources\Laporan\LaporanPerbaikans\LaporanPerbaikanResource;
use App\Filament\Resources\Laporan\LaporanPerbaikans\Widgets\LaporanPerbaikanStats;
// Import Export Dokument Service
use App\Services\Laporan\LaporanExportService;
use App\Services\Laporan\Pdf\LaporanPerbaikanPdf;
use App\Services\Laporan\Word\LaporanPerbaikanWord;
use Filament\Actions\Action;
use Filament\Actions\ActionGroup;
use Filament\Resources\Pages\ListRecords;

class ListLaporanPerbaikans extends ListRecords
{
    protected static string $resource = LaporanPerbaikanResource::class;

    protected function getHeaderActions(): array
    {
        return [

            ActionGroup::make([

                Action::make('excel')
                    ->label('Export Excel')
                    ->icon('heroicon-o-document-chart-bar')
                    ->color('success')
                    ->action(function () {
                        return app(LaporanExportService::class)
                            ->exportExcel(
                                $this->getFilteredTableQuery(),
                                LaporanPerbaikanExport::class,
                                'Laporan-Perbaikan-'.now()->format('(d-m-Y)').'.xlsx'
                            );
                    }),

                Action::make('word')
                    ->label('Export Word')
                    ->icon('heroicon-o-document')
                    ->color('info')
                    ->action(function () {
                        return app(
                            LaporanExportService::class
                        )->exportWord(
                            query: $this->getFilteredTableQuery(),
                            wordExporter: LaporanPerbaikanWord::class,
                        );
                    }),

                Action::make('pdf')
                    ->label('Export PDF')
                    ->icon('heroicon-o-document-arrow-down')
                    ->color('danger')
                    ->action(function () {
                        return app(LaporanExportService::class)->exportPDF(
                            query: $this->getFilteredTableQuery(),
                            exportClass: LaporanPerbaikanPdf::class,
                        );
                    }),

                // Tombol Print Preview
                Action::make('print')
                    ->label('Print Preview')
                    ->icon('heroicon-o-printer')
                    ->color('warning')
                    ->action(function () {
                        // 1. Dapatkan link URL PDF-nya
                        $url = app(LaporanExportService::class)->print(
                            query: $this->getFilteredTableQuery(),
                            exportClass: LaporanPerbaikanPdf::class,
                        );

                        // 2. Alihkan pengguna ke link tersebut untuk melihat preview
                        return redirect($url);
                    }),
            ])
                ->label('Export Dokumen')
                ->icon('heroicon-o-arrow-down-tray')
                ->button(),

        ];
    }

    protected function getHeaderWidgets(): array
    {
        return [
            LaporanPerbaikanStats::class,
        ];
    }
}
