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
        $record = $this->resolveRecord($module, $referenceId);

        if (!$record) {
            return collect();
        }

        return match ($activity) {
            // A newly created record is announced to staff, not its creator.
            'created' => $this->staffRecipients($actorId),
            'status', 'updated' => $this->resolveChangedRecipients($record, $actorId),
            'cancelled' => $this->resolveCancelledRecipients($record, $actorId),
            'chat' => $this->resolveChatRecipients($record, $actorId, $data),
            default => collect(),
        };
    }

    /* ========================================================================
     * RESOLVE RECORD
     * ========================================================================
     */
    protected function resolveRecord(
        string $module,
        int|string $referenceId
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

    /**
     * Notify only the party affected by the change:
     * - staff action -> record owner;
     * - owner action -> staff;
     * - system/unknown actor -> owner and staff.
     */
    protected function resolveChangedRecipients(
        Model $record,
        ?int $actorId
    ): Collection {
        if (
            $actorId !== null &&
            (int) $record->user_id === $actorId
        ) {
            return $this->staffRecipients($actorId);
        }

        if ($actorId !== null && $this->isStaff($actorId)) {
            return $this->ownerRecipients($record, $actorId);
        }

        return $this->mergeRecipients(
            $this->ownerRecipients($record, $actorId),
            $this->staffRecipients($actorId),
        );
    }

    protected function resolveCancelledRecipients(Model $record, ?int $actorId): Collection
    {
        // A cancellation by the owner should notify staff. If staff/system cancels,
        // notify the owner where possible. The event is dispatched before soft delete.
        if (
            $actorId !== null &&
            (int) $record->user_id === $actorId
        ) {
            return $this->staffRecipients($actorId);
        }

        return $this->ownerRecipients($record, $actorId);
    }

    /* ========================================================================
     * CHAT
     * ========================================================================
     */
    protected function resolveChatRecipients(
        Model $record,
        ?int $actorId,
        array $data
    ): Collection {
        $ownerId = (int) ($record->user_id ?? 0);
        $explicitIds = collect(
            $data['recipient_ids'] ?? []
        )
            ->filter(fn($id) => is_numeric($id) && (int) $id > 0)
            ->map(fn($id) => (int) $id)
            ->unique()
            ->reject(fn(int $id) => $id === $actorId)
            ->values();

        if ($explicitIds->isNotEmpty()) {
            // Never trust recipient_ids alone: recipients must be the owner or
            // authorized Helpdesk staff associated with this service workflow.
            return User::query()
                ->whereIn('
                id', $explicitIds)
                ->where(
                    function ($query) use ($ownerId) {
                        $query->whereKey($ownerId)
                            ->orWhereHas(
                                'roles',
                                fn($roles) => $roles->whereIn('name', self::STAFF_ROLES)
                            );
                    }
                )
                ->get()
                ->unique('id')
                ->values();
        }

        if ($actorId !== null && $actorId === $ownerId) {
            return $this->staffRecipients($actorId);
        }

        if ($actorId !== null && $this->isStaff($actorId)) {
            return $this->ownerRecipients($record, $actorId);
        }

        // Unknown actor: fail closed rather than broadcasting a message widely.
        return collect();
    }

    protected function ownerRecipients(
        Model $record,
        ?int $actorId
    ): Collection {
        if (!$record->user_id) {
            return collect();
        }

        return User::query()
            ->whereKey($record->user_id)
            ->when(
                $actorId !== null,
                fn($query) => $query->where('id', '!=', $actorId)
            )
            ->get();
    }

    protected function staffRecipients(?int $actorId = null): Collection
    {
        return User::query()
            ->whereHas('roles', fn($query) => $query->whereIn('name', self::STAFF_ROLES))
            ->when(
                $actorId !== null,
                fn($query) => $query->where('id', '!=', $actorId)
            )
            ->get()
            ->unique('id')
            ->values();
    }

    protected function isStaff(int $userId): bool
    {
        return User::query()
            ->whereKey($userId)
            ->whereHas(
                'roles',
                fn($query) => $query->whereIn('name', self::STAFF_ROLES)
            )
            ->exists();
    }

    protected function mergeRecipients(Collection ...$collections): Collection
    {
        return collect($collections)
            ->flatten(1)
            ->filter(fn($user) => $user instanceof User)
            ->unique('id')
            ->values();
    }
}
