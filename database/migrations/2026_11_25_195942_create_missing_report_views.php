<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Build the report views that were previously present only in imported SQL dumps.
     */
    public function up(): void
    {
        if (DB::getDriverName() !== 'mysql') {
            return;
        }

        DB::unprepared(<<<'SQL'
            CREATE OR REPLACE VIEW `view_laporan_barang` AS
            SELECT
                `b`.`id` AS `no_pengajuan`,
                `u`.`name` AS `nama_pemohon`,
                `u`.`unit_bidang` AS `unit_bidang`,
                `b`.`nama_barang` AS `nama_barang`,
                `b`.`jumlah` AS `jumlah`,
                `b`.`alasan` AS `alasan`,
                `b`.`status` AS `status`,
                `b`.`created_at` AS `waktu_pengajuan`,
                (SELECT `lg`.`user_id` FROM `log_data_pengajuan_barang` `lg`
                    WHERE `lg`.`pengajuan_id` = `b`.`id`
                        AND `lg`.`kategori_log` = 'Status'
                        AND `lg`.`data_baru` = 'In Progress'
                    ORDER BY `lg`.`created_at` LIMIT 1) AS `teknisi_id`,
                (SELECT `us`.`name` FROM `log_data_pengajuan_barang` `lg`
                    INNER JOIN `users` `us` ON `us`.`id` = `lg`.`user_id`
                    WHERE `lg`.`pengajuan_id` = `b`.`id`
                        AND `lg`.`kategori_log` = 'Status'
                        AND `lg`.`data_baru` = 'In Progress'
                    ORDER BY `lg`.`created_at` LIMIT 1) AS `nama_teknisi`,
                (SELECT MIN(`lg`.`created_at`) FROM `log_data_pengajuan_barang` `lg`
                    WHERE `lg`.`pengajuan_id` = `b`.`id`
                        AND `lg`.`kategori_log` = 'Status'
                        AND `lg`.`data_baru` = 'In Progress') AS `waktu_mulai`,
                (SELECT MAX(`lg`.`created_at`) FROM `log_data_pengajuan_barang` `lg`
                    WHERE `lg`.`pengajuan_id` = `b`.`id`
                        AND `lg`.`kategori_log` = 'Status'
                        AND `lg`.`data_baru` = 'Close') AS `waktu_selesai`,
                TIMESTAMPDIFF(
                    MINUTE,
                    (SELECT MIN(`lg`.`created_at`) FROM `log_data_pengajuan_barang` `lg`
                        WHERE `lg`.`pengajuan_id` = `b`.`id`
                            AND `lg`.`kategori_log` = 'Status'
                            AND `lg`.`data_baru` = 'In Progress'),
                    (SELECT MAX(`lg`.`created_at`) FROM `log_data_pengajuan_barang` `lg`
                        WHERE `lg`.`pengajuan_id` = `b`.`id`
                            AND `lg`.`kategori_log` = 'Status'
                            AND `lg`.`data_baru` = 'Close')
                ) AS `durasi_pengerjaan_menit`,
                CASE
                    WHEN `b`.`status` <> 'Close' THEN NULL
                    WHEN EXISTS (
                        SELECT 1 FROM `log_data_pengajuan_barang` `lg`
                        WHERE `lg`.`pengajuan_id` = `b`.`id`
                            AND `lg`.`kategori_log` = 'Status'
                            AND `lg`.`data_baru` = 'Close'
                            AND `lg`.`keterangan` LIKE '[SELESAI]%'
                    ) THEN 'Completed'
                    WHEN EXISTS (
                        SELECT 1 FROM `log_data_pengajuan_barang` `lg`
                        WHERE `lg`.`pengajuan_id` = `b`.`id`
                            AND `lg`.`kategori_log` = 'Status'
                            AND `lg`.`data_baru` = 'Close'
                            AND `lg`.`keterangan` LIKE '[DITOLAK]%'
                    ) THEN 'Rejected'
                    ELSE NULL
                END AS `status_outcome`
            FROM `pengajuan_barang` `b`
            INNER JOIN `users` `u` ON `u`.`id` = `b`.`user_id`
            WHERE `b`.`deleted_at` IS NULL
            SQL);

        DB::unprepared(<<<'SQL'
            CREATE OR REPLACE VIEW `view_laporan_service` AS
            SELECT
                `t`.`id` AS `no_tiket`,
                `u`.`name` AS `nama_pemohon`,
                `r`.`nama_ruangan` AS `lokasi`,
                `t`.`kepemilikan` AS `kepemilikan`,
                `t`.`status` AS `status`,
                (SELECT `users`.`name` FROM `log_data_tiket_perbaikan`
                    INNER JOIN `users` ON `log_data_tiket_perbaikan`.`user_id` = `users`.`id`
                    WHERE `log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`
                        AND `log_data_tiket_perbaikan`.`kategori_log` = 'Status'
                        AND `log_data_tiket_perbaikan`.`data_baru` = 'In Progress'
                    ORDER BY `log_data_tiket_perbaikan`.`created_at` LIMIT 1) AS `nama_teknisi`,
                (SELECT MIN(`log_data_tiket_perbaikan`.`created_at`) FROM `log_data_tiket_perbaikan`
                    WHERE `log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`
                        AND `log_data_tiket_perbaikan`.`kategori_log` = 'Status'
                        AND `log_data_tiket_perbaikan`.`data_baru` = 'In Progress') AS `waktu_mulai`,
                (SELECT MAX(`log_data_tiket_perbaikan`.`created_at`) FROM `log_data_tiket_perbaikan`
                    WHERE `log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`
                        AND `log_data_tiket_perbaikan`.`kategori_log` = 'Status'
                        AND `log_data_tiket_perbaikan`.`data_baru` = 'Close') AS `waktu_selesai`,
                TIMESTAMPDIFF(
                    MINUTE,
                    (SELECT MIN(`log_data_tiket_perbaikan`.`created_at`) FROM `log_data_tiket_perbaikan`
                        WHERE `log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`
                            AND `log_data_tiket_perbaikan`.`kategori_log` = 'Status'
                            AND `log_data_tiket_perbaikan`.`data_baru` = 'In Progress'),
                    (SELECT MAX(`log_data_tiket_perbaikan`.`created_at`) FROM `log_data_tiket_perbaikan`
                        WHERE `log_data_tiket_perbaikan`.`tiket_id` = `t`.`id`
                            AND `log_data_tiket_perbaikan`.`kategori_log` = 'Status'
                            AND `log_data_tiket_perbaikan`.`data_baru` = 'Close')
                ) AS `durasi_pengerjaan_menit`
            FROM `tiket_perbaikan` `t`
            INNER JOIN `users` `u` ON `u`.`id` = `t`.`user_id`
            INNER JOIN `master_ruangan` `r` ON `r`.`id` = `t`.`ruangan_id`
            SQL);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (DB::getDriverName() !== 'mysql') {
            return;
        }

        DB::unprepared('DROP VIEW IF EXISTS `view_laporan_service`');
        DB::unprepared('DROP VIEW IF EXISTS `view_laporan_barang`');
    }
};
