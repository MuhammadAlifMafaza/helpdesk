<?php

namespace App\Models\Modules\Teknisi\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;


class KegiatanTeknisi extends Model
{
    use SoftDeletes;
    
    protected $table = 'log_harian_teknisi';
    protected $fillable = [
        'id',
        'teknisi_id',
        'tanggal',
        'deskripsi_kegiatan',
    ];
}
