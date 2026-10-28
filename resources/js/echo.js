// resources/js/echo.js
import Echo from 'laravel-echo';

import Pusher from 'pusher-js';
window.Pusher = Pusher;

if (!window.helpdeskRealtimeInitialized) {
    window.helpdeskRealtimeInitialized = true;

    const realtimeStatus = document.getElementById('helpdesk-realtime-status');
    let connectionState = 'connecting';
    let fallbackAttempts = 0;
    let lastFallbackAt = Date.now();
    const fallbackInterval = 30_000;
    const maximumFallbackAttempts = 20;

    const updateRealtimeStatus = (state) => {
        connectionState = state;

        if (realtimeStatus) {
            const labels = {
                connected: 'Realtime aktif',
                connecting: 'Realtime menghubungkan…',
                disconnected: 'Realtime terputus',
                unavailable: 'Realtime tidak tersedia',
                failed: 'Realtime gagal terhubung',
            };

            realtimeStatus.textContent = labels[state] ?? `Realtime: ${state}`;
            realtimeStatus.dataset.state = state;
        }

        if (state === 'connected') {
            fallbackAttempts = 0;
            lastFallbackAt = Date.now();
        }
    };

    const dispatchFallbackRefresh = () => {
        if (
            connectionState === 'connected' ||
            document.visibilityState !== 'visible' ||
            fallbackAttempts >= maximumFallbackAttempts ||
            Date.now() - lastFallbackAt < fallbackInterval
        ) {
            return;
        }

        fallbackAttempts += 1;
        lastFallbackAt = Date.now();

        window.Livewire?.dispatch('helpdesk-realtime-update', {
            module: null,
            reference_id: null,
            activity: null,
        });
    };

    window.Echo = new Echo({
        broadcaster: 'reverb',
        key: import.meta.env.VITE_REVERB_APP_KEY,
        wsHost: import.meta.env.VITE_REVERB_HOST,
        wsPort: import.meta.env.VITE_REVERB_PORT ?? 80,
        wssPort: import.meta.env.VITE_REVERB_PORT ?? 443,
        forceTLS: (import.meta.env.VITE_REVERB_SCHEME ?? 'https') === 'https',
        enabledTransports: ['ws', 'wss'],
    });

    // Beritahu komponen Filament (drawer notifikasi) bahwa Echo sudah siap
    // dan mereka boleh subscribe ke channel realtime.
    window.dispatchEvent(new CustomEvent('EchoLoaded'));

    window.Echo.connector.pusher.connection.bind('error', (error) => {
        console.error('[Helpdesk realtime] Connection error', error);
    });

    window.Echo.connector.pusher.connection.bind('state_change', (states) => {
        console.debug('[Helpdesk realtime] Connection state', states);
        updateRealtimeStatus(states.current);
    });

    updateRealtimeStatus(window.Echo.connector.pusher.connection.state);
    window.setInterval(dispatchFallbackRefresh, fallbackInterval);
    document.addEventListener('visibilitychange', dispatchFallbackRefresh);

    if (window.helpdeskUserId) {
        const notificationChannel = window.Echo.private(`users.${window.helpdeskUserId}`);

        notificationChannel.error((error) => {
            console.error('[Helpdesk realtime] Channel authorization error', error);
        });

        notificationChannel
            .notification((notification) => {
                if (notification.id && window.helpdeskNotificationIds?.has(notification.id)) {
                    return;
                }

                window.helpdeskNotificationIds ??= new Set();
                if (notification.id) {
                    window.helpdeskNotificationIds.add(notification.id);

                    if (window.helpdeskNotificationIds.size > 200) {
                        const oldestNotificationId = window.helpdeskNotificationIds.values().next().value;

                        window.helpdeskNotificationIds.delete(oldestNotificationId);
                    }
                }

                window.Livewire?.dispatch('helpdesk-realtime-update', {
                    module: notification.data?.module ?? notification.type?.split('.')[0],
                    reference_id: notification.reference_id,
                    activity: notification.type?.split('.')[1],
                });

                document.dispatchEvent(
                    new CustomEvent('helpdesk-notification', {
                        detail: notification,
                    }),
                );
            });
    }
}
