<?php

namespace App\Models\Modules\Pengajuan\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class PengajuanBarang extends Model
{
    protected $table = 'pengajuan_barang';

    protected $fillable = [
        'user_id',
        'nama_barang',
        'jumlah',
        'alasan',
        'status',
    ];

    public function user()
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    /**
     * Ringkasan Data LogsPerbaikan
     * @return \Illuminate\Database\Eloquent\Relations\HasMany<LogPengajuan, PengajuanBarang>
     */
    public function logs()
    {
        return $this->hasMany(
            LogPengajuan::class,
            'pengajuan_id'
        );
    }

    public function getKodePengajuanAttribute(): string
    {
        $firstIdToday = self::whereDate(
            'created_at',
            $this->created_at->toDateString()
        )->min('id');

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

    /* HELPER Aplakasi Layering Status Outcome */
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
}
