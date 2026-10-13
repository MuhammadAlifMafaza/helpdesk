<?php

namespace App\Filament\Concerns;

use Illuminate\Notifications\DatabaseNotification;
use Illuminate\Support\Facades\Auth;
use Livewire\WithPagination;

trait InteractsWithNotificationCenter
{
    use WithPagination;

    public string $filter = 'all';

    public function setFilter(string $filter): void
    {
        $this->filter = in_array($filter, ['all', 'unread', 'read'], true)
            ? $filter
            : 'all';

        $this->resetPage();
    }

    public function markAsRead(string $notificationId): void
    {
        $notification = Auth::user()
            ?->notifications()
            ->whereKey($notificationId)
            ->first();

        if ($notification && ! $notification->read_at) {
            $notification->markAsRead();
        }
    }

    public function markAllAsRead(): void
    {
        Auth::user()
            ?->unreadNotifications()
            ->update(['read_at' => now()]);
    }

    public function openNotification(string $notificationId)
    {
        /** @var DatabaseNotification|null $notification */
        $notification = Auth::user()
            ?->notifications()
            ->whereKey($notificationId)
            ->first();

        if (! $notification) {
            abort(404);
        }

        $notification->markAsRead();

        $url = data_get($notification->data, 'url');

        if (! is_string($url) || trim($url) === '') {
            return null;
        }

        // Old notifications may contain an absolute URL from a previous host.
        // Keep navigation inside the current application by using only its path
        // and query string rather than redirecting to the stored hostname.
        $path = parse_url($url, PHP_URL_PATH);
        $query = parse_url($url, PHP_URL_QUERY);

        if (! is_string($path) || $path === '' || ! str_starts_with($path, '/')) {
            return null;
        }

        $target = $path.($query ? '?'.$query : '');

        return redirect()->to($target);
    }

    protected function getViewData(): array
    {
        $user = Auth::user();

        if (! $user) {
            abort(401);
        }

        $query = $user->notifications()->latest();

        if ($this->filter === 'unread') {
            $query->whereNull('read_at');
        } elseif ($this->filter === 'read') {
            $query->whereNotNull('read_at');
        }

        return [
            'notifications' => $query->paginate(15),
            'unreadCount' => $user->unreadNotifications()->count(),
        ];
    }

    public static function getNavigationBadge(): ?string
    {
        $count = Auth::user()?->unreadNotifications()->count() ?? 0;

        return $count > 0 ? (string) min($count, 99) : null;
    }

    public static function getNavigationBadgeColor(): ?string
    {
        return 'danger';
    }
}
