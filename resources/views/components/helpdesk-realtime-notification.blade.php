@auth
    @vite('resources/js/app.js')

    <div class="fixed bottom-4 left-4 z-[60] flex items-center gap-3 rounded-xl border border-gray-200 bg-white/95 px-3 py-2 text-xs text-gray-700 shadow-lg dark:border-gray-700 dark:bg-gray-900/95 dark:text-gray-200">
        <span id="helpdesk-realtime-status" role="status" aria-live="polite">Realtime menghubungkan…</span>
        <span aria-hidden="true" class="text-gray-300 dark:text-gray-600">|</span>
        <button
            id="helpdesk-notifications-enable"
            type="button"
            class="font-medium text-primary-600 hover:text-primary-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 dark:text-primary-400"
        >
            Aktifkan notifikasi browser
        </button>
        <span id="helpdesk-notifications-status" class="sr-only" role="status" aria-live="polite"></span>
    </div>

    <script>
        window.helpdeskUserId = @json(auth()->id());
    </script>

    <script>
        if (!window.helpdeskToastHandlerRegistered) {
            window.helpdeskToastHandlerRegistered = true;

            const escapeHelpdeskHtml = (value) => String(value ?? '').replace(/[&<>"']/g, (character) => ({
                '&': '&amp;',
                '<': '&lt;',
                '>': '&gt;',
                '"': '&quot;',
                "'": '&#039;',
            })[character]);

            document.addEventListener('helpdesk-notification', (event) => {
                const notification = event.detail ?? {};
                const bodyParts = [];

                if (notification.kode) {
                    bodyParts.push(`<strong>${escapeHelpdeskHtml(notification.kode)}</strong>`);
                }

                if (notification.data?.sender_name) {
                    bodyParts.push(escapeHelpdeskHtml(notification.data.sender_name));
                }

                if (notification.message) {
                    bodyParts.push(escapeHelpdeskHtml(notification.message));
                }

                const toast = new window.FilamentNotification();
                toast
                    .title(notification.title ?? 'Notifikasi Helpdesk')
                    .body(bodyParts.join('<br>'));

                if (notification.color) {
                    toast.color(notification.color);
                }

                if (notification.icon) {
                    toast.icon(notification.icon);
                }

                toast.send();

                if (
                    document.visibilityState !== 'visible' &&
                    'Notification' in window &&
                    Notification.permission === 'granted'
                ) {
                    try {
                        const browserNotification = new Notification('Notifikasi Helpdesk', {
                            body: 'Ada pembaruan baru. Buka aplikasi untuk melihat detail.',
                            icon: @js(asset('branding/logo.svg')),
                            tag: notification.id ?? 'helpdesk-notification',
                        });

                        browserNotification.addEventListener('click', () => {
                            window.focus();
                            browserNotification.close();
                        });
                    } catch (error) {
                        console.warn('[Helpdesk notifications] Browser notification failed', error);
                    }
                }
            });
        }

        const permissionButton = document.getElementById('helpdesk-notifications-enable');
        const permissionStatus = document.getElementById('helpdesk-notifications-status');

        const updatePermissionUi = () => {
            if (!('Notification' in window) || !window.isSecureContext) {
                permissionStatus.textContent = 'Notifikasi browser tidak tersedia pada koneksi ini.';
                permissionButton.disabled = true;
                permissionButton.classList.add('cursor-not-allowed', 'opacity-60');

                return;
            }

            if (Notification.permission === 'granted') {
                permissionButton.textContent = 'Notifikasi browser aktif';
                permissionButton.disabled = true;
                permissionButton.classList.add('cursor-not-allowed', 'opacity-60');
                permissionStatus.textContent = 'Izin notifikasi browser aktif.';
            } else if (Notification.permission === 'denied') {
                permissionButton.textContent = 'Izin notifikasi ditolak';
                permissionButton.disabled = true;
                permissionButton.classList.add('cursor-not-allowed', 'opacity-60');
                permissionStatus.textContent = 'Ubah izin notifikasi melalui pengaturan browser.';
            }
        };

        permissionButton.addEventListener('click', async () => {
            if (!('Notification' in window) || !window.isSecureContext) {
                updatePermissionUi();

                return;
            }

            try {
                await Notification.requestPermission();
                updatePermissionUi();
            } catch (error) {
                permissionStatus.textContent = 'Izin notifikasi tidak dapat diminta.';
                console.warn('[Helpdesk notifications] Permission request failed', error);
            }
        });

        updatePermissionUi();
    </script>
@endauth
