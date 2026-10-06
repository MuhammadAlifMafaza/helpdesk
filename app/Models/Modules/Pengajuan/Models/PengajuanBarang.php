<?php

namespace App\Models\Modules\Pengajuan\Models;

use App\Events\HelpdeskActivityCreated;
use App\Models\Modules\Master\Barang\Models\MasterBarang;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Support\Facades\DB;
use Illuminate\Validation\ValidationException;

class PengajuanBarang extends Model
{
    use SoftDeletes;

    /*
    |--------------------------------------------------------------------------
    | Model Configuration
    |--------------------------------------------------------------------------
    */

    protected bool $cancelledByPemohon = false;

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
        'barang_id' => 'Barang',
        'spesifikasi_barang' => 'Spesifikasi Barang',
        'jumlah' => 'Jumlah',
        'alasan' => 'Alasan',
    ];

    protected $fillable = [
        'user_id',
        'barang_id',
        'nama_barang',
        'spesifikasi_barang',
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

    public function barang(): BelongsTo
    {
        return $this->belongsTo(
            MasterBarang::class,
            'barang_id'
        )->withTrashed();
    }

    /*
    |--------------------------------------------------------------------------
    | Ticket Identity
    |--------------------------------------------------------------------------
    */

    public function getKodePengajuanAttribute(): string
    {
        $firstIdToday = self::withTrashed()
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

    /*
    |--------------------------------------------------------------------------
    | Model Lifecycle
    |--------------------------------------------------------------------------
    */

    protected static function booted(): void
    {
        /*
         * CREATE
         */
        static::creating(function (self $pengajuan): void {

            if (blank($pengajuan->user_id)) {
                $pengajuan->user_id = auth()->id();
            }

            if (blank($pengajuan->status)) {
                $pengajuan->status = 'Open';
            }

            $pengajuan->validateAndSyncBarang();
        });

        /*
         * UPDATE
         */
        static::updating(function (self $pengajuan): void {

            if ($pengajuan->isDirty('barang_id')) {
                $pengajuan->validateAndSyncBarang();
            }
        });

        /*
         * CREATED
         */
        static::created(function (self $pengajuan): void {

            $pengajuan->tambahLog(
                kategori: 'Status',
                lama: null,
                baru: 'Open',
                keterangan: 'Pengajuan dibuat'
            );

            HelpdeskActivityCreated::dispatch(
                module: 'pengajuan',
                activity: 'created',
                referenceId: $pengajuan->id,
                kode: $pengajuan->kode_pengajuan,
                actorId: $pengajuan->user_id,
                data: [
                    'message' => "Pengajuan {$pengajuan->kode_pengajuan} baru telah dibuat.",
                    'user_id' => $pengajuan->user_id,
                    'user_name' => $pengajuan->user?->name,
                    'nama_barang' => $pengajuan->nama_barang,
                    'jumlah' => $pengajuan->jumlah,
                ],
            );
        });

        static::deleting(function (self $pengajuan): void {

            /*
             * Physical (permanent) delete: tidak membuat audit log.
             */
            if ($pengajuan->isForceDeleting()) {
                return;
            }

            /*
             * Delete / Cancel Pemohon: audit sudah dibuat oleh cancelByPemohon().
             */
            if ($pengajuan->cancelledByPemohon) {
                return;
            }

            $namaUser =
                auth()->user()?->name
                ?? 'System';

            $pengajuan->tambahLog(
                kategori: 'Delete Data',
                lama: $pengajuan->status,
                baru: 'Deleted',
                keterangan:
                "Pengajuan barang telah dihapus oleh {$namaUser}"
            );
        });
    }

    /*
    |--------------------------------------------------------------------------
    | Master Barang Validation
    |--------------------------------------------------------------------------
    */

    protected function validateAndSyncBarang(): void
    {
        if (!$this->barang_id) {
            throw ValidationException::withMessages([
                'barang_id' =>
                    'Barang wajib dipilih dari Master Barang.',
            ]);
        }

        $barang = MasterBarang::query()
            ->withTrashed()
            ->with('kategoriBarang')
            ->find($this->barang_id);

        if (!$barang) {
            throw ValidationException::withMessages([
                'barang_id' =>
                    'Master Barang yang dipilih tidak ditemukan.',
            ]);
        }

        if (!$barang->canBeUsedForNewTransaction()) {
            throw ValidationException::withMessages([
                'barang_id' =>
                    'Barang yang dipilih tidak aktif atau '
                    . 'kategorinya tidak aktif.',
            ]);
        }

        /*
         * Snapshot nama barang.
         */
        $this->nama_barang =
            $barang->nama_barang;
    }

    /*
    |--------------------------------------------------------------------------
    | Permission / Access Control
    |--------------------------------------------------------------------------
    */

    public function canBeAccessedBy(
        ?User $user = null
    ): bool {
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
         * Pemohon hanya dapat mengakses
         * pengajuan miliknya sendiri.
         */
        if ($user->hasRole('pemohon')) {
            return
                (int) $this->user_id ===
                (int) $user->id;
        }

        return false;
    }

    public function canStaffEdit(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            $user->hasAnyRole([
                'admin',
                'super_admin',
            ])
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

        if (
            (int) $this->user_id !==
            (int) $user->id
        ) {
            return false;
        }

        return $this->isOpen();
    }

    /*
    |--------------------------------------------------------------------------
    | Pemohon Cancellation Permission
    |--------------------------------------------------------------------------
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

        /*
         * Hanya pemilik pengajuan.
         */
        if (
            (int) $this->user_id !==
            (int) $user->id
        ) {
            return false;
        }

        /*
         * Record yang sudah soft deleted
         * tidak dapat dibatalkan kembali.
         */
        if ($this->trashed()) {
            return false;
        }

        /* Pemohon hanya dapat membatalkan pengajuan yang masih Open.
         */
        return $this->isOpen();
    }

    /*
    |--------------------------------------------------------------------------
    | Staff Action Permission
    |--------------------------------------------------------------------------
    */

    public function canStaffTake(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->isOpen();
    }

    public function canStaffComplete(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->isInProgress();
    }

    public function canStaffReject(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->isInProgress();
    }

    public function canStaffReopen(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->isClosed();
    }

    public function canStaffDelete(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->isClosed() && !$this->trashed();
    }

    public function canStaffRestore(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        if (
            !$user->hasAnyRole([
                'admin',
                'super_admin',
            ])
        ) {
            return false;
        }

        return $this->trashed();
    }

    public function canStaffForceDelete(): bool
    {
        $user = auth()->user();

        if (!$user) {
            return false;
        }

        return $user->hasRole('super_admin')
            && $this->trashed();
    }

    /*
    |--------------------------------------------------------------------------
    | Logs
    |--------------------------------------------------------------------------
    */

    public function logs(): HasMany
    {
        return $this->hasMany(
            LogPengajuan::class,
            'pengajuan_id'
        );
    }

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
        return $this->isClosed();
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

        $log = $this->tambahLog(
            kategori: 'Status',
            lama: $statusLama,
            baru: $statusBaru,
            keterangan: $catatan
        );

        HelpdeskActivityCreated::dispatch(
            module: 'pengajuan',
            activity: 'status',
            referenceId: $this->id,
            kode: $this->kode_pengajuan,
            actorId: auth()->id(),
            data: [
                'old_status' => $statusLama,
                'new_status' => $statusBaru,
                'message' =>
                    "Status {$this->kode_pengajuan} "
                    . "berubah dari {$statusLama} "
                    . "menjadi {$statusBaru}.",
                'log_id' => $log->id,
            ],
        );

        return true;
    }

    public function reopen(
        ?string $catatan = null
    ): bool {
        return $this->updateStatus(
            'In Progress',
            '[REOPEN] '
            . (
                $catatan ?? 'Pengajuan telah dibuka kembali oleh {$}'
            )
        );
    }

    public function pending(
        string $catatan
    ): LogPengajuan {
        return $this->tambahLog(
            'Pending',
            null,
            null,
            "[PENDING] {$catatan}"
        );
    }

    public function closeAsCompleted(
        ?string $catatan = null
    ): bool {
        return $this->updateStatus(
            'Close',
            '[SELESAI] '
            . ($catatan ?? '')
        );
    }

    public function closeAsRejected(
        ?string $catatan = null
    ): bool {
        return $this->updateStatus(
            'Close',
            '[DITOLAK] '
            . ($catatan ?? '')
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Pemohon Cancellation Lifecycle
    |--------------------------------------------------------------------------
    */

    public function cancelByPemohon(
        ?string $catatan = null
    ): bool {

        /*
         * Validasi hak akses dan status.
         */
        if (!$this->canPemohonDelete()) {
            return false;
        }

        $user = auth()->user();

        $namaUser =
            $user?->name
            ?? 'System';

        $keterangan = filled($catatan)
            ? trim($catatan)
            : "Pengajuan barang telah dibatalkan oleh {$namaUser}";

        return DB::transaction(
            function () use ($user, $namaUser, $keterangan): bool {

                /*
                 * Tandai bahwa delete ini berasal
                 * dari lifecycle Cancel Pemohon.
                 */
                $this->cancelledByPemohon = true;

                /*
                 * Audit Trail.
                 */
                $log = $this->tambahLog(
                    kategori: 'Status',
                    lama: $this->status,
                    baru: 'Cancelled',
                    keterangan: $keterangan
                );

                /*
                 * Activity Notification.
                 */
                HelpdeskActivityCreated::dispatch(
                    module: 'pengajuan',
                    activity: 'cancelled',
                    referenceId: $this->id,
                    kode: $this->kode_pengajuan,
                    actorId:
                    $user?->id
                    ?? $this->user_id,

                    data: [
                        'message' => "Pengajuan {$this->kode_pengajuan} dibatalkan oleh {$namaUser}.",
                        'user_id' => $this->user_id,
                        'user_name' => $user?->name,
                        'nama_barang' => $this->nama_barang,
                        'jumlah' => $this->jumlah,
                        'catatan' => $keterangan,
                        'log_id' => $log->id,
                    ],
                );

                return $this->delete();
            }
        );
    }

    /*
    |--------------------------------------------------------------------------
    | Cancellation State
    |--------------------------------------------------------------------------
    */

    public function isCancelled(): bool
    {
        if (!$this->trashed()) {
            return false;
        }

        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'Cancelled')
            ->exists();
    }

    /*
    |--------------------------------------------------------------------------
    | Chat
    |--------------------------------------------------------------------------
    */

    public function chatLogs(): HasMany
    {
        return $this->logs()
            ->where('kategori_log', 'Chat');
    }

    public function sendMessage(
        string $pesan
    ): LogPengajuan {

        $log = $this->tambahLog(
            kategori: 'Chat',
            lama: null,
            baru: null,
            keterangan: $pesan
        );

        HelpdeskActivityCreated::dispatch(
            module: 'pengajuan',
            activity: 'chat',
            referenceId: $this->id,
            kode: $this->kode_pengajuan,
            actorId: auth()->id(),
            data: [
                'message' => $pesan,
                'sender_id' => auth()->id(),
                'sender_name' => auth()->user()?->name,
                'log_id' => $log->id,
            ],
        );

        return $log;
    }

    /*
    |--------------------------------------------------------------------------
    | Data Management
    |--------------------------------------------------------------------------
    */

    public function updateDataPemohon(
        array $data
    ): bool {

        if (!$this->canPemohonEdit()) {
            return false;
        }

        $updated = false;

        foreach (
            self::ALLOWED_UPDATE_FIELDS
            as $field => $label
        ) {

            if (!array_key_exists($field, $data)) {
                continue;
            }

            $updated =
                $this->updateField(
                    field: $field,
                    valueBaru: $data[$field]
                )
                || $updated;
        }

        return $updated;
    }

    public function updateField(
        string $field,
        mixed $valueBaru,
        ?string $catatan = null
    ): bool {

        if (
            !array_key_exists(
                $field,
                self::ALLOWED_UPDATE_FIELDS
            )
        ) {
            throw new \InvalidArgumentException(
                "Field [{$field}] tidak dapat diperbarui."
            );
        }

        if ($field === 'barang_id') {
            return $this->updateBarang(
                barangId: (int) $valueBaru,
                catatan: $catatan
            );
        }

        $valueLama =
            $this->getAttribute($field);

        if (
            (string) $valueLama ===
            (string) $valueBaru
        ) {
            return false;
        }

        if (
            $field ===
            'spesifikasi_barang'
        ) {
            return $this->updateSpesifikasiBarang(
                spesifikasiBaru: $valueBaru,
                catatan: $catatan
            );
        }

        $this->update([
            $field => $valueBaru,
        ]);

        $log = $this->tambahLog(
            kategori: 'Update Data',
            lama: (string) ($valueLama ?? '-'),
            baru: (string) ($valueBaru ?? '-'),
            keterangan: $catatan
            ?? 'Data pengajuan diperbarui oleh '
            . (
                auth()->user()?->name
                ?? 'System'
            ),
        );

        HelpdeskActivityCreated::dispatch(
            module: 'pengajuan',
            activity: 'updated',
            referenceId: $this->id,
            kode: $this->kode_pengajuan,
            actorId: auth()->id(),
            data: [
                'field' => $field,
                'field_label' => self::ALLOWED_UPDATE_FIELDS[$field],
                'old_value' => $valueLama,
                'new_value' => $valueBaru,
                'message' => "Data pada {$this->kode_pengajuan} diperbarui.",
                'log_id' => $log->id,
            ],
        );

        return true;
    }

    /*
    |--------------------------------------------------------------------------
    | Update Barang
    |--------------------------------------------------------------------------
    */

    public function updateBarang(
        int $barangId,
        ?string $catatan = null
    ): bool {

        $barangLama = $this->barang;

        $namaLama =
            $this->nama_barang
            ?: $barangLama?->nama_barang
            ?: '-';

        if ((int) $this->barang_id === $barangId) {
            return false;
        }

        $barangBaru = MasterBarang::query()
            ->withTrashed()
            ->with('kategoriBarang')
            ->find($barangId);

        if (!$barangBaru) {
            throw ValidationException::withMessages([
                'barang_id' =>
                    'Master Barang yang dipilih '
                    . 'tidak ditemukan.',
            ]);
        }

        if (!$barangBaru->canBeUsedForNewTransaction()) {
            throw ValidationException::withMessages([
                'barang_id' =>
                    'Barang yang dipilih tidak aktif '
                    . 'atau kategorinya tidak aktif.',
            ]);
        }

        $this->update([
            'barang_id' => $barangId,
        ]);

        $namaBaru =
            $barangBaru->nama_barang;

        $log = $this->tambahLog(
            kategori: 'Update Data',
            lama: $namaLama,
            baru: $namaBaru,
            keterangan:
            $catatan
            ?? 'Barang pengajuan diperbarui oleh '
            . (
                auth()->user()?->name
                ?? 'System'
            ),
        );

        HelpdeskActivityCreated::dispatch(
            module: 'pengajuan',
            activity: 'updated',
            referenceId: $this->id,
            kode: $this->kode_pengajuan,
            actorId: auth()->id(),
            data: [
                'field' => 'barang_id',
                'field_label' => 'Barang',
                'old_value' => $namaLama,
                'new_value' => $namaBaru,
                'message' => "Barang pada {$this->kode_pengajuan} diperbarui.",
                'log_id' => $log->id,
            ],
        );

        return true;
    }

    /*
    |--------------------------------------------------------------------------
    | Update Spesifikasi Barang
    |--------------------------------------------------------------------------
    */

    public function updateSpesifikasiBarang(
        ?string $spesifikasiBaru,
        ?string $catatan = null
    ): bool {

        $spesifikasiLama = $this->spesifikasi_barang;

        $spesifikasiBaru =
            $spesifikasiBaru !== null
            ? trim($spesifikasiBaru)
            : null;

        if ($spesifikasiLama === $spesifikasiBaru) {
            return false;
        }

        $this->update([
            'spesifikasi_barang' => $spesifikasiBaru,
        ]);

        $log = $this->tambahLog(
            kategori: 'Update Data',
            lama: $spesifikasiLama ?: '-',
            baru: $spesifikasiBaru ?: '-',
            keterangan: $catatan ?? 'Spesifikasi barang diperbarui oleh '
            . (
                auth()->user()?->name
                ?? 'System'
            ),
        );

        $userName = auth()->user()?->name ?? 'System';

        HelpdeskActivityCreated::dispatch(
            module: 'pengajuan',
            activity: 'updated',
            referenceId: $this->id,
            kode: $this->kode_pengajuan,
            actorId: auth()->id(),
            data: [
                'field' => 'spesifikasi_barang',
                'field_label' => 'Spesifikasi Barang',
                'old_value' => $spesifikasiLama,
                'new_value' => $spesifikasiBaru,
                'message' =>
                    "Spesifikasi barang pada {$this->kode_pengajuan} "
                    . "telah diperbarui oleh {$userName}.",
                'log_id' => $log->id,
            ],
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
            ->where(
                'data_baru',
                'In Progress'
            )
            ->orderBy('created_at')
            ->value('created_at');
    }

    public function getWaktuSelesaiAttribute(): ?Carbon
    {
        return $this->logs()
            ->where('kategori_log', 'Status')
            ->where(
                'data_baru',
                'Close'
            )
            ->latest('created_at')
            ->value('created_at');
    }

    public function getDurasiPengerjaanAttribute(): ?string
    {
        if (
            !$this->waktu_mulai
            || !$this->waktu_selesai
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
            ->where(
                'kategori_log',
                'Status'
            )
            ->where(
                'data_baru',
                'Close'
            )
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

    public static function getTotalPengajuan(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)->count();
    }

    public static function getTotalOpen(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where('status', 'Open')
            ->count();
    }

    public static function getTotalInProgress(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where(
                'status',
                'In Progress'
            )
            ->count();
    }

    public static function getTotalClose(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->where('status', 'Close')
            ->count();
    }

    public static function getTotalBelumSelesai(
        ?Builder $query = null
    ): int {
        $query ??= static::query();

        return (clone $query)
            ->whereNull('waktu_selesai')
            ->count();
    }

    public static function getAverageDuration(
        ?Builder $query = null
    ): float {

        $minutes =
            static::getAverageDurationMinutes(
                $query
            );

        if ($minutes === null) {
            return 0;
        }

        return round(
            $minutes / 60,
            2
        );
    }

    public static function getAverageDurationHuman(
        ?Builder $query = null
    ): string {

        $hours =
            static::getAverageDuration(
                $query
            );

        if ($hours <= 0) {
            return '-';
        }

        $days =
            round(
                $hours / 24,
                2
            );

        return number_format(
            $hours,
            2
        )
            . ' Jam'
            . " ({$days} Hari)";
    }

    public static function getAverageDurationDescription(
        ?Builder $query = null
    ): string {

        $minutes =
            static::getAverageDurationMinutes(
                $query
            );

        if ($minutes === null) {
            return '-';
        }

        $days =
            round(
                $minutes / 1440,
                2
            );

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
                        ->where(
                            'kategori_log',
                            'Status'
                        )
                        ->orderBy(
                            'created_at'
                        );
                },
            ])
            ->get()
            ->map(
                function (self $pengajuan): ?float {

                    $waktuMulai =
                        $pengajuan
                            ->logs
                            ->firstWhere(
                                'data_baru',
                                'In Progress'
                            )
                                ?->created_at;

                    $waktuSelesai =
                        $pengajuan
                            ->logs
                            ->where(
                                'data_baru',
                                'Close'
                            )
                            ->last()
                                ?->created_at;

                    if (
                        !$waktuMulai
                        || !$waktuSelesai
                    ) {
                        return null;
                    }

                    return abs(
                        $waktuMulai
                            ->diffInMinutes(
                                $waktuSelesai
                            )
                    );
                }
            )
            ->filter();

        return $durations->isEmpty()
            ? null
            : (float) $durations->average();
    }
}
