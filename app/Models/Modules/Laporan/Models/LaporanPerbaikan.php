<?php

namespace App\Models\Modules\Laporan\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LaporanPerbaikan extends Model
{
    protected $table = 'view_laporan_service';

    protected $primaryKey = 'no_tiket';

    public $incrementing = false;

    protected $keyType = 'int';
}
