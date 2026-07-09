<?php

namespace App\Services\Laporan\Word;

use Illuminate\Database\Eloquent\Builder;
use App\Models\Modules\Laporan\Models\LaporanPerbaikan;
use App\Services\Laporan\Word\BaseWordExporter;
use App\Services\Laporan\LaporanExportService;

class LaporanPerbaikanWord extends BaseWordExporter
{
    /**
     * Query dari Filament Filter
     */
    protected Builder $query;

    /**
     * Header Table
     */
    protected const TABLE_HEADERS = [

        'No',

        'Kode Tiket',

        'Pemohon',

        'Lokasi',

        'Kepemilikan',

        'Teknisi',

        'Status',

        'Kategori',

        'Mulai',

        'Selesai',

        'Durasi',

    ];

    /**
     * Constructor
     */
    public function __construct(
        Builder $query
    ) {
        $this->query = clone $query;
        parent::__construct();
    }

    /**
     * Generate Document
     */
    public function generate(): string
    {
        return $this->save(
            'laporan-perbaikan.docx'
        );
    }

    /**
     * Build document content
     */
    protected function build(): void
    {
        $this->buildHeader(
            documentCode: '1FM-01.07.16/R0'
        );

        $this->buildDocumentTitle(
            title: 'Laporan Perbaikan PC Teknisi',
            documentNumber: 'No. 003/IWIMA/KTPI-P3SDI/0426'
        );

        $this->buildDocumentInfo(
            periode: 'Semester Genap 2025/2026',
            printedBy: auth()->user()?->name
        );

        $this->buildTable(
            headers: self::TABLE_HEADERS,
            rows: $this->prepareRows()
        );

        $this->buildSignature(
            leftTitle: 'Ka. Bidang Teknisi & Perawatan Infrastruktur',
            leftName: 'Edi Purwanto, S.Kom',

            rightTitle: 'Ka. UPT Laboratorium Komputer & Bahasa',
            rightName: 'Wachid Darmawan, M.Kom',
        );
    }
    /**
     * Prepare Data
     */
    protected function prepareRows(): array
    {
        $rows = [];

        $data = $this->query->get();

        foreach ($data as $index => $item) {
            $rows[] = [

                $index + 1,

                $item->kode_tiket,

                $item->nama_pemohon,

                $item->lokasi,

                $item->kepemilikan,

                $item->nama_teknisi ?: '-',

                $item->status_label,

                $item->service_category,

                optional(
                    $item->waktu_mulai
                )?->format(
                        'd/m/Y H:i'
                    ) ?: '-',

                optional(
                    $item->waktu_selesai
                )?->format(
                        'd/m/Y H:i'
                    ) ?: '-',

                $item->durasi,

            ];
        }
        return $rows;
    }
}
