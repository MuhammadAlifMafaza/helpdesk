<?php

namespace App\Events;

use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class HelpdeskActivityCreated
{
    use Dispatchable, SerializesModels;

    public function __construct(
        public string $module,
        public int $recordId,
        public string $activity,
        public ?string $kode = null,
        public ?int $actorId = null,
        public ?string $referenceId = null,
        public array $data = [],
    ) {}

    public function broadcastOn(): array
    {
        return [
            new PrivateChannel('Helpdesk-System-Notification'),
        ];
    }
}
