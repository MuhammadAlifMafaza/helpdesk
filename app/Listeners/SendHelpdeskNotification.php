<?php

namespace App\Listeners;

use App\Events\HelpdeskActivityCreated;
use App\Models\User;
use App\Notifications\HelpdeskNotification;
use Illuminate\Support\Collection;

class SendHelpdeskNotification
{
    public function handle(
        HelpdeskActivityCreated $event
    ): void {

        $recipients = $this->resolveRecipients($event);

        $notification = $this->buildNotification($event);

        if (!$notification) {
            return;
        }

        foreach ($recipients as $user) {
            $user->notify($notification);
        }
    }

    protected function resolveRecipients(
        HelpdeskActivityCreated $event
    ): Collection {

        /*
         * ============================================================
         * CHAT
         * ============================================================
         */

        if ($event->activity === 'chat') {

            $recipientIds = collect(
                $event->data['recipient_ids'] ?? []
            );

            return User::query()
                ->whereIn('id', $recipientIds)
                ->when(
                    $event->actorId,
                    fn($query) =>
                    $query->where(
                        'id',
                        '!=',
                        $event->actorId
                    )
                )
                ->get();
        }

        /*
         * ============================================================
         * CREATED
         * ============================================================
         */

        if ($event->activity === 'created') {

            return User::query()
                ->whereHas('roles', function ($query) {

                    $query->whereIn('name', [
                        'admin',
                        'teknisi',
                        'admin_super',
                        'super_admin',
                    ]);

                })
                ->when(
                    $event->actorId,
                    fn($query) =>
                    $query->where(
                        'id',
                        '!=',
                        $event->actorId
                    )
                )
                ->get();
        }

        /*
         * ============================================================
         * TARGET USER
         * ============================================================
         */

        if (
            !empty($event->data['recipient_ids'])
        ) {

            return User::query()
                ->whereIn(
                    'id',
                    $event->data['recipient_ids']
                )
                ->when(
                    $event->actorId,
                    fn($query) =>
                    $query->where(
                        'id',
                        '!=',
                        $event->actorId
                    )
                )
                ->get();
        }

        return collect();
    }

    protected function buildNotification(
        HelpdeskActivityCreated $event
    ): ?HelpdeskNotification {

        return match ($event->activity) {

            'created' => new HelpdeskNotification(
                type: "{$event->module}.created",

                title:
                $event->module === 'perbaikan'
                ? 'Tiket Perbaikan Baru'
                : 'Pengajuan Barang Baru',

                message:
                $event->module === 'perbaikan'
                ? "Tiket {$event->kode} telah dibuat."
                : "Pengajuan {$event->kode} telah dibuat.",

                kode: $event->kode,

                data: $event->data,
            ),

            'chat' => new HelpdeskNotification(
                type: "{$event->module}.chat",

                title: 'Pesan Baru',

                message:
                $event->data['message']
                ?? 'Pesan baru diterima.',

                kode: $event->kode,

                data: $event->data,
            ),

            'status' => new HelpdeskNotification(
                type: "{$event->module}.status",

                title: 'Status Diperbarui',

                message:
                $event->data['message']
                ?? 'Status permintaan telah diperbarui.',

                kode: $event->kode,

                data: $event->data,
            ),

            default => null,
        };
    }
}
