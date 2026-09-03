<?php

namespace App\Services\Notifications;

use Filament\Facades\Filament;
use App\Models\User;

class HelpdeskNotificationUrl
{
    /**
     * Generate URL berdasarkan recipient.
     *
     * Recipient:
     * - pemohon  -> panel pemohon
     * - admin    -> panel admin
     * - teknisi  -> panel admin
     * - super_admin -> panel admin
     */
    public static function for(
        string $module,
        int|string $referenceId,
        User $recipient,
    ): ?string {

        $panel = self::resolvePanel($recipient);

        if (!$panel) {
            return null;
        }

        return match ($module) {
            'perbaikan' => self::ticketUrl(
                panel: $panel,
                id: $referenceId,
            ),

            'pengajuan' => self::pengajuanUrl(
                panel: $panel,
                id: $referenceId,
            ),

            default => null,
        };
    }

    /* =======================================================================
     * RESOLVE PANEL (Berdasarkan role user)
     * ========================================================================
     */
    protected static function resolvePanel(
        User $recipient,
    ): ?string {

        if ($recipient->hasRole('pemohon')) {
            return 'pemohon';
        }

        if (
            $recipient->hasAnyRole([
                'admin',
                'teknisi',
                'super_admin',
            ])
        ) {
            return 'admin';
        }

        return null;
    }

    /* ========================================================================
     * URL GENERATOR
     * ========================================================================
     */

    /* URL detail tiket perbaikan. */
    protected static function ticketUrl(
        string $panel,
        int|string $id,
    ): ?string {

        return match ($panel) {
            'pemohon' => route(
                'filament.pemohon.resources.ticket-perbaikan.view',
                [
                    'record' => $id,
                ],
            ),

            'admin' => route(
                'filament.admin.resources.ticket-services.view',
                [
                    'record' => $id,
                ],
            ),

            default => null,
        };
    }

    /* URL detail pengajuan barang. */
    protected static function pengajuanUrl(
        string $panel,
        int|string $id,
    ): ?string {

        return match ($panel) {
            'pemohon' => route(
                'filament.pemohon.resources.pengajuan-barang.view',
                [
                    'record' => $id,
                ],
            ),

            'admin' => route(
                'filament.admin.resources.pengajuan-barang.view',
                [
                    'record' => $id,
                ],
            ),

            default => null,
        };
    }
}
