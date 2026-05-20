<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\Fillable;
use Illuminate\Database\Eloquent\Attributes\Hidden;

#[Fillable(['user_id', 'ruangan_id', 'judul', 'deskripsi', 'status'])]
#[Hidden(['created_at', 'updated_at'])]
class TiketPerbaikan extends Model
{
    protected $table = 'tiket_perbaikan';

    protected $fillable = [
        'user_id',
        'ruangan_id',
        'judul',
        'deskripsi',
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
            LogPerbaikan::class,
            'tiket_id'
        );
    }
}
