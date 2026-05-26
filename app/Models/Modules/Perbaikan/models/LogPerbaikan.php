<?php

namespace App\Models\Modules\Perbaikan\Models;

use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class LogPerbaikan extends Model
{
    protected $table = 'log_data_tiket_perbaikan';

    protected $fillable = [
        'tiket_id',
        'user_id',
        'kategori_log',
        'data_lama',
        'data_baru',
        'keterangan',
    ];

    public function tiket()
    {
        return $this->belongsTo(
            TiketPerbaikan::class,
            'tiket_id'
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
