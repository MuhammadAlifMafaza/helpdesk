@auth
    @vite('resources/js/app.js')

    <script>
        window.helpdeskUserId = @json(auth()->id())
    </script>

    <script>
        document.addEventListener(
            'helpdesk-notification',
            (event) => {

                const notification = event.detail

                let body = ''

                if (notification.kode) {

                    body += `
                        <strong>
                            ${notification.kode}
                        </strong>
                    `
                }

                if (
                    notification.data?.sender_name
                ) {

                    body += `
                        <br>
                        ${notification.data.sender_name}
                    `
                }

                body += `
                    <br>
                    ${notification.message ?? ''}
                `

                const toast =
                    new window.FilamentNotification()

                toast
                    .title(
                        notification.title ??
                        'Notifikasi Helpdesk'
                    )
                    .body(body)

                if (notification.color) {
                    toast.color(notification.color)
                }

                if (notification.icon) {
                    toast.icon(notification.icon)
                }

                toast.send()
            }
        )
    </script>
@endauth
