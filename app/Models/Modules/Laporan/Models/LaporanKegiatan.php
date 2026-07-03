<?php

namespace App\Models\Modules\Laporan\Models;

use Illuminate\Database\Eloquent\Model;

class LaporanKegiatan extends Model
{
    //
    protected $table = 'view_laporan_kegiatan';

    protected $primaryKey = 'id_log';

    public $incrementing = false;

    protected $keyType = 'int';

    public $timestamps = false;
}
