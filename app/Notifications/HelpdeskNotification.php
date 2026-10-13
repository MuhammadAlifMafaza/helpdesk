<?php

namespace App\Notifications;

use Filament\Actions\Action;
use Filament\Notifications\Notification as FilamentNotification;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\BroadcastMessage;
use Illuminate\Notifications\Notification;

class HelpdeskNotification extends Notification
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
        /*
         * Filament's built-in database notification drawer only recognizes
         * payloads produced by Filament Notification::getDatabaseMessage().
         * Keep the existing Helpdesk metadata alongside that native payload
         * so realtime consumers and audit/debugging code remain compatible.
         */
        $filamentNotification = FilamentNotification::make()
            ->title($this->title)
            ->body($this->message)
            ->icon($this->icon)
            ->color($this->color ?? 'info');

        if (filled($this->url)) {
            $filamentNotification->actions([
                Action::make('open')
                    ->label('Buka notifikasi')
                    ->button()
                    ->url($this->url)
                    ->markAsRead(),
            ]);
        }

        return array_merge(
            $filamentNotification->getDatabaseMessage(),
            [
                'type' => $this->type,
                'title' => $this->title,
                'message' => $this->message,
                'kode' => $this->kode,
                'url' => $this->url,
                'icon' => $this->icon,
                'color' => $this->color,
                'reference_id' => $this->referenceId,
                'activity_key' => $this->activityKey(),
                'data' => array_merge($this->data, [
                    'module' => explode('.', $this->type)[0] ?? null,
                ]),
            ],
        );
    }

    /* ========================================================================
     * Broadcast payloads.
     * ========================================================================
     */
    public function toBroadcast(
        object $notifiable,
    ): BroadcastMessage {

        return new BroadcastMessage([
            'id' => $this->id,
            'type' => $this->type,
            'title' => $this->title,
            'message' => $this->message,
            'kode' => $this->kode,
            'url' => $this->url,
            'icon' => $this->icon,
            'color' => $this->color,
            'reference_id' => $this->referenceId,
            'activity_key' => $this->activityKey(),
            'data' => array_merge($this->data, [
                'module' => explode('.', $this->type)[0] ?? null,
                'activity' => explode('.', $this->type)[1] ?? null,
            ]),
        ]);
    }


    /** Stable key used to prevent duplicate database notifications when an
     * activity event is dispatched more than once for the same audit log.
     */
    protected function activityKey(): ?string
    {
        $logId = $this->data['log_id'] ?? null;

        if ($logId === null || $this->referenceId === null) {
            return null;
        }

        return implode(':', [
            $this->type,
            $this->referenceId,
            (string) $logId,
        ]);
    }

    /* ========================================================================
     * Broadcast type.
     * ========================================================================
     */
    public function broadcastType(): string
    {
        return 'helpdesk.notification';
    }
}
