<?php

namespace App\Exports;

class LaporanPerbaikanExport extends BaseLaporanExport
{
    protected function reportTitle(): string
    {
        return 'LAPORAN PERBAIKAN PC TEKNISI';
    }

    protected function documentNumber(): string
    {
        return 'No. 003/IWIMA/KTPI-P3SDI/0426';
    }

    public function headings(): array
    {
        return [
            'No',
            'Kode Tiket',
            'Pemohon',
            'Lokasi',
            'Tgl Masuk',
            'Tgl Selesai',
            'Keterangan',
            'Status',
        ];
    }

    public function map($laporan): array
    {
        return [
            $this->nextRowNumber(),
            $laporan->kode_tiket ?? '-',
            $laporan->nama_pemohon ?? '-',
            $laporan->lokasi ?? '-',
            $laporan->waktu_mulai?->format('d/m/Y') ?? '-',
            $laporan->waktu_selesai?->format('d/m/Y') ?? '-',
            $laporan->keluhan ?? $laporan->service_category ?? '-',
            $laporan->status_label ?? $laporan->status ?? '-',
        ];
    }
}
