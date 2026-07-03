<?php

namespace App\Models\Modules\Perbaikan\Models;

// use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use App\Models\User;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;


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
        )->withTrashed();
    }

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    public function scopeSearchTimeline(
        Builder $query,
        string $keyword
    ) {
        return $query->where(function ($q) use ($keyword) {

            $q->orWhere('kategori_log', 'like', "%{$keyword}%")
                ->orWhere('keterangan', 'like', "%{$keyword}%")
                ->orWhere('data_lama', 'like', "%{$keyword}%")
                ->orWhere('data_baru', 'like', "%{$keyword}%")

                ->orWhereHas('user', function ($u) use ($keyword) {

                    $u->where('name', 'like', "%{$keyword}%");

                })

                ->orWhereHas('tiket', function ($t) use ($keyword) {

                    $t->where('keluhan', 'like', "%{$keyword}%")
                        ->orWhere('deskripsi', 'like', "%{$keyword}%");

                });

        });

    }

    /**
     * Summary of HELPER for Timeline Perbaikan
     * @return string
     */
    public function getEventNameAttribute(): string
    {
        return match ($this->event_type) {

            'CREATE'
            => 'Tiket Dibuat',

            'ASSIGN'
            => 'Tiket Diambil',

            'PENDING'
            => 'Pending',

            'CHAT'
            => 'Pesan Baru',

            'UPDATE'
            => 'Perubahan Data',

            'COMPLETE'
            => 'Tiket Selesai',

            'REJECT'
            => 'Tiket Ditolak',

            'REOPEN'
            => 'Tiket Dibuka Kembali',

            'DELETE'
            => 'Hapus Data',

            default
            => 'Aktivitas',
        };
    }

    public function getEventIconAttribute(): string
    {
        return match ($this->event_type) {

            'CREATE'
            => 'heroicon-o-plus-circle',

            'ASSIGN'
            => 'heroicon-o-wrench-screwdriver',

            'PENDING'
            => 'heroicon-o-pause-circle',

            'CHAT'
            => 'heroicon-o-chat-bubble-left-right',

            'UPDATE'
            => 'heroicon-o-pencil-square',

            'COMPLETE'
            => 'heroicon-o-check-badge',

            'REJECT'
            => 'heroicon-o-x-circle',

            'REOPEN'
            => 'heroicon-o-arrow-path',

            'DELETE'
            => 'heroicon-o-trash',

            default
            => 'heroicon-o-clock',
        };
    }

    public function getEventColorAttribute(): string
    {
        return match ($this->event_type) {

            'CREATE'
            => 'info',

            'ASSIGN'
            => 'warning',

            'PENDING'
            => 'pending',

            'CHAT'
            => 'primary',

            'UPDATE'
            => 'gray',

            'COMPLETE'
            => 'success',

            'REJECT'
            => 'danger',

            'REOPEN'
            => 'primary',

            'DELETE'
            => 'danger',

            default
            => 'gray',
        };
    }

    public function getEventDescriptionAttribute(): string
    {
        return match ($this->event_type) {

            'UPDATE'
            => "{$this->data_lama} → {$this->data_baru}",

            'DELETE'
            => "Tiket dihapus oleh {$this->user?->name}",

            default
            => $this->keterangan,
        };
    }
    public function getEventTypeAttribute(): string
    {
        return match ($this->kategori_log) {

            'Status' => match (true) {

                    blank($this->data_lama)
                    && $this->data_baru === 'Open'
                    => 'CREATE',

                    $this->data_lama === 'Open'
                    && $this->data_baru === 'In Progress'
                    => 'ASSIGN',

                    $this->data_lama === 'In Progress'
                    && $this->data_baru === 'Close'
                    && str_contains($this->keterangan, '[SELESAI]')
                    => 'COMPLETE',

                    $this->data_lama === 'In Progress'
                    && $this->data_baru === 'Close'
                    && str_contains($this->keterangan, '[DITOLAK]')
                    => 'REJECT',

                    $this->data_lama === 'Close'
                    && $this->data_baru === 'In Progress'
                    => 'REOPEN',

                    default
                    => 'STATUS',
                },

            'Pending'
            => 'PENDING',

            'Chat'
            => 'CHAT',

            'Update Data'
            => 'UPDATE',

            'Delete Data'
            => 'DELETE',

            default
            => 'SYSTEM',
        };
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
