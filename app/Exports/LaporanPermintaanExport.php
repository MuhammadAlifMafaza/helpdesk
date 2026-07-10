<?php

namespace App\Exports;

// Pastikan mengimpor Model yang benar jika dibutuhkan untuk PhpDoc/Referensi
use App\Models\Modules\Laporan\Models\LaporanPermintaanBarang;
use Illuminate\Database\Eloquent\Builder;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;

class LaporanPermintaanExport implements
    FromQuery,
    WithHeadings,
    WithMapping,
    ShouldAutoSize
{
    protected Builder $query;

    public function __construct(Builder $query)
    {
        // Menyimpan query yang dikirim dari tombol Export di Filament
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
            'Kode Pengajuan',
            'Pemohon',
            'Nama Barang',
            'Jumlah',
            'Status',
            'Hasil Persetujuan',
            'Waktu Mulai',
            'Waktu Selesai',
            'Durasi Pengerjaan',
        ];
    }

    /* Memetakan Data ke dalam Kolom Excel */
    public function map($laporan): array
    {
        return [
            $laporan->kode_pengajuan,
            $laporan->nama_pemohon,
            $laporan->nama_barang,

            // Ambil dari relasi, pastikan ada nilai fallback jika kosong
            $laporan->pengajuan?->jumlah ?? '-',

            $laporan->status_label,
            $laporan->outcome_label,

            // Menggunakan Nullsafe Operator (?->) untuk mencegah error jika tanggal kosong
            $laporan->waktu_mulai?->format('d-m-Y H:i') ?? '-',
            $laporan->waktu_selesai?->format('d-m-Y H:i') ?? '-',

            $laporan->durasi,
        ];
    }
}