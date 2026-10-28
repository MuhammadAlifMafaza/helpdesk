<?php

namespace Tests\Feature;

use App\Models\User;
use App\Notifications\HelpdeskNotification;
use Illuminate\Support\Facades\Broadcast;
use Tests\TestCase;

class HelpdeskNotificationRealtimeTest extends TestCase
{
    public function test_notification_uses_broadcast_channel_only_when_enabled(): void
    {
        $user = (new User)->forceFill(['id' => 123]);
        $notification = new HelpdeskNotification('perbaikan.status', 'Status', 'Pembaruan');

        config(['helpdesk.notifications.broadcast_enabled' => false]);
        $this->assertSame(['database'], $notification->via($user));

        config(['helpdesk.notifications.broadcast_enabled' => true]);
        $this->assertSame(['database', 'broadcast'], $notification->via($user));
    }

    public function test_private_notification_channel_only_authorizes_its_owner(): void
    {
        $user = (new User)->forceFill(['id' => 123]);
        $channelAuthorizers = Broadcast::getChannels();
        $authorizeUserChannel = $channelAuthorizers['users.{userId}'];

        $this->assertTrue($authorizeUserChannel($user, 123));
        $this->assertFalse($authorizeUserChannel($user, 456));
    }
}
