<?php

namespace App\Models\Modules\Pengajuan\Models;

use App\Models\User;
use App\Services\HelpdeskNotificationService;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class PengajuanBarang extends Model
{
    use SoftDeletes;

    /*
    |--------------------------------------------------------------------------
    | Model Configuration
    |--------------------------------------------------------------------------
    */
    protected $table = 'pengajuan_barang';

    protected $appends = [
        'kode_pengajuan',
        'status_outcome',
        'waktu_mulai',
        'waktu_selesai',
        'durasi_pengerjaan',
    ];

    /*
    |--------------------------------------------------------------------------
    | Model Fillable Fields
    |--------------------------------------------------------------------------
    */
    public const ALLOWED_UPDATE_FIELDS = [
        'nama_barang' => 'Nama Barang',
        'jumlah' => 'Jumlah',
        'alasan' => 'Alasan',
    ];

    protected $fillable = [
        'user_id',
        'nama_barang',
        'jumlah',
        'alasan',
        'status',
    ];

    /*
    |--------------------------------------------------------------------------
    | Relationships
    |--------------------------------------------------------------------------
    */
    public function user(): BelongsTo
    {
        return $this->belongsTo(
            User::class,
            'user_id'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Ticket Identity (Kodes pengajuan) Generation
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

    public function notifyNewPengajuan(): void
    {
        // Implementation for notifying about new pengajuan
        HelpdeskNotificationService::sendNotification(
            recipient: $this->user,
            type: 'pengajuan_baru',
            title: 'Pengajuan Barang Baru Telah Dibuat',
            message: "Pengajuan dengan kode {$this->kode_pengajuan} telah dibuat oleh {$this->user->name}.",
            kode: $this->kode_pengajuan,
            url: $this->getNotificationUrl(),
            referenceId: $this->id,
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Model Lifecycle
    |--------------------------------------------------------------------------
    */
    protected static function booted(): void
    {
        static::created(function (self $pengajuan): void {

            $pengajuan->tambahLog(
                kategori: 'Status',
                lama: null,
                baru: 'Open',
                keterangan: 'Pengajuan dibuat'
            );

            $pengajuan->notifyNewPengajuan();
        });

        static::deleting(function (self $pengajuan): void {

            if ($pengajuan->isForceDeleting()) {
                return;
            }

            $namaUser = auth()->user()?->name ?? 'System';

            $pengajuan->tambahLog(
                kategori: 'Delete Data',
                lama: $pengajuan->status,
                baru: 'Deleted',
                keterangan: "Pengajuan barang telah dihapus oleh {$namaUser}"
            );

        });
    }

    /*
    |--------------------------------------------------------------------------
    | Permission / Access Control
    |--------------------------------------------------------------------------
    */
    public function canBeAccessedBy(?User $user = null): bool
    {
        $user ??= auth()->user();

        if (! $user) {
            return false;
        }

        /*
         * Staff Helpdesk
         */
        if (
            $user->hasAnyRole([
                'admin',
                'teknisi',
                'admin_super',
                'super_admin',
            ])
        ) {
            return true;
        }

        /*
         * Pemohon hanya dapat mengakses pengajuan barang miliknya.
         */
        if ($user->hasRole('pemohon')) {
            return (int) $this->user_id === (int) $user->id;
        }

        return false;
    }

    public function canStaffEdit(): bool
    {
        if (
            auth()->user()->hasRole('admin')
            || auth()->user()->hasRole('super_admin')
        ) {
            return true;
        }

        return ! $this->isClosed();
    }

    public function canPemohonEdit(): bool
    {
        $user = auth()->user();

        if (! $user) {
            return false;
        }

        if (! $user->hasRole('pemohon')) {
            return false;
        }

        /* Pemohon hanya boleh mengubah pengajuan barang miliknya sendiri */

        if ((int) $this->user_id !== (int) $user->id) {
            return false;
        }

        /* Hanya pengajuan barang dengan status Open yang dapat diedit */

        return $this->isOpen();
    }

    /**
     * Apakah pengajuan barang dapat dibatalkan oleh Pemohon?
     */
    public function canPemohonDelete(): bool
    {
        $user = auth()->user();

        if (! $user) {
            return false;
        }

        if (! $user->hasRole('pemohon')) {
            return false;
        }

        /* Hanya pemilik pengajuan barang */
        if ((int) $this->user_id !== (int) $user->id) {
            return false;
        }

        /* Pengajuan barang hanya dapat dibatalkan apabila status pengajuan barang masih Open */
        return $this->isOpen();
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
    | Audit Logs
    |--------------------------------------------------------------------------
    */
    public function tambahLog(
        string $kategori,
        ?string $lama = null,
        ?string $baru = null,
        ?string $keterangan = null
    ): LogPengajuan {

        return $this->logs()->create([
            'user_id' => auth()->id() ?? $this->user_id,
            'kategori_log' => $kategori,
            'data_lama' => $lama,
            'data_baru' => $baru,
            'keterangan' => $keterangan,
            'created_at' => now(),
        ]);
    }

    /*
    |--------------------------------------------------------------------------
    | Status Management
    |--------------------------------------------------------------------------
    */
    public function isLocked(): bool
    {
        return $this->status === 'Close';
    }

    public function updateStatus(
        string $statusBaru,
        ?string $catatan = null
    ): bool {

        $statusLama = $this->status;

        if ($statusLama === $statusBaru) {
            return false;
        }

        $this->update([
            'status' => $statusBaru,
        ]);

        $this->tambahLog(
            kategori: 'Status',
            lama: $statusLama,
            baru: $statusBaru,
            keterangan: $catatan
        );

        return true;
    }

    public function reopen(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'In Progress',
            '[REOPEN] '.
            ($catatan ?? 'Pengajuan dibuka kembali')
        );
    }

    public function pending(string $catatan)
    {
        return $this->tambahLog(
            'Pending',
            null,
            null,
            "[PENDING] {$catatan}"
        );
    }

    public function closeAsCompleted(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'Close',
            '[SELESAI] '.($catatan ?? '')
        );
    }

    public function closeAsRejected(
        ?string $catatan = null
    ) {
        return $this->updateStatus(
            'Close',
            '[DITOLAK] '.($catatan ?? '')
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Chat
    |--------------------------------------------------------------------------
    */
    public function sendMessage(
        string $pesan
    ): LogPengajuan {

        return $this->tambahLog(
            kategori: 'Chat',
            lama: null,
            baru: null,
            keterangan: $pesan
        );

        $this->notifyChatRecipients($pesan);

        return $log;
    }

    public function chatLogs(): HasMany
    {
        return $this->logs()
            ->where('kategori_log', 'Chat');
    }

    protected function notifyChatRecipients(
        string $pesan
    ): void {

        $senderId = auth()->id();

        $recipients = User::query()
            ->whereKeyNot($senderId)
            ->where(function ($query) {
                $query
                    ->whereHas('roles', function ($q) {
                        $q->whereIn('name', [
                            'admin',
                            'teknisi',
                            'admin_super',
                            'super_admin',
                        ]);
                    })
                    ->orWhereKey($this->user_id);
            })
            ->get();

        foreach ($recipients as $recipient) {

            HelpdeskNotificationService::sendNotification(
                recipient: $recipient,
                type: 'pengajuan_chat',
                title: 'Pesan Baru',
                message: $pesan,
                kode: $this->kode_pengajuan,
                url: $this->getNotificationUrl(),
                referenceId: $this->id,
            );
        }
    }

    /*
    |--------------------------------------------------------------------------
    | Data Management
    |--------------------------------------------------------------------------
    */
    public function updateDataPemohon(array $data): bool
    {
        if (! $this->canPemohonEdit()) {
            return false;
        }

        $updated = false;

        foreach (self::ALLOWED_UPDATE_FIELDS as $field => $label) {

            if (! array_key_exists($field, $data)) {
                continue;
            }

            $updated = $this->updateField(
                field: $field,
                valueBaru: $data[$field]
            ) || $updated;
        }

        return $updated;
    }

    public function updateField(
        string $field,
        mixed $valueBaru,
        ?string $catatan = null
    ): bool {

        if (
            ! array_key_exists(
                $field,
                self::ALLOWED_UPDATE_FIELDS
            )
        ) {
            throw new \InvalidArgumentException(
                "Field {$field} tidak boleh diubah."
            );
        }

        $valueLama = $this->{$field};

        if ((string) $valueLama === (string) $valueBaru) {
            return false;
        }

        $this->update([
            $field => $valueBaru,
        ]);

        $namaField = self::ALLOWED_UPDATE_FIELDS[$field];

        $this->tambahLog(
            kategori: 'Update Data',
            lama: (string) $valueLama,
            baru: (string) $valueBaru,
            keterangan: $catatan
            ?? "{$namaField} diperbarui oleh pemohon"
        );

        return true;
    }

    public function cancelByPemohon(
        ?string $catatan = null
    ): bool {

        if (! $this->canPemohonDelete()) {
            return false;
        }

        $this->tambahLog(
            kategori: 'Delete Data',
            lama: $this->status,
            baru: 'Cancelled',
            keterangan: $catatan ?? 'Pengajuan barang dibatalkan oleh pemohon'
        );

        return $this->delete();
    }

    /*
    |--------------------------------------------------------------------------
    | Timeline
    |--------------------------------------------------------------------------
    */
    public function timeline(): HasMany
    {
        return $this->logs()
            ->with('user')
            ->latest('created_at');
    }

    /*
    |--------------------------------------------------------------------------
    | Reporting / Time Attributes
    |--------------------------------------------------------------------------
    */
    public function getWaktuMulaiAttribute(): ?Carbon
    {
        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'In Progress')
            ->orderBy('created_at')
            ->value('created_at');
    }

    public function getWaktuSelesaiAttribute(): ?Carbon
    {
        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Close')
            ->latest('created_at')
            ->value('created_at');
    }

    public function getDurasiPengerjaanAttribute(): ?string
    {
        if (
            ! $this->waktu_mulai ||
            ! $this->waktu_selesai
        ) {
            return null;
        }

        return $this->waktu_mulai->diffForHumans(
            $this->waktu_selesai,
            true
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Status Helpers
    |--------------------------------------------------------------------------
    */
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
        return $this->status_outcome === 'Completed';
    }

    public function isRejected(): bool
    {
        return $this->status_outcome === 'Rejected';
    }

    /*
    |--------------------------------------------------------------------------
    | Outcome Helpers
    |--------------------------------------------------------------------------
    */
    public function getStatusOutcomeAttribute(): ?string
    {
        if (! $this->isClosed()) {
            return null;
        }

        $closeLog = $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Close')
            ->latest('created_at')
            ->first();

        if (! $closeLog) {
            return null;
        }

        if (
            str_contains(
                $closeLog->keterangan ?? '',
                '[SELESAI]'
            )
        ) {
            return 'Completed';
        }

        if (
            str_contains(
                $closeLog->keterangan ?? '',
                '[DITOLAK]'
            )
        ) {
            return 'Rejected';
        }

        return null;
    }

    /*
    |--------------------------------------------------------------------------
    | Statistics
    |--------------------------------------------------------------------------
    */

    /**
     * Total jumlah pengajuan barang.
     */
    public static function getTotalPengajuan(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)->count();
    }

    /**
     * Total pengajuan yang belum diproses.
     */
    public static function getTotalOpen(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where('status', 'Open')
            ->count();
    }

    /**
     * Total pengajuan yang sedang diproses.
     */
    public static function getTotalInProgress(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where('status', 'In Progress')
            ->count();
    }

    /**
     * Total pengajuan yang telah ditutup.
     */
    public static function getTotalClose(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where('status', 'Close')
            ->count();
    }

    /**
     * Jumlah pengajuan yang belum selesai.
     */
    public static function getTotalBelumSelesai(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->whereNull('waktu_selesai')
            ->count();
    }

    /**
     * Rata-rata durasi pengerjaan dalam jam.
     */
    public static function getAverageDuration(
        ?Builder $query = null
    ): float {
        $query ??= static::query();

        $minutes = (clone $query)
            ->whereNotNull('durasi_pengerjaan_menit')
            ->avg('durasi_pengerjaan_menit');

        if (! $minutes) {
            return 0;
        }

        return round($minutes / 60, 2);
    }

    /**
     * Rata-rata durasi pengerjaan human readable.
     */
    public static function getAverageDurationHuman(
        ?Builder $query = null
    ): string {
        $hours = static::getAverageDuration($query);

        if ($hours <= 0) {
            return '-';
        }

        $days = round($hours / 24, 2);

        return number_format($hours, 2)
            .' Jam'
            ." ({$days} Hari)";
    }

    /**
     * Deskripsi rata-rata durasi pengerjaan.
     */
    public static function getAverageDurationDescription(
        ?Builder $query = null
    ): string {
        $query ??= static::query();

        $minutes = (clone $query)
            ->whereNotNull('durasi_pengerjaan_menit')
            ->avg('durasi_pengerjaan_menit');

        if (! $minutes) {
            return '-';
        }

        $days = round($minutes / 1440, 2);

        return "≈ {$days} Hari";
    }
}
