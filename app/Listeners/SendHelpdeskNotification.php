<?php

namespace App\Listeners;

use App\Events\HelpdeskActivityCreated;
use App\Models\User;
use App\Notifications\HelpdeskNotification;

class SendHelpdeskNotification
{
    public function handle(
        HelpdeskActivityCreated $event
    ): void {

        $recipients = $this->resolveRecipients($event);

        foreach ($recipients as $user) {

            $notification = $this->buildNotification($event);

            if (! $notification) {
                continue;
            }

            $user->notify($notification);
        }
    }

    protected function resolveRecipients(
        HelpdeskActivityCreated $event
    ) {
        return User::query()
            ->when(
                $event->actorId,
                fn ($query) => $query->where('id', '!=', $event->actorId)
            )
            ->whereHas('roles', function ($query) {
                $query->whereIn('name', [
                    'admin',
                    'teknisi',
                    'admin_super',
                    'super_admin',
                ]);
            })
            ->get();
    }

    protected function buildNotification(
        HelpdeskActivityCreated $event
    ): ?HelpdeskNotification {

        return match ($event->activity) {

            'created' => new HelpdeskNotification(
                type: "{$event->module}.created",
                title: $event->module === 'perbaikan'
                ? 'Tiket Perbaikan Baru'
                : 'Pengajuan Barang Baru',
                message: $event->module === 'perbaikan'
                ? "Tiket {$event->kode} telah dibuat."
                : "Pengajuan {$event->kode} telah dibuat.",
                kode: $event->kode,
                data: $event->data,
            ),

            'chat' => new HelpdeskNotification(
                type: "{$event->module}.chat",
                title: 'Pesan Baru',
                message: $event->data['message'] ?? '',
                kode: $event->kode,
                data: $event->data,
            ),

            default => null,
        };
    }
}
