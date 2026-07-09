<?php

namespace App\Exports;

use App\Models\Modules\Laporan\Models\LaporanBarang;
use Maatwebsite\Excel\Concerns\FromCollection;

class LaporanBarangExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return LaporanBarang::all();
    }
}
