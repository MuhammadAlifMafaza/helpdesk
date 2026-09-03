<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Notification;

class HelpdeskNotification extends Notification implements ShouldQueue
{
    use Queueable;

    public function __construct(
        public string $type,
        public string $title,
        public string $message,
        public ?string $kode = null,
        public ?string $url = null,
        public ?string $icon = null,
        public ?string $color = null,
        public ?string $referenceId = null,
        public array $data = [],
    ) {
    }

    /* ========================================================================
     * Notification channels.
     * ========================================================================
     */
    public function via(object $notifiable): array
    {
        return [
            'database',
            'broadcast',
        ];
    }

    /* ========================================================================
     * Notification payloads.
     * ========================================================================
     */
    public function toDatabase(
        object $notifiable
    ): array {
        return [
            'type' => $this->type,
            'title' => $this->title,
            'message' => $this->message,
            'kode' => $this->kode,
            'url' => $this->url,
            'icon' => $this->icon,
            'color' => $this->color,
            'reference_id' => $this->referenceId,
            'data' => $this->data,
        ];
    }

    /* ========================================================================
     * Broadcast payloads.
     * ========================================================================
     */
    public function toBroadcast(
        object $notifiable,
    ): BroadcastMessage {

        return new BroadcastMessage([
            'type' => $this->type,
            'title' => $this->title,
            'message' => $this->message,
            'kode' => $this->kode,
            'url' => $this->url,
            'icon' => $this->icon,
            'color' => $this->color,
            'reference_id' => $this->referenceId,
            'data' => $this->data,
        ]);
    }

    /* ========================================================================
     * Broadcast type.
     * ========================================================================
     */
    public function broadcastOn(): array
    {
        return [
            'helpdesk-notifications',
        ];
    }
    public function broadcastType(): string
    {
        return 'helpdesk.notification';
    }
}
