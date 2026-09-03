<?php

namespace App\Listeners;

use App\Events\HelpdeskActivityCreated;
use App\Models\User;
use App\Services\Notifications\HelpdeskNotificationUrl;
use App\Services\Notifications\HelpdeskRecipientResolver;
use App\Notifications\HelpdeskNotification;

class SendHelpdeskNotification
{
    public function __construct(
        protected HelpdeskRecipientResolver $recipientResolver,
    ) {
    }

    /* =======================================================================
     * HANDLE EVENT
     * ========================================================================
     */
    public function handle(
        HelpdeskActivityCreated $event,
    ): void {
        /* =======================================================================
         * Jika referenceId null, maka tidak ada yang perlu dikirimkan.
         * ========================================================================
         */
        if ($event->referenceId === null) {
            return;
        }

        /* =======================================================================
         * Resolve recipients.
         * ========================================================================
         */
        $recipients = $this->recipientResolver->resolve(
            module: $event->module,
            referenceId: $event->referenceId,
            actorId: $event->actorId,
            activity: $event->activity,
            data: $event->data,
        );

        /* =======================================================================
         * Jika tidak ada recipient, maka tidak ada yang perlu dikirimkan.
         * ========================================================================
         */
        if ($recipients->isEmpty()) {
            return;
        }

        /* =======================================================================
         * Kirim notification ke setiap recipient.
         * ========================================================================
         */
        foreach ($recipients as $recipient) {

            $url = HelpdeskNotificationUrl::for(
                module: $event->module,
                referenceId: $event->referenceId,
                recipient: $recipient,
            );

            $notification = $this->buildNotification(
                event: $event,
                url: $url,
            );

            if (!$notification) {
                continue;
            }

            $recipient->notify($notification);
        }
    }

    /* =======================================================================
     * BUILD NOTIFICATION (Berdasarkan activity/aktivitas)
     * ========================================================================
     */
    protected function buildNotification(
        HelpdeskActivityCreated $event,
        ?string $url,
    ): ?HelpdeskNotification {

        return match ($event->activity) {
            'created' => $this->createdNotification($event, $url),
            'chat' => $this->chatNotification($event, $url),
            'status' => $this->statusNotification($event, $url),
            'updated' => $this->updatedNotification($event, $url),
            default => null,
        };
    }

    /* =======================================================================
     * NOTIFICATION BUILDERS (Berdasarkan activity/aktivitas)
     * ========================================================================
     */

    // Notification Created tiket/pengajuan baru.
    protected function createdNotification(
        HelpdeskActivityCreated $event,
        ?string $url,
    ): HelpdeskNotification {

        $isTicket = $event->module === 'perbaikan';

        return new HelpdeskNotification(
            type: "{$event->module}.created",

            title: $isTicket
            ? 'Tiket Perbaikan Baru'
            : 'Pengajuan Barang Baru',

            message: $event->data['message']
            ?? (
                $isTicket
                ? "Tiket {$event->kode} baru telah dibuat."
                : "Pengajuan {$event->kode} baru telah dibuat."
            ),

            kode: $event->kode,
            url: $url,

            icon: $isTicket
            ? 'heroicon-o-wrench-screwdriver'
            : 'heroicon-o-cube',

            color: 'info',
            referenceId: (string) $event->referenceId,
            data: $event->data,
        );
    }

    // Notification Chat tiket/pengajuan masuk.
    protected function chatNotification(
        HelpdeskActivityCreated $event,
        ?string $url,
    ): HelpdeskNotification {

        return new HelpdeskNotification(
            type: "{$event->module}.chat",
            title: "Pesan Baru · {$event->kode}",

            message: $event->data['message']
            ?? 'Pesan baru pada layanan Anda.',

            kode: $event->kode,
            url: $url,
            icon: 'heroicon-o-chat-bubble-left-right',
            color: 'info',
            referenceId: (string) $event->referenceId,
            data: $event->data,
        );
    }

    // Notification Status tiket/pengajuan diperbarui.
    protected function statusNotification(
        HelpdeskActivityCreated $event,
        ?string $url,
    ): HelpdeskNotification {

        return new HelpdeskNotification(
            type: "{$event->module}.status",
            title: "Status {$event->kode} Diperbarui",

            message: $event->data['message']
            ?? 'Status layanan telah diperbarui.',

            kode: $event->kode,
            url: $url,
            icon: 'heroicon-o-arrow-path',
            color: 'warning',
            referenceId: (string) $event->referenceId,
            data: $event->data,
        );
    }

    // Notification Perubahan Data tiket/pengajuan.
    protected function updatedNotification(
        HelpdeskActivityCreated $event,
        ?string $url,
    ): HelpdeskNotification {

        return new HelpdeskNotification(
            type: "{$event->module}.updated",
            title: "Data {$event->kode} Diperbarui",

            message: $event->data['message']
            ?? 'Data layanan telah diperbarui.',

            kode: $event->kode,
            url: $url,
            icon: 'heroicon-o-pencil-square',
            color: 'warning',
            referenceId: (string) $event->referenceId,
            data: $event->data,
        );
    }
}
