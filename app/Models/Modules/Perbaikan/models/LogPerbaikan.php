<?php

namespace App\Models\Modules\Perbaikan\Models;

// use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class LogPerbaikan extends Model
{
    protected $table = 'log_data_tiket_perbaikan';

    const STATUS = 'Status';
    const CHAT = 'Chat';
    const UPDATE_DATA = 'Update Data';

    public $timestamps = false;

    protected $fillable = [
        'tiket_id',
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

    /* HELPER TIMELINE */
    public function getTimelineTitleAttribute(): string
    {
        return match (true) {

            $this->kategori_log === 'Status'
            && blank($this->data_lama)
            && $this->data_baru === 'Open'
            => 'Tiket Dibuat',

            $this->kategori_log === 'Status'
            && $this->data_lama === 'Open'
            && $this->data_baru === 'In Progress'
            => 'Pengerjaan Dimulai',

            $this->kategori_log === 'Status'
            && $this->data_lama === 'In Progress'
            && $this->data_baru === 'Close'
            => 'Tiket Diselesaikan',

            $this->kategori_log === 'Status'
            && $this->data_lama === 'Close'
            && $this->data_baru === 'In Progress'
            => 'Tiket Dibuka Kembali',

            default => $this->kategori_log,
        };
    }

    public function getTimelineIconAttribute(): string
    {
        return match ($this->timeline_title) {
            'Tiket Dibuat' => 'heroicon-o-plus-circle',
            'Pengerjaan Dimulai' => 'heroicon-o-wrench-screwdriver',
            'Tiket Diselesaikan' => 'heroicon-o-check-circle',
            'Tiket Dibuka Kembali' => 'heroicon-o-arrow-path',
            default => 'heroicon-o-clock',
        };
    }

}
