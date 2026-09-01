<?php

namespace App\Models\Modules\Perbaikan\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;

// Imports necesery Files(Models)
use App\Models\User;
use App\Models\Modules\Master\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Enums\TicketStatus;
use App\Services\HelpdeskNotificationService;

class TiketPerbaikan extends Model
{
    use SoftDeletes;

    /*
    |--------------------------------------------------------------------------
    | Model Configuration
    |--------------------------------------------------------------------------
    */
    protected $table = 'tiket_perbaikan';

    protected $appends = [
        'kode_tiket',
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
    private const ALLOWED_UPDATE_FIELDS = [
        'kepemilikan',
        'ruangan_id',
        'deskripsi',
        'keluhan',
    ];

    protected $fillable = [
        'user_id',
        'ruangan_id',
        'keluhan',
        'kepemilikan',
        'deskripsi',
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

    public function ruangan(): BelongsTo
    {
        return $this->belongsTo(
            MasterRuangan::class,
            'ruangan_id'
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Ticket Identity (Kodes Tiket) Generation
    |--------------------------------------------------------------------------
    */
    public function getKodeTiketAttribute(): string
    {
        $firstIdToday = self::query()
            ->whereDate(
                'created_at',
                $this->created_at->toDateString()
            )
            ->min('id');

        $nomorUrut = ($this->id - $firstIdToday) + 1;

        return sprintf(
            'TK-%s-%04d',
            $this->created_at->format('dmY'),
            $nomorUrut
        );
    }

    public function notifyNewTiket(): void
    {
        // Implementation for notifying about new ticket
        HelpdeskNotificationService::sendNotification(
            recipient: $this->user,
            type: 'tiket_baru',
            title: 'Tiket Baru Dibuat',
            message: "Tiket dengan kode {$this->kode_tiket} telah dibuat oleh {$this->user->name} dari {$this->ruangan->nama}.",
            kode: $this->kode_tiket,
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
        static::created(function (self $tiket): void {

            $tiket->tambahLog(
                kategori: 'Status',
                lama: null,
                baru: 'Open',
                keterangan: 'Tiket dibuat'
            );

            $tiket->notifyNewTiket();

        });

        static::deleting(function (self $tiket): void {

            if ($tiket->isForceDeleting()) {
                return;
            }

            $namaUser = auth()->user()?->name ?? 'System';

            $tiket->tambahLog(
                kategori: 'Delete Data',
                lama: $tiket->status,
                baru: 'Deleted',
                keterangan: "Tiket telah dihapus oleh {$namaUser}"
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

        if (!$user) {
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
         * Pemohon hanya dapat mengakses tiket miliknya.
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

        return !$this->isClosed();
    }

    public function canPemohonEdit(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (!$user->hasRole('pemohon')) {
            return false;
        }

        /* Pemohon hanya boleh mengubah tiket miliknya sendiri */

        if ((int) $this->user_id !== (int) $user->id) {
            return false;
        }

        /* Hanya tiket dengan status Open yang dapat diedit */

        return $this->isOpen();
    }

    /**
     * Apakah tiket dapat dibatalkan oleh Pemohon?
     */
    public function canPemohonDelete(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (!$user->hasRole('pemohon')) {
            return false;
        }

        /* Hanya pemilik tiket */
        if ((int) $this->user_id !== (int) $user->id) {
            return false;
        }

        /* Tiket hanya dapat dibatalkan apabila status tiket masih Open */
        return $this->isOpen();
    }

    /*
    |--------------------------------------------------------------------------
    | Log Configuration
    |--------------------------------------------------------------------------
    */
    public function logs(): HasMany
    {
        return $this->hasMany(
            LogPerbaikan::class,
            'tiket_id'
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
    ): LogPerbaikan {

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
    public function scopeOpen(Builder $query): void
    {
        $query->where('status', TicketStatus::OPEN->value);
    }

    public function scopeProgress(Builder $query): void
    {
        $query->where('status', TicketStatus::IN_PROGRESS->value);
    }

    public function scopeClosed(Builder $query): void
    {
        $query->where('status', TicketStatus::CLOSE->value);
    }

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
            '[REOPEN] ' .
            ($catatan ?? 'Tiket dibuka kembali')
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

    /*
    |--------------------------------------------------------------------------
    | Chat
    |--------------------------------------------------------------------------
    */
    public function sendMessage(
        string $pesan
    ): LogPerbaikan {

        return $this->tambahLog(
            kategori: 'Chat',
            lama: null,
            baru: null,
            keterangan: $pesan
        );

        $this->notifyChatRecipients(
            $pesan
        );

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
                type: 'perbaikan_chat',
                title: 'Pesan Baru',
                message: $pesan,
                kode: $this->kode_tiket,
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
        if (!$this->canPemohonEdit()) {
            return false;
        }

        $updated = false;

        foreach (
            self::ALLOWED_UPDATE_FIELDS as $field
        ) {

            if (!array_key_exists($field, $data)) {
                continue;
            }

            $updated = $this->updateField(
                field: $field,
                valueBaru: $data[$field],
                catatan: 'Data diperbarui oleh pemohon'
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
            !in_array(
                $field,
                self::ALLOWED_UPDATE_FIELDS,
                true
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

        $this->tambahLog(
            kategori: 'Update Data',
            lama: (string) $valueLama,
            baru: (string) $valueBaru,
            keterangan: $catatan
            ?? "Field {$field} diperbarui"
        );

        return true;
    }

    public function cancelByPemohon(
        ?string $catatan = null
    ): bool {

        if (!$this->canPemohonDelete()) {
            return false;
        }

        $this->tambahLog(
            kategori: 'Delete Data',
            lama: $this->status,
            baru: 'Cancelled',
            keterangan: $catatan
            ?? 'Tiket dibatalkan oleh pemohon'
        );

        return $this->delete();
    }

    public function updateRuangan(
        int $ruanganIdBaru
    ): bool {

        $ruanganLama = $this->ruangan?->nama_ruangan;

        $ruanganBaru = MasterRuangan::find(
            $ruanganIdBaru
        );

        if (!$ruanganBaru) {
            throw new \InvalidArgumentException(
                'Ruangan tidak ditemukan.'
            );
        }

        $this->update([
            'ruangan_id' => $ruanganIdBaru,
        ]);

        $this->tambahLog(
            kategori: 'Update Data',
            lama: $ruanganLama,
            baru: $ruanganBaru->nama_ruangan,
            keterangan: 'Ruangan dipindahkan'
        );

        return true;
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
            !$this->waktu_mulai ||
            !$this->waktu_selesai
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
        if (!$this->isClosed()) {
            return null;
        }

        $closeLog = $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Close')
            ->latest('created_at')
            ->first();

        if (!$closeLog) {
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
     * Total jumlah tiket.
     */
    public static function getTotalTiket(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)->count();
    }

    /**
     * Total tiket yang belum dikerjakan.
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
     * Total tiket yang sedang dikerjakan.
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
     * Total tiket yang telah ditutup.
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
     * Jumlah tiket yang belum selesai.
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
        $minutes = static::getAverageDurationMinutes($query);

        if ($minutes === null) {
            return 0;
        }

        return round($minutes / 60, 2);
    }

    /**
     * Rata-rata durasi pengerjaan dalam format human readable.
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
            . ' Jam'
            . " ({$days} Hari)";
    }

    /**
     * Deskripsi rata-rata durasi pengerjaan.
     */
    public static function getAverageDurationDescription(
        ?Builder $query = null
    ): string {
        $minutes = static::getAverageDurationMinutes($query);

        if ($minutes === null) {
            return '-';
        }

        $days = round($minutes / 1440, 2);

        return "≈ {$days} Hari";
    }

    private static function getAverageDurationMinutes(
        ?Builder $query = null
    ): ?float {
        $query ??= static::query();

        $durations = (clone $query)
            ->with([
                'logs' => function (HasMany $query): void {
                    $query
                        ->where('kategori_log', 'Status')
                        ->orderBy('created_at');
                },
            ])
            ->get()
            ->map(function (self $tiket): ?float {
                $waktuMulai = $tiket->logs
                    ->firstWhere('data_baru', 'In Progress')
                        ?->created_at;
                $waktuSelesai = $tiket->logs
                    ->where('data_baru', 'Close')
                    ->last()
                        ?->created_at;

                if (!$waktuMulai || !$waktuSelesai) {
                    return null;
                }

                return abs($waktuMulai->diffInMinutes($waktuSelesai));
            })
            ->filter();

        return $durations->isEmpty()
            ? null
            : (float) $durations->average();
    }

    /**
     * Tiket yang pernah diambil / ditangani oleh teknisi tertentu.
     *
     * Identitas teknisi berasal dari log perubahan:
     * Open -> In Progress
     */
    public function scopeHandledByTechnician(
        Builder $query,
        int $userId
    ): Builder {
        return $query->whereHas('logs', function (Builder $logQuery) use ($userId) {
            $logQuery
                ->where('user_id', $userId)
                ->where('kategori_log', 'Status')
                ->where('data_lama', 'Open')
                ->where('data_baru', 'In Progress');
        });
    }

    /**
     * Tiket yang saat ini sedang berada pada penanganan teknisi.
     *
     * Assignment terakhir pada tiket harus dilakukan oleh teknisi tersebut.
     */
    public function scopeCurrentlyHandledByTechnician(
        Builder $query,
        int $userId
    ): Builder {
        return $query->whereExists(function ($subQuery) use ($userId) {
            $subQuery
                ->selectRaw('1')
                ->from('log_data_tiket_perbaikan as assignment_log')
                ->whereColumn(
                    'assignment_log.tiket_id',
                    'tiket_perbaikan.id'
                )
                ->where('assignment_log.user_id', $userId)
                ->where('assignment_log.kategori_log', 'Status')
                ->where('assignment_log.data_lama', 'Open')
                ->where('assignment_log.data_baru', 'In Progress')
                ->whereNotExists(function ($laterAssignment) {
                    $laterAssignment
                        ->selectRaw('1')
                        ->from(
                            'log_data_tiket_perbaikan as later_log'
                        )
                        ->whereColumn(
                            'later_log.tiket_id',
                            'assignment_log.tiket_id'
                        )
                        ->where(
                            'later_log.kategori_log',
                            'Status'
                        )
                        ->where(
                            'later_log.data_lama',
                            'Open'
                        )
                        ->where(
                            'later_log.data_baru',
                            'In Progress'
                        )
                        ->whereColumn(
                            'later_log.created_at',
                            '>',
                            'assignment_log.created_at'
                        );
                });
        });
    }
}
