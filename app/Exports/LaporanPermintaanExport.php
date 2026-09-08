<?php

namespace App\Exports;

// Pastikan mengimpor Model yang benar jika dibutuhkan untuk PhpDoc/Referensi
class LaporanPermintaanExport extends BaseLaporanExport
{
    protected function reportTitle(): string
    {
        return 'LAPORAN PERMINTAAN BARANG';
    }

    protected function documentNumber(): string
    {
        return 'No. 004/IWIMA/KTPI-P3SDI/0426';
    }

    public function headings(): array
    {
        return [
            'No',
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

    public function map($laporan): array
    {
        return [
            $this->nextRowNumber(),
            $laporan->kode_pengajuan ?? '-',
            $laporan->nama_pemohon ?? '-',
            $laporan->nama_barang ?? '-',
            $laporan->pengajuan?->jumlah ?? '-',
            $laporan->status_label ?? $laporan->status ?? '-',
            $laporan->outcome_label ?? $laporan->outcome ?? '-',
            $laporan->waktu_mulai?->format('d-m-Y H:i') ?? '-',
            $laporan->waktu_selesai?->format('d-m-Y H:i') ?? '-',
            $laporan->durasi ?? '-',
        ];
    }
}
