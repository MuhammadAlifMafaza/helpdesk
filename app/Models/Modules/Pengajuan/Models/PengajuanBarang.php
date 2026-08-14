<?php

namespace App\Models\Modules\Pengajuan\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\User;
use App\Models\Modules\Pengajuan\Models\LogPengajuan;

class PengajuanBarang extends Model
{
    use softDeletes;
    /*
    |--------------------------------------------------------------------------
    | Model Configuration
    |--------------------------------------------------------------------------
    */
    protected $table = 'pengajuan_barang';

    protected $fillable = [
        'user_id',
        'nama_barang',
        'jumlah',
        'alasan',
        'status',
    ];

    protected $appends = [
        'kode_pengajuan',
        'status_outcome',
        'waktu_mulai',
        'waktu_selesai',
        'durasi_pengerjaan',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Log Configuration
    |--------------------------------------------------------------------------
    */
    public function logs()
    {
        return $this->hasMany(
            LogPengajuan::class,
            'pengajuan_id'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Ticket Identity (Kodes Tiket) Generation
    |--------------------------------------------------------------------------
    */
    public function getKodePengajuanAttribute(): string
    {
        $firstIdToday = self::query()
            ->whereDate(
                'created_at',
                $this->created_at->toDateString()
            )
            ->min('id');

        $nomorUrut = ($this->id - $firstIdToday) + 1;

        return sprintf(
            'PJB-%s-%04d',
            $this->created_at->format('dmY'),
            $nomorUrut
        );
    }

    protected static function booted()
    {
        static::created(function ($pengajuan) {

            LogPengajuan::create([
                'pengajuan_id' => $pengajuan->id,
                'user_id' => auth()->id() ?? $pengajuan->user_id,
                'kategori_log' => 'Status',
                'data_lama' => null,
                'data_baru' => 'Open',
                'keterangan' => 'Pengajuan Barang telah dibuat',
            ]);

        });

        static::deleting(function ($pengajuan) {

            if ($pengajuan->isForceDeleting()) {
                return;
            }

            $pengajuan->tambahLog(
                'Delete Data',
                null,
                null,
                'Pengajuan barang telah dihapus (soft Delete)'
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

    public function tambahLog(
        string $kategori,
        ?string $lama,
        ?string $baru,
        ?string $keterangan
    ) {
        return LogPengajuan::create([
            'pengajuan_id' => $this->id,
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
            ($catatan ?? 'Pengajuan dibuka kembali')
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

    //
    public function timeline()
    {
        return $this->logs()
            ->with('user')
            ->orderBy('created_at');
    }


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
