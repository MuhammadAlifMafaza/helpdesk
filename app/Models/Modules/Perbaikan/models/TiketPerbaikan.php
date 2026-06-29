<?php

namespace App\Models\Modules\Perbaikan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\LogPerbaikan;

class TiketPerbaikan extends Model
{
    use SoftDeletes;
    protected $table = 'tiket_perbaikan';
    protected $appends = [
        'kode_tiket',
        'status_outcome',
        'waktu_mulai',
        'waktu_selesai',
        'durasi_pengerjaan',
    ];
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

    /**
     * Summary of getKodeTiketAttribute
     * @return string
     */
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

    /**
     * Summary of booted
     * @return void
     */
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

        static::deleting(function ($tiket) {

            if ($tiket->isForceDeleting()) {
                return;
            }

            $tiket->tambahLog(
                'Delete Data',
                null,
                null,
                'Tiket telah dihapus oleh'
                . auth()->user()->name
            );

        });
    }

    /**
     * Summary of canEdit
     * @return bool
     */
    public function canEdit(): bool
    {
        if (
            auth()->user()->hasRole('admin')
            || auth()->user()->hasRole('super_admin')
        ) {
            return true;
        }

        return !$this->isClosed();
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
        mixed $valueBaru,
        ?string $catatan = null
    ) {
        if (
            !in_array(
                $field,
                $this->allowedUpdateFields
            )
        ) {
            throw new \Exception(
                "Field {$field} tidak boleh diubah."
            );
        }

        $valueLama = $this->{$field};

        if (
            (string) $valueLama ===
            (string) $valueBaru
        ) {
            return false;
        }

        $this->update([
            $field => $valueBaru,
        ]);

        $this->tambahLog(
            'Update Data',
            (string) $valueLama,
            (string) $valueBaru,
            $catatan
            ?? "Field {$field} diperbarui"
        );

        return true;
    }

    /**
     * Summary of updateRuangan
     * @param int $ruanganIdBaru
     * @return void
     */
    public function updateRuangan(
        int $ruanganIdBaru
    ) {
        $lama = $this->ruangan?->nama_ruangan;

        $baru = MasterRuangan::find(
            $ruanganIdBaru
        )?->nama_ruangan;

        $this->update([
            'ruangan_id' => $ruanganIdBaru,
        ]);

        $this->tambahLog(
            'Update Data',
            $lama,
            $baru,
            'Ruangan dipindahkan'
        );
    }

    // Timeline
    public function timeline()
    {
        return $this->logs()
            ->with('user')
            ->latest('created_at');
    }

    /* Summary of getWaktuMulaiAttribute */
    public function getWaktuMulaiAttribute()
    {
        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'In Progress')
            ->orderBy('created_at')
            ->value('created_at');
    }

    /* Summary of getDurasiPengerjaanAttribute */
    public function getDurasiPengerjaanAttribute()
    {
        if (
            !$this->waktu_mulai ||
            !$this->waktu_selesai
        ) {
            return null;
        }

        return $this->waktu_mulai
            ->diffForHumans(
                $this->waktu_selesai,
                true
            );
    }

    /* Summary of getWaktuSelesaiAttribute */
    public function getWaktuSelesaiAttribute()
    {
        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Close')
            ->latest()
            ->value('created_at');
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

    public function isCompleted(): bool
    {
        return $this->outcome === 'Completed';
    }

    public function isRejected(): bool
    {
        return $this->outcome === 'Rejected';
    }

    /* HELPER Outcome */
    public function getStatusOutcomeAttribute()
    {
        if ($this->status !== 'Close') {
            return null;
        }

        $closeLog = $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Close')
            ->latest()
            ->first();

        if (!$closeLog) {
            return null;
        }

        if (str_contains($closeLog->keterangan, '[SELESAI]')) {
            return 'Completed';
        }

        if (str_contains($closeLog->keterangan, '[DITOLAK]')) {
            return 'Rejected';
        }

        return null;
    }


}