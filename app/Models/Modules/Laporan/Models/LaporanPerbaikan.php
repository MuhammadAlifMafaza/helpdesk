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

    /*
    |--------------------------------------------------------------------------
    | Configuration
    |--------------------------------------------------------------------------
    */

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

    /*
    |--------------------------------------------------------------------------
    | Relationship
    |--------------------------------------------------------------------------
    */
    public function tiket()
    {
        return $this->belongsTo(
            TiketPerbaikan::class,
            'no_tiket',
            'id',
            'kode_tiket'
        );
    }

    public function logs()
    {
        return $this->hasMany(
            LogPerbaikan::class,
            'tiket_id',
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

        return $query->where(function ($query) use ($search) {

            $query

                ->where('no_tiket', 'like', "%{$search}%")
                ->orWhere('nama_pemohon', 'like', "%{$search}%")
                ->orWhere('nama_teknisi', 'like', "%{$search}%")
                ->orWhere('lokasi', 'like', "%{$search}%")
                ->orWhere('kepemilikan', 'like', "%{$search}%")
                ->orWhere('status', 'like', "%{$search}%");

            $query->orWhereHas('tiket', function ($q) use ($search) {

                $q
                    ->where('keluhan', 'like', "%{$search}%")
                    ->orWhere('deskripsi', 'like', "%{$search}%");

            });

        });

    }

    /*
    |--------------------------------------------------------------------------
    | Scope Status
    |--------------------------------------------------------------------------
    */

    public function scopeOpen(Builder $query): Builder
    {
        return $query->where('status', 'Open');
    }

    public function scopeProgress(Builder $query): Builder
    {
        return $query->where('status', 'In Progress');
    }

    public function scopeClosed(Builder $query): Builder
    {
        return $query->where('status', 'Close');
    }

    /*
    |--------------------------------------------------------------------------
    | Scope Date
    |--------------------------------------------------------------------------
    */

    public function scopeToday(Builder $query): Builder
    {
        return $query->whereDate('waktu_mulai', today());
    }

    public function scopeThisMonth(Builder $query): Builder
    {
        return $query
            ->whereMonth('waktu_mulai', now()->month)
            ->whereYear('waktu_mulai', now()->year);
    }

    public function scopeThisYear(Builder $query): Builder
    {
        return $query
            ->whereYear('waktu_mulai', now()->year);
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Kode Tiket
    |--------------------------------------------------------------------------
    */

    public function getKodeTiketAttribute(): string
    {
        if (!$this->waktu_mulai) {
            return "TK-{$this->no_tiket}";
        }

        $firstId = self::query()
            ->whereDate('waktu_mulai', $this->waktu_mulai->toDateString())
            ->min('no_tiket');

        $urut = ($this->no_tiket - $firstId) + 1;

        return sprintf(
            'TK-%s-%04d',
            $this->waktu_mulai->format('dmY'),
            $urut
        );
    }
    
    /*
    |--------------------------------------------------------------------------
    | Helper Kepemilikan
    |--------------------------------------------------------------------------
    */

    public function getOwnershipLabelAttribute(): string
    {
        return $this->kepemilikan;
    }

    public function getOwnershipColorAttribute(): string
    {
        return match ($this->kepemilikan) {
            'Inventaris Kantor' => 'success',
            'Pribadi' => 'warning',
            default => 'gray',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Status
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

    public function getStatusColorAttribute(): string
    {
        return match ($this->status) {
            'Open' => 'info',
            'In Progress' => 'warning',
            'Close' => 'success',
            default => 'gray',
        };
    }

    public function getStatusIconAttribute(): string
    {
        return match ($this->status) {
            'Open' => 'heroicon-o-clock',
            'In Progress' => 'heroicon-o-wrench-screwdriver',
            'Close' => 'heroicon-o-check-circle',
            default => 'heroicon-o-question-mark-circle',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Outcome
    |--------------------------------------------------------------------------
    */

    public function getOutcomeAttribute(): ?string
    {
        return $this->tiket?->status_outcome;
    }

    public function getOutcomeLabelAttribute(): string
    {
        return match ($this->outcome) {
            'Completed' => 'Berhasil',
            'Rejected' => 'Ditolak',
            default => '-',
        };
    }

    public function getOutcomeColorAttribute(): string
    {
        return match ($this->outcome) {
            'Completed' => 'success',
            'Rejected' => 'danger',
            default => 'gray',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Duration
    |--------------------------------------------------------------------------
    */

    public function getDurasiAttribute(): string
    {
        if (
            empty($this->durasi_pengerjaan_menit) ||
            $this->durasi_pengerjaan_menit <= 0
        ) {
            return '-';
        }

        $totalMenit = (int) $this->durasi_pengerjaan_menit;

        $bulan = floor($totalMenit / (60 * 24 * 30));
        $totalMenit %= (60 * 24 * 30);

        $minggu = floor($totalMenit / (60 * 24 * 7));
        $totalMenit %= (60 * 24 * 7);

        $hari = floor($totalMenit / (60 * 24));
        $totalMenit %= (60 * 24);

        $jam = floor($totalMenit / 60);

        $menit = $totalMenit % 60;

        $hasil = [];

        if ($bulan > 0) {
            $hasil[] = "{$bulan} Bulan";
        }

        if ($minggu > 0) {
            $hasil[] = "{$minggu} Minggu";
        }

        if ($hari > 0) {
            $hasil[] = "{$hari} Hari";
        }

        if ($jam > 0) {
            $hasil[] = "{$jam} Jam";
        }

        if ($menit > 0) {
            $hasil[] = "{$menit} Menit";
        }

        return implode(' ', $hasil);
    }

    public function getDurasiJamAttribute(): float
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 0;
        }

        return round(
            $this->durasi_pengerjaan_menit / 60,
            2
        );
    }

    public function getDurasiHariAttribute(): float
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 0;
        }

        return round(
            $this->durasi_pengerjaan_menit / 1440,
            2
        );
    }

    public function getDurasiMingguAttribute(): float
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 0;
        }

        return round(
            $this->durasi_pengerjaan_menit / 10080,
            2
        );
    }

    public function getDurasiBulanAttribute(): float
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 0;
        }

        return round(
            $this->durasi_pengerjaan_menit / 43200,
            2
        );
    }

    public function getDurasiLevelAttribute(): string
    {
        if (!$this->durasi_pengerjaan_menit) {
            return 'Belum Selesai';
        }

        return match (true) {
            $this->durasi_pengerjaan_menit < 60 => 'Menit',
            $this->durasi_pengerjaan_menit < 1440 => 'Jam',
            $this->durasi_pengerjaan_menit < 10080 => 'Hari',
            $this->durasi_pengerjaan_menit < 43200 => 'Minggu',
            default => 'Bulan',
        };
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Waktu Mulai
    |--------------------------------------------------------------------------
    */

    public function getTanggalMulaiAttribute(): ?string
    {
        return $this->waktu_mulai?->format('d M Y');
    }

    public function getJamMulaiAttribute(): ?string
    {
        return $this->waktu_mulai?->format('H:i:s');
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Waktu Selesai
    |--------------------------------------------------------------------------
    */

    public function getTanggalSelesaiAttribute(): ?string
    {
        return $this->waktu_selesai
                ?->format('d M Y');
    }

    public function getJamSelesaiAttribute(): ?string
    {
        return $this->waktu_selesai
                ?->format('H:i:s');
    }

    /*
    |--------------------------------------------------------------------------
    | Service Category
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

    public function getServiceCategoryColorAttribute(): string
    {
        return match ($this->service_category) {

            'Cepat' => 'success',

            'Normal' => 'warning',

            'Lama' => 'danger',

            default => 'gray',

        };
    }

    /*
    |--------------------------------------------------------------------------
    | Summary
    |--------------------------------------------------------------------------
    */

    public function getSummaryAttribute(): string
    {
        return sprintf(
            '%s | %s | %s | %s',
            $this->tiket?->kode_tiket,
            $this->nama_pemohon,
            $this->status_label,
            $this->durasi
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Helper Teknisi
    |--------------------------------------------------------------------------
    */

    public function getNamaTeknisiLabelAttribute(): string
    {
        return $this->nama_teknisi
            ?: 'Belum Ada Teknisi';
    }

    public function getTeknisiLabelAttribute(): string
    {
        return $this->nama_teknisi ?: 'Belum Ditugaskan';
    }

    public function getHasTeknisiAttribute(): bool
    {
        return filled($this->nama_teknisi);
    }

    /*
    |--------------------------------------------------------------------------
    | Report Helper
    |--------------------------------------------------------------------------
    */

    public function getIsFinishedAttribute(): bool
    {
        return $this->status === 'Close';
    }

    public function getIsProgressAttribute(): bool
    {
        return $this->status === 'In Progress';
    }

    public function getIsOpenAttribute(): bool
    {
        return $this->status === 'Open';
    }

    /*
    |--------------------------------------------------------------------------
    | Export Helper
    |--------------------------------------------------------------------------
    */

    public function getCanExportAttribute(): bool
    {
        return $this->is_finished;
    }

    public function getExportStatusAttribute(): string
    {
        return $this->status_label;
    }

    public function getExportDurasiAttribute(): string
    {
        return $this->durasi;
    }

    public function getExportOutcomeAttribute(): string
    {
        return $this->outcome_label;
    }

    public function getExportTeknisiAttribute(): string
    {
        return $this->nama_teknisi ?? '-';
    }

}
