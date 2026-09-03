<?php

namespace App\Services\Notifications;

use App\Models\User;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Collection;

class HelpdeskRecipientResolver
{
    /* ========================================================================
     * STAFF ROLES
     * ========================================================================
     */
    protected const STAFF_ROLES = [
        'admin',
        'teknisi',
        'super_admin',
    ];

    /* ========================================================================
     * RESOLVE RECIPIENTS
     * ========================================================================
     */
    public function resolve(
        string $module,
        int|string $referenceId,
        ?int $actorId = null,
        string $activity = 'created',
        array $data = [],
    ): Collection {
        $record = $this->resolveRecord(
            module: $module,
            referenceId: $referenceId,
        );

        if (!$record) {
            return collect();
        }

        return match ($activity) {
            'created' => $this->resolveCreatedRecipients(
                record: $record,
                actorId: $actorId,
            ),

            'status' => $this->resolveStatusRecipients(
                record: $record,
                actorId: $actorId,
            ),

            'updated' => $this->resolveUpdatedRecipients(
                record: $record,
                actorId: $actorId,
            ),

            'chat' => $this->resolveChatRecipients(
                record: $record,
                actorId: $actorId,
                data: $data,
            ),

            default => collect(),
        };
    }

    /* ========================================================================
     * RESOLVE RECORD
     * ========================================================================
     */
    protected function resolveRecord(
        string $module,
        int|string $referenceId,
    ): ?Model {
        return match ($module) {
            'perbaikan' => TiketPerbaikan::query()
                ->with('user')
                ->find($referenceId),

            'pengajuan' => PengajuanBarang::query()
                ->with('user')
                ->find($referenceId),

            default => null,
        };
    }

    /* ========================================================================
     * CREATED
     * ========================================================================
     */

    /**
     * Aktivitas tiket/pengajuan baru.
     *
     * Penerima:
     * - Pemohon / owner record
     * - Seluruh staff Helpdesk
     *
     * Actor tetap dikecualikan.
     */
    protected function resolveCreatedRecipients(
        Model $record,
        ?int $actorId,
    ): Collection {
        return $this->baseRecipients(
            record: $record,
            includeOwner: true,
            includeStaff: true,
            actorId: $actorId,
        );
    }

    /* ========================================================================
     * STATUS
     * ========================================================================
     */

    /**
     * Perubahan status.
     *
     * Penerima:
     * - Pemohon / owner record
     * - Seluruh staff Helpdesk
     *
     * Actor tetap dikecualikan.
     */
    protected function resolveStatusRecipients(
        Model $record,
        ?int $actorId,
    ): Collection {
        return $this->baseRecipients(
            record: $record,
            includeOwner: true,
            includeStaff: true,
            actorId: $actorId,
        );
    }

    /* ========================================================================
     * UPDATED
     * ========================================================================
     */

    /**
     * Perubahan data.
     *
     * Penerima:
     * - Pemohon / owner record
     * - Seluruh staff Helpdesk
     *
     * Actor tetap dikecualikan.
     */
    protected function resolveUpdatedRecipients(
        Model $record,
        ?int $actorId,
    ): Collection {
        return $this->baseRecipients(
            record: $record,
            includeOwner: true,
            includeStaff: true,
            actorId: $actorId,
        );
    }

    /* ========================================================================
     * CHAT
     * ========================================================================
     */

    /**
     * Aktivitas chat.
     *
     * Prioritas:
     *
     * 1. Jika event membawa recipient_ids:
     *    gunakan recipient tersebut.
     *
     * 2. Jika actor adalah pemohon:
     *    kirim ke seluruh staff Helpdesk.
     *
     * 3. Jika actor adalah staff:
     *    kirim hanya ke pemohon / owner record.
     *
     * 4. Actor selalu dikecualikan.
     */
    protected function resolveChatRecipients(
        Model $record,
        ?int $actorId,
        array $data,
    ): Collection {
        /*
         * --------------------------------------------------------------------
         * 1. Explicit recipient_ids
         * --------------------------------------------------------------------
         */
        $recipientIds = collect(
            $data['recipient_ids'] ?? []
        )
            ->filter()
            ->map(fn($id) => (int) $id)
            ->unique()
            ->values();

        if ($recipientIds->isNotEmpty()) {
            return User::query()
                ->whereIn('id', $recipientIds)
                ->when(
                    $actorId !== null,
                    fn($query) => $query->where(
                        'id',
                        '!=',
                        $actorId,
                    ),
                )
                ->get();
        }

        /*
         * --------------------------------------------------------------------
         * 2. Identifikasi actor
         * --------------------------------------------------------------------
         */
        $actor = $actorId
            ? User::find($actorId)
            : null;

        /*
         * --------------------------------------------------------------------
         * 3. Chat dari pemohon -> seluruh staff Helpdesk
         * --------------------------------------------------------------------
         */
        if ($actor?->hasRole('pemohon')) {
            return $this->staffRecipients(
                actorId: $actorId,
            );
        }

        /*
         * --------------------------------------------------------------------
         * 4. Chat dari staff -> pemohon / owner record
         * --------------------------------------------------------------------
         */
        if ($record->user_id) {
            return User::query()
                ->whereKey($record->user_id)
                ->when(
                    $actorId !== null,
                    fn($query) => $query->where(
                        'id',
                        '!=',
                        $actorId,
                    ),
                )
                ->get();
        }

        /*
         * Tidak ada owner dan tidak ada recipient eksplisit.
         */
        return collect();
    }

    /* ========================================================================
     * BASE RECIPIENTS
     * ========================================================================
     */

    /**
     * Recipient umum untuk created/status/updated.
     */
    protected function baseRecipients(
        Model $record,
        bool $includeOwner,
        bool $includeStaff,
        ?int $actorId,
    ): Collection {
        $recipients = collect();

        /*
         * --------------------------------------------------------------------
         * Pemohon / owner record
         * --------------------------------------------------------------------
         */
        if (
            $includeOwner &&
            $record->relationLoaded('user') &&
            $record->user
        ) {
            $recipients->push($record->user);
        }

        /*
         * --------------------------------------------------------------------
         * Staff Helpdesk
         * --------------------------------------------------------------------
         */
        if ($includeStaff) {
            $recipients = $recipients->merge(
                $this->staffRecipients(
                    actorId: null,
                )
            );
        }

        /*
         * --------------------------------------------------------------------
         * Jangan kirim kembali kepada actor
         * --------------------------------------------------------------------
         */
        if ($actorId !== null) {
            $recipients = $recipients->reject(
                fn(User $user) =>
                (int) $user->id === (int) $actorId
            );
        }

        /*
         * --------------------------------------------------------------------
         * Hindari duplicate user
         * --------------------------------------------------------------------
         */
        return $recipients
            ->unique('id')
            ->values();
    }

    /* ========================================================================
     * STAFF RECIPIENTS
     * ========================================================================
     */

    /**
     * Mengambil seluruh user yang memiliki role staff Helpdesk.
     */
    protected function staffRecipients(
        ?int $actorId = null,
    ): Collection {
        return User::query()
            ->whereHas(
                'roles',
                fn($query) => $query->whereIn(
                    'name',
                    self::STAFF_ROLES,
                ),
            )
            ->when(
                $actorId !== null,
                fn($query) => $query->where(
                    'id',
                    '!=',
                    $actorId,
                ),
            )
            ->get();
    }
}
