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
            title: 'LAPORAN PERBAIKAN',
            subtitle: 'Sistem Helpdesk P3SDI',
            printedBy: auth()->user()?->name
        );

        $this->buildTable(
            headers: self::TABLE_HEADERS,
            rows: $this->prepareRows()
        );

        $this->buildSignature(
            title: 'Ka. Bidang Teknisi & Perawatan Infrastruktur',
            name: auth()->user()->name
        );

        $this->buildSignature(
            title: 'Ka. UPT Laboratorium Komputer & Bahasa',
            name: auth()->user()->name
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
