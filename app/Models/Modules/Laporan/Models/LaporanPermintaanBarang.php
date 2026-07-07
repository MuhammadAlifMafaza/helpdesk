<?php

namespace App\Models\Modules\Laporan\Models;

use App\Models\Modules\Pengajuan\Models\LogPengajuan;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Illuminate\Database\Eloquent\Model;

class LaporanPermintaanBarang extends Model
{
    protected $table = 'view_laporan_barang';
    protected $primaryKey = 'no_pengajuan';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;
}
