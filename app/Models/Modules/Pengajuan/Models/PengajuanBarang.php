<?php

namespace App\Models\Modules\Pengajuan\Models;

use Illuminate\Database\Eloquent\Model;

class PengajuanBarang extends Model
{
    protected $table = 'pengajuan_barang';

    protected $fillable = [
        'user_id',
        'ruangan_id',
        'nama_barang',
        'alasan_pengajuan',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(
            \App\Models\User::class,
            'user_id'
        );
    }

    public function ruangan()
    {
        return $this->belongsTo(
            \App\Models\Modules\Master\Models\MasterRuangan::class,
            'ruangan_id'
        );
    }

    public function logs()
    {
        return $this->hasMany(
            LogPengajuan::class,
            'pengajuan_id'
        );
    }
}
