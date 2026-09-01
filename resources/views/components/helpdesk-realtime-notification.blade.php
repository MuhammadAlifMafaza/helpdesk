@auth
    <div>
        <!-- It always seems impossible until it is done. - Nelson Mandela -->
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {

            if (!window.Echo) {
                console.warn('Laravel Echo belum tersedia.')
                return
            }

            const userId = @js(auth()->id())

            const channel = window.Echo.private(
                `users.${userId}`
            )

            channel.notification((notification) => {

                console.log(
                    '[HELPDESK REALTIME]',
                    notification
                )

                window.dispatchEvent(
                    new CustomEvent(
                        'helpdesk-notification',
                        {
                            detail: notification
                        }
                    )
                )

            })

        })
    </script>

@endauth