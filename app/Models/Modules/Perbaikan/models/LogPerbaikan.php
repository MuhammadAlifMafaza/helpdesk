<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;

#[Fillable(['tiket_id', 'user_id', 'kategori_log', 'deskripsi'])]
#[Hidden(['created_at', 'updated_at'])]
class LogPerbaikan extends Model
{
    protected $table = 'log_data_tiket_perbaikan';

    protected $fillable = [
        'tiket_id',
        'user_id',
        'kategori_log',
        'deskripsi',
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
            \App\Models\User::class,
            'user_id'
        );
    }
}
