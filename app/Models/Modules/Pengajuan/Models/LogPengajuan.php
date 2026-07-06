<?php

namespace App\Models\Modules\Pengajuan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use App\Models\User;

class LogPengajuan extends Model
{
    protected $table = 'log_data_pengajuan_barang';

    const STATUS = 'Status';
    const CHAT = 'Chat';
    const UPDATE_DATA = 'Update Data';
    const PRIORITAS = 'Prioritas';
    public const EVENT_CREATE = 'CREATE';
    public const EVENT_PROCESS = 'PROCESS';
    public const EVENT_APPROVE = 'APPROVE';
    public const EVENT_REJECT = 'REJECT';
    public const EVENT_REOPEN = 'REOPEN';
    public const EVENT_PENDING = 'PENDING';
    public const EVENT_CHAT = 'CHAT';
    public const EVENT_UPDATE = 'UPDATE';
    public const EVENT_DELETE = 'DELETE';
    public const EVENT_STATUS = 'STATUS';
    public const EVENT_SYSTEM = 'SYSTEM';

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

    /**
     * Summary of isStatusActivity
     * @return bool
     */
    public function isStatusActivity(): bool
    {
        return in_array(
            $this->event_type,
            [
                self::EVENT_CREATE,
                self::EVENT_PROCESS,
                self::EVENT_APPROVE,
                self::EVENT_REJECT,
                self::EVENT_REOPEN,
                self::EVENT_PENDING,
            ]
        );
    }

    public function isChatActivity(): bool
    {
        return $this->event_type === self::EVENT_CHAT;
    }

    public function isUpdateActivity(): bool
    {
        return $this->event_type === self::EVENT_UPDATE;
    }

    public function isDeleteActivity(): bool
    {
        return $this->event_type === self::EVENT_DELETE;
    }


    /**
     * Global Search Timeline Pengajuan Barang
     */
    public function scopeSearchTimeline(
        Builder $query,
        string $search
    ): Builder {

        return $query->where(function (Builder $query) use ($search) {

            /*
            |--------------------------------------------------------------------------
            | Data Log
            |--------------------------------------------------------------------------
            */

            $query
                ->where('kategori_log', 'like', "%{$search}%")
                ->orWhere('keterangan', 'like', "%{$search}%")
                ->orWhere('data_lama', 'like', "%{$search}%")
                ->orWhere('data_baru', 'like', "%{$search}%");

            /*
            |--------------------------------------------------------------------------
            | Admin (User Log)
            |--------------------------------------------------------------------------
            */

            $query->orWhereHas('user', function (Builder $q) use ($search) {
                $q
                    ->where('name', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%");
            });

            /*
            |--------------------------------------------------------------------------
            | Data Pengajuan
            |--------------------------------------------------------------------------
            */

            $query->orWhereHas('pengajuan', function (Builder $q) use ($search) {
                $q
                    ->where('nama_barang', 'like', "%{$search}%")
                    ->orWhere('jumlah', 'like', "%{$search}%")
                    ->orWhere('alasan', 'like', "%{$search}%")
                    ->orWhere('status', 'like', "%{$search}%");
            });

            /*
            |--------------------------------------------------------------------------
            | Pemohon
            |--------------------------------------------------------------------------
            */

            $query->orWhereHas('pengajuan.user', function (Builder $q) use ($search) {
                $q
                    ->where('name', 'like', "%{$search}%")
                    ->orWhere('email', 'like', "%{$search}%");
            });


            $query->orWhere(function ($q) use ($search) {

                foreach (self::searchableEvents() as $event) {

                    if (
                        str_contains(
                            strtolower($event['name']),
                            strtolower($search)
                        )
                    ) {

                        $q->orWhere(function ($qq) use ($event) {

                            $event['query']($qq);

                        });

                    }

                }

            });

        });

    }

    public function getEventTypeAttribute(): string
    {
        return match ($this->kategori_log) {

            'Status' => match (true) {

                    blank($this->data_lama)
                    && $this->data_baru === 'Open'
                    => self::EVENT_CREATE,


                    $this->data_lama === 'Open'
                    && $this->data_baru === 'In Progress'
                    => self::EVENT_PROCESS,

                    $this->data_lama === 'In Progress'
                    && $this->data_baru === 'Close'
                    && str_contains($this->keterangan, '[SELESAI]')
                    => self::EVENT_APPROVE,

                    $this->data_lama === 'In Progress'
                    && $this->data_baru === 'Close'
                    && str_contains($this->keterangan, '[DITOLAK]')
                    => self::EVENT_REJECT,

                    $this->data_lama === 'Close'
                    && $this->data_baru === 'In Progress'
                    => self::EVENT_REOPEN,

                    default
                    => self::EVENT_STATUS,
                },

            'Pending'
            => self::EVENT_PENDING,

            'Chat'
            => self::EVENT_CHAT,

            'Update Data'
            => self::EVENT_UPDATE,

            'Delete Data'
            => self::EVENT_DELETE,

            default
            => self::EVENT_SYSTEM,
        };
    }

    public function getEventNameAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_CREATE
            => 'Pengajuan Dibuat',

            self::EVENT_PROCESS
            => 'Pengajuan Diproses',

            self::EVENT_APPROVE
            => 'Pengajuan Disetujui',

            self::EVENT_REJECT
            => 'Pengajuan Ditolak',

            self::EVENT_REOPEN
            => 'Pengajuan Dibuka Kembali',

            self::EVENT_PENDING
            => 'Pending',

            self::EVENT_CHAT
            => 'Pesan Baru',

            self::EVENT_UPDATE
            => 'Perubahan Data',

            self::EVENT_DELETE
            => 'Hapus Data',

            default
            => 'Aktivitas',
        };
    }

    public function getEventDescriptionAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_UPDATE
            => "{$this->data_lama} → {$this->data_baru}",

            self::EVENT_DELETE
            => "Pengajuan dihapus oleh {$this->user?->name}",

            default
            => $this->keterangan,
        };
    }

    public function getSummaryAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_CREATE
            => "Pengajuan {$this->pengajuan?->kode_pengajuan} dibuat.",

            self::EVENT_PROCESS
            => "Pengajuan {$this->pengajuan?->kode_pengajuan} sedang diproses.",

            self::EVENT_APPROVE
            => "Pengajuan telah disetujui.",

            self::EVENT_REJECT
            => "Pengajuan ditolak.",

            self::EVENT_PENDING
            => "Pengajuan ditunda.",

            self::EVENT_CHAT
            => $this->keterangan,

            self::EVENT_UPDATE
            => "Data pengajuan diperbarui.",

            self::EVENT_DELETE
            => "Pengajuan dihapus.",

            default
            => $this->keterangan,
        };
    }

    public function getEventIconAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_CREATE
            => 'heroicon-o-plus-circle',

            self::EVENT_PROCESS
            => 'heroicon-o-check-circle',

            self::EVENT_PENDING
            => 'heroicon-o-pause-circle',

            self::EVENT_CHAT
            => 'heroicon-o-chat-bubble-left-right',

            self::EVENT_UPDATE
            => 'heroicon-o-pencil-square',

            self::EVENT_APPROVE
            => 'heroicon-o-check-badge',

            self::EVENT_REJECT
            => 'heroicon-o-x-circle',

            self::EVENT_REOPEN
            => 'heroicon-o-arrow-path',

            self::EVENT_DELETE
            => 'heroicon-o-trash',

            default
            => 'heroicon-o-clock',
        };
    }

    public function getEventColorAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_CREATE
            => 'info',

            self::EVENT_PROCESS
            => 'process',

            self::EVENT_PENDING
            => 'pending',

            self::EVENT_CHAT
            => 'chat',

            self::EVENT_UPDATE
            => 'gray',

            self::EVENT_APPROVE
            => 'success',

            self::EVENT_REJECT
            => 'danger',

            self::EVENT_REOPEN
            => 'reopen',

            self::EVENT_DELETE
            => 'danger',

            default
            => 'gray',
        };
    }

    public function getHumanActivityAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_CREATE
            => "{$this->user?->name} membuat pengajuan barang.",

            self::EVENT_PROCESS
            => "{$this->user?->name} mulai memproses pengajuan.",

            self::EVENT_APPROVE
            => "{$this->user?->name} menyetujui pengajuan.",

            self::EVENT_PENDING
            => "{$this->user?->name} menunda proses pengajuan.",

            self::EVENT_CHAT
            => "{$this->user?->name} mengirim pesan.",

            self::EVENT_UPDATE
            => "{$this->user?->name} memperbarui data pengajuan.",

            self::EVENT_REJECT
            => "{$this->user?->name} menolak pengajuan.",

            self::EVENT_REOPEN
            => "{$this->user?->name} membuka kembali pengajuan.",

            self::EVENT_DELETE
            => "{$this->user?->name} menghapus pengajuan.",

            default
            => "{$this->user?->name} melakukan aktivitas.",
        };
    }

    public function getSeverityAttribute(): string
    {
        return match ($this->event_type) {

            self::EVENT_DELETE,
            self::EVENT_REJECT
            => 'high',

            self::EVENT_PENDING,
            self::EVENT_REOPEN
            => 'medium',

            default
            => 'normal',
        };
    }

    public function getPriorityAttribute(): int
    {
        return match ($this->event_type) {

            self::EVENT_DELETE => 100,

            self::EVENT_REJECT => 90,

            self::EVENT_APPROVE => 80,

            self::EVENT_REOPEN => 70,

            self::EVENT_PROCESS => 60,

            self::EVENT_CREATE => 50,

            self::EVENT_UPDATE => 40,

            self::EVENT_CHAT => 30,

            self::EVENT_PENDING => 20,

            default => 10,
        };
    }

    public function getCurrentStageAttribute(): string
    {
        return match ($this->pengajuan->status) {

            'Open'
            => 'Menunggu Persetujuan',

            'In Progress'
            => 'Sedang Diproses',

            'Close'
            => match ($this->pengajuan->status_outcome) {

                    'Completed'
                    => 'Disetujui',

                    'Rejected'
                    => 'Ditolak',

                    default
                    => 'Selesai',
                },

            default
            => '-',
        };
    }


}
