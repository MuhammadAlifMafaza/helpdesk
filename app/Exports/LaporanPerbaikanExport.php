<?php

namespace App\Exports;

use App\Models\Modules\Laporan\Models\LaporanPerbaikan;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LaporanPerbaikanExport implements
    FromQuery,
    WithHeadings,
    WithMapping,
    ShouldAutoSize
{
    protected Builder $query;

    public function __construct(Builder $query)
    {
        $this->query = $query;
    }

    public function query()
    {
        return $this->query;
    }

    public function headings(): array
    {
        return [
            'Kode Tiket',
            'Pemohon',
            'Keluhan',
            'Lokasi',
            'Kepemilikan',
            'Teknisi',
            'Status',
            'Kategori',
            'Mulai',
            'Selesai',
            'Durasi',
        ];
    }

    public function map($laporan): array
    {
        return [
            $laporan->kode_tiket,
            $laporan->nama_pemohon,
            $laporan->keluhan,
            $laporan->lokasi,
            $laporan->kepemilikan,
            $laporan->nama_teknisi,
            $laporan->status_label,
            $laporan->service_category,
            optional($laporan->waktu_mulai)?->format('d-m-Y H:i'),
            optional($laporan->waktu_selesai)?->format('d-m-Y H:i'),
            $laporan->durasi,
        ];
    }
}
