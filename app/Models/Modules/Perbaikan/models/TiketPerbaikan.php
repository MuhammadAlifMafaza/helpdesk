<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;

class TiketPerbaikan extends Model
{
    protected $table = 'tiket_perbaikan';

    protected $fillable = [
        'kode_tiket',
        'user_id',
        'ruangan_id',
        'judul',
        'deskripsi',
        'status',
        'prioritas',
    ];

    protected static function booted()
    {
        // Generate kode_tiket secara otomatis saat membuat tiket baru
        static::creating(function ($tiket) {

            $lastId = self::max('id') + 1;

            $tiket->kode_tiket =
                'TKT-' . str_pad($lastId, 5, '0', STR_PAD_LEFT);
        });

        // Log saat tiket dibuat
        static::created(function ($tiket) {

            LogPerbaikan::create([
                'tiket_id' => $tiket->id,
                'user_id' => auth()->id(),
                'kategori_log' => 'Status',
                'data_lama' => null,
                'data_baru' => 'Open',
                'keterangan' => 'Tiket dibuat',
            ]);
        });

        // Log perubahan status tiket
        static::updated(function ($tiket) {

            if ($tiket->wasChanged('status')) {

                LogPerbaikan::create([
                    'tiket_id' => $tiket->id,
                    'user_id' => auth()->id(),
                    'kategori_log' => 'Status',
                    'data_lama' => $tiket->getOriginal('status'),
                    'data_baru' => $tiket->status,
                    'keterangan' => 'Status tiket diperbarui',
                ]);
            }
        });
    }

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    public function ruangan()
    {
        return $this->belongsTo(
            MasterRuangan::class,
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
