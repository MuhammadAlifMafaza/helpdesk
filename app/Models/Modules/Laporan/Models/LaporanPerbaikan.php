<?php

namespace App\Models\Modules\Laporan\Models;

use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;


class LaporanPerbaikan extends Model
{
    protected $table = 'view_laporan_service';
    protected $primaryKey = 'no_tiket';
    public $incrementing = false;
    protected $keyType = 'int';
    public $timestamps = false;
    protected $guarded = [];
    protected $casts = [
        'waktu_mulai' => 'datetime',
        'waktu_selesai' => 'datetime',
        'durasi_pengerjaan_menit' => 'integer',
    ];

    public function tiket()
    {
        return $this->belongsTo(
            TiketPerbaikan::class,
            'no_tiket'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Scope Search
    |--------------------------------------------------------------------------
    */

    public function scopeSearchLaporan(
        Builder $query,
        string $search
    ): Builder {

        return $query->where(function (Builder $query) use ($search) {
            $query
                ->where('no_tiket', 'like', "%{$search}%")
                ->orWhere('nama_pemohon', 'like', "%{$search}%")
                ->orWhere('nama_teknisi', 'like', "%{$search}%")
                ->orWhere('lokasi', 'like', "%{$search}%")
                ->orWhere('kepemilikan', 'like', "%{$search}%")
                ->orWhere('status', 'like', "%{$search}%");
        });

    }

    /*
    |--------------------------------------------------------------------------
    | Helper Status Color
    |--------------------------------------------------------------------------
    */
    public function getStatusColorAttribute(): string
    {
        return match ($this->status) {
            'Open' => 'info',
            'In Progress' => 'warning',
            'Close' => 'success',
            default => 'gray',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Status Label
    |--------------------------------------------------------------------------
    */

    public function getStatusLabelAttribute(): string
    {
        return match ($this->status) {
            'Open' => 'Open',
            'In Progress' => 'Sedang Dikerjakan',
            'Close' => 'Selesai',
            default => '-',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Durasi
    |--------------------------------------------------------------------------
    */

    public function getDurasiAttribute(): string
    {
        if (!$this->durasi_pengerjaan_menit) {
            return '-';
        }
        $jam = floor($this->durasi_pengerjaan_menit / 60);
        $menit = $this->durasi_pengerjaan_menit % 60;
        if ($jam > 0) {
            return "{$jam} Jam {$menit} Menit";
        }
        return "{$menit} Menit";
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Lama Service
    |--------------------------------------------------------------------------
    */

    public function getServiceCategoryAttribute(): string
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 'Belum Selesai';
        }

        return match (true) {
            $this->durasi_pengerjaan_menit <= 60
            => 'Cepat',

            $this->durasi_pengerjaan_menit <= 240
            => 'Normal',

            default
            => 'Lama',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Badge Color Durasi
    |--------------------------------------------------------------------------
    */

    public function getServiceCategoryColorAttribute(): string
    {
        return match ($this->service_category) {
            'Cepat'
            => 'success',

            'Normal'
            => 'warning',

            'Lama'
            => 'danger',

            default
            => 'gray',
        };
    }

}
