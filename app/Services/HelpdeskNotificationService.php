<?php

namespace App\Services;

use App\Models\User;
use App\Notifications\HelpdeskNotification;

class HelpdeskNotificationService
{
    public static function sendNotification(
        User $recipient,
        string $type,
        string $title,
        string $message,
        ?string $kode = null,
        ?string $url = null,
        ?string $icon = null,
        ?string $color = null,
        ?string $referenceId = null,
        array $data = [],
    ): void {

        $recipient->notify(
            new HelpdeskNotification(
                type: $type,
                title: $title,
                message: $message,
                kode: $kode,
                url: $url,
                icon: $icon,
                color: $color,
                referenceId: $referenceId,
                data: $data,
            )
        );
    }
}
