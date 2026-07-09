<?php

namespace App\Exports;

use App\Models\Modules\Laporan\Models\LaporanKegiatan;
use Maatwebsite\Excel\Concerns\FromCollection;

class LaporanKegiatanExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return LaporanKegiatan::all();
    }
}
