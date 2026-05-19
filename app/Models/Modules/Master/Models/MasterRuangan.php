<?php

namespace App\Models\Modules\Master\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Attributes\Fillable;

#[Fillable(['nama_ruangan', 'nama_gedung'])]
class MasterRuangan extends Model
{
    //
    protected $table = 'master_ruangan';

    protected $fillable = [
        'nama_ruangan',
        'nama_gedung'
    ];

    protected $casts = [
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    
}
