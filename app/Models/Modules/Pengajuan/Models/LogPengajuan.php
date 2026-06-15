<?php

namespace App\Models\Modules\Pengajuan\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class LogPengajuan extends Model
{
    protected $table = 'log_data_pengajuan_barang';

    const STATUS = 'Status';
    const CHAT = 'Chat';
    const UPDATE_DATA = 'Update Data';
    const PRIORITAS = 'Prioritas';
    public $timestamps = false;

    protected $fillable = [
        'pengajuan_id',
        'user_id',
        'kategori_log',
        'data_lama',
        'data_baru',
        'keterangan',
        'created_at',
    ];

    protected $casts = [
        'created_at' => 'datetime',
    ];

    public function pengajuan()
    {
        return $this->belongsTo(
            PengajuanBarang::class,
            'pengajuan_id'
        );
    }

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }
}