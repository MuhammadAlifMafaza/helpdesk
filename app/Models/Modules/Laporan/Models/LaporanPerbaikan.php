<?php

namespace App\Models\Modules\Laporan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;


class LaporanPerbaikan extends Model
{
    protected $table = 'view_laporan_service';
    protected $primaryKey = 'no_tiket';
    public $incrementing = false;
    protected $keyType = 'int';

    
}
