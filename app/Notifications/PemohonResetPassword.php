<?php

namespace App\Notifications;

use App\Models\User;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class PemohonResetPassword extends Notification
{
    public function __construct(public string $token) {}

    /** @return array<int, string> */
    public function via(User $notifiable): array
    {
        return ['mail'];
    }

    public function toMail(User $notifiable): MailMessage
    {
        return (new MailMessage)
            ->subject('Atur ulang kata sandi — Helpdesk IWIMA')
            ->greeting('Halo, '.$notifiable->name)
            ->line('Kami menerima permintaan pengaturan ulang kata sandi akun pemohon Anda.')
            ->action('Atur ulang kata sandi', route('pemohon.password.reset', [
                'token' => $this->token,
                'email' => $notifiable->getEmailForPasswordReset(),
            ]))
            ->line('Tautan ini berlaku selama '.config('auth.passwords.users.expire').' menit dan hanya dapat digunakan sekali.')
            ->line('Jika Anda tidak meminta perubahan ini, abaikan email ini.')
            ->salutation('Helpdesk IWIMA');
    }
}
