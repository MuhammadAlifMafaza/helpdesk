<?php

namespace App\Exports;

use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LaporanKegiatanExport implements
    FromQuery,
    WithHeadings,
    WithMapping,
    ShouldAutoSize
{
    protected Builder $query;

    public function __construct(Builder $query)
    {
        // Menerima query yang sudah difilter dari tabel Filament
        $this->query = $query;
    }

    public function query()
    {
        return $this->query;
    }

    /* Menentukan Judul Kolom (Baris 1) di Excel */
    public function headings(): array
    {
        return [
            'Hari / Tanggal',
            'Nama Teknisi',
            'Deskripsi Kegiatan',
        ];
    }

    /* Memetakan Data ke dalam Kolom Excel */
    public function map($laporan): array
    {
        return [
            // Memanfaatkan helper tanggal dari model, dengan format bahasa Indonesia
            $laporan->tanggal_kegiatan
            ? $laporan->tanggal_kegiatan->locale('id')->translatedFormat('l, d F Y')
            : '-',

            $laporan->nama_teknisi,

            // Menggunakan Null Coalescing (??) jika deskripsi kosong
            $laporan->deskripsi ?? '-',
        ];
    }
}