<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;

class TiketPerbaikan extends Model
{
    protected $table = 'tiket_perbaikan';
    protected $appends = ['kode_tiket'];
    protected array $allowedUpdateFields = [
        'keluhan',
        'deskripsi',
        'kepemilikan',
        'ruangan_id',
    ];
    protected $fillable = [
        'user_id',
        'ruangan_id',
        'keluhan',
        'kepemilikan',
        'deskripsi',
        'status',
    ];

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

    public function getKodeTiketAttribute(): string
    {
        $firstIdToday = self::whereDate(
            'created_at',
            $this->created_at->toDateString()
        )->min('id');

        $nomorUrut = ($this->id - $firstIdToday) + 1;

        return sprintf(
            'TK-%s-%04d',
            $this->created_at->format('dmY'),
            $nomorUrut
        );

    }
    protected static function booted()
    {
        static::created(function ($tiket) {

            LogPerbaikan::create([
                'tiket_id' => $tiket->id,
                'user_id' => auth()->id() ?? $tiket->user_id,
                'kategori_log' => 'Status',
                'data_lama' => null,
                'data_baru' => 'Open',
                'keterangan' => 'Tiket dibuat',
            ]);

        });
    }

    /**
     * Ringkasan Data LogsPerbaikan
     * @return \Illuminate\Database\Eloquent\Relations\HasMany<LogPerbaikan, TiketPerbaikan>
     */
    public function logs()
    {
        return $this->hasMany(
            LogPerbaikan::class,
            'tiket_id'
        );
    }

    public function tambahLog(
        string $kategori,
        ?string $lama,
        ?string $baru,
        ?string $keterangan
    ) {
        return LogPerbaikan::create([
            'tiket_id' => $this->id,
            'user_id' => auth()->id() ?? $this->user_id,
            'kategori_log' => $kategori,
            'data_lama' => $lama,
            'data_baru' => $baru,
            'keterangan' => $keterangan,
            'created_at' => now(),
        ]);
    }

    public function updateStatus(
        string $statusBaru,
        ?string $catatan = null
    ) {
        $statusLama = $this->status;

        $this->update([
            'status' => $statusBaru
        ]);

        $this->tambahLog(
            'Status',
            $statusLama,
            $statusBaru,
            $catatan
        );
    }

    public function isLocked(): bool
    {
        return $this->status === 'Close';
    }

    public function reopen(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'In Progress',
            '[REOPEN] ' .
            ($catatan ?? 'Tiket dibuka kembali')
        );
    }

    public function closeAsCompleted(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'Close',
            '[SELESAI] ' . ($catatan ?? '')
        );
    }

    public function closeAsRejected(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'Close',
            '[DITOLAK] ' . ($catatan ?? '')
        );
    }

    /* Chats Logs Data */
    // Kirim Pesan
    public function sendMessage(
        string $pesan
    ) {
        return $this->tambahLog(
            'Chat',
            null,
            null,
            $pesan
        );
    }

    public function chatLogs()
    {
        return $this->logs()
            ->where(
                'kategori_log',
                'Chat'
            );
    }

    public function updateField(
        string $field,
        mixed $valueBaru
    ) {
        if (
            !in_array(
                $field,
                [
                    'keluhan',
                    'deskripsi',
                    'kepemilikan',
                    'ruangan_id',
                ]
            )
        ) {
            throw new \Exception(
                'Field tidak boleh diubah.'
            );
        }

        $valueLama = $this->$field;

        $this->update([
            $field => $valueBaru,
        ]);

        $this->tambahLog(
            'Update Data',
            (string) $valueLama,
            (string) $valueBaru,
            "{$field} diperbarui"
        );
    }

    // Timeline
    public function timeline()
    {
        return $this->logs()
            ->with('user')
            ->latest('created_at');
    }

    /* HELPER Filament Button */
    public function isOpen(): bool
    {
        return $this->status === 'Open';
    }

    public function isInProgress(): bool
    {
        return $this->status === 'In Progress';
    }

    public function isClosed(): bool
    {
        return $this->status === 'Close';
    }

    /* HELPER Outcome */
    public function getStatusOutcomeAttribute()
    {
        $log = $this->logs()
            ->where('kategori_log', 'Status')
            ->latest()
            ->first();

        if (!$log) {
            return null;
        }

        if (
            str_contains(
                $log->keterangan,
                '[SELESAI]'
            )
        ) {
            return 'Completed';
        }

        if (
            str_contains(
                $log->keterangan,
                '[REOPEN]'
            )
        ) {
            return 'Reopen';
        }

        if (
            str_contains(
                $log->keterangan,
                '[DITOLAK]'
            )
        ) {
            return 'Rejected';
        }

        return null;
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
