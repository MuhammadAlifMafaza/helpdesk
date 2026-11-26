<?php

namespace Tests\Feature;

use Database\Seeders\DatabaseSeeder;
use Database\Seeders\FullWorkflowLoadTestSeeder;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Tests\TestCase;

class FullWorkflowLoadTestSeederTest extends TestCase
{
    use RefreshDatabase;

    public function test_full_workflow_dataset_covers_users_categories_and_all_outcomes_idempotently(): void
    {
        $this->seed(DatabaseSeeder::class);
        $this->seed(FullWorkflowLoadTestSeeder::class);

        $this->assertDatabaseCount('tiket_perbaikan', 51);
        $this->assertDatabaseCount('pengajuan_barang', 92);
        $this->assertDatabaseCount('log_harian_teknisi', 18);
        $this->assertDatabaseCount('kegiatan_petugas', 42);
        $this->assertSame(51, DB::table('tiket_perbaikan')->distinct('user_id')->count('user_id'));
        $this->assertSame(92, DB::table('pengajuan_barang')->whereNotNull('contoh_barang_url')->count());
        $serviceActorIds = DB::table('log_data_tiket_perbaikan')->distinct()->pluck('user_id')
            ->merge(DB::table('log_data_pengajuan_barang')->distinct()->pluck('user_id'))
            ->unique();
        $this->assertSame(57, $serviceActorIds->count());
        $this->assertSame(0, DB::table('tiket_perbaikan as tickets')
            ->where('tickets.deskripsi', 'like', '%[SIMULASI UJI ALUR HELPDESK 2026-11]%')
            ->whereRaw('tickets.updated_at < (SELECT MAX(logs.created_at) FROM log_data_tiket_perbaikan AS logs WHERE logs.tiket_id = tickets.id)')
            ->count());
        $this->assertSame(0, DB::table('pengajuan_barang as requests')
            ->where('requests.alasan', 'like', '%[SIMULASI UJI ALUR HELPDESK 2026-11]%')
            ->whereRaw('requests.updated_at < (SELECT MAX(logs.created_at) FROM log_data_pengajuan_barang AS logs WHERE logs.pengajuan_id = requests.id)')
            ->count());

        $categoryCounts = DB::table('pengajuan_barang')
            ->select('kategori_barang_id', DB::raw('COUNT(*) AS total'))
            ->groupBy('kategori_barang_id')
            ->pluck('total');

        $this->assertCount(23, $categoryCounts);
        $this->assertSame([4], $categoryCounts->unique()->values()->all());

        foreach (['Open', 'In Progress', 'Close'] as $status) {
            $this->assertGreaterThan(0, DB::table('tiket_perbaikan')->where('status', $status)->count());
            $this->assertGreaterThan(0, DB::table('pengajuan_barang')->where('status', $status)->count());
        }

        $this->assertSame(23, DB::table('log_data_pengajuan_barang')->where('keterangan', 'like', '[DITOLAK]%')->count());
        $this->assertSame(92, DB::table('pengajuan_barang')->whereBetween('created_at', [now()->subDays(36), now()])->count());
        $this->assertSame(69, DB::table('log_data_pengajuan_barang')->where('kategori_log', 'Update Data')->count());
        $ediId = DB::table('users')->where('email', 'edi@iwima.edu')->value('id');
        $this->assertSame(69, DB::table('log_data_pengajuan_barang')
            ->where('user_id', $ediId)
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'In Progress')
            ->count());
        $this->assertSame(3, DB::table('log_data_tiket_perbaikan')
            ->where('kategori_log', 'Status')
            ->where('data_baru', 'In Progress')
            ->distinct('user_id')
            ->count('user_id'));

        $activityCounts = DB::table('log_harian_teknisi')
            ->select('teknisi_id', DB::raw('COUNT(*) AS total'))
            ->groupBy('teknisi_id')
            ->pluck('total');

        $this->assertCount(3, $activityCounts);
        $this->assertSame([6], $activityCounts->unique()->values()->all());
        $this->assertSame(18, DB::table('kegiatan_petugas as participants')
            ->join('log_harian_teknisi as activities', 'activities.id', '=', 'participants.kegiatan_id')
            ->where('activities.deskripsi_kegiatan', 'like', '%[SIMULASI UJI ALUR HELPDESK 2026-11]%')
            ->whereColumn('participants.petugas_id', '=', 'activities.teknisi_id')
            ->count());
        $this->assertSame([2, 3], DB::table('kegiatan_petugas as participants')
            ->join('log_harian_teknisi as activities', 'activities.id', '=', 'participants.kegiatan_id')
            ->where('activities.deskripsi_kegiatan', 'like', '%[SIMULASI UJI ALUR HELPDESK 2026-11]%')
            ->select('activities.id', DB::raw('COUNT(DISTINCT participants.petugas_id) AS total'))
            ->groupBy('activities.id')
            ->orderBy('total')
            ->pluck('total')
            ->unique()
            ->values()
            ->all());
        $this->assertSame(6, DB::table('kegiatan_petugas as participants')
            ->join('log_harian_teknisi as activities', 'activities.id', '=', 'participants.kegiatan_id')
            ->join('users', 'users.id', '=', 'participants.petugas_id')
            ->where('activities.deskripsi_kegiatan', 'like', '%[SIMULASI UJI ALUR HELPDESK 2026-11]%')
            ->where('users.email', 'edi@iwima.edu')
            ->count());

        $this->seed(FullWorkflowLoadTestSeeder::class);

        $this->assertDatabaseCount('tiket_perbaikan', 51);
        $this->assertDatabaseCount('pengajuan_barang', 92);
        $this->assertDatabaseCount('log_harian_teknisi', 18);
        $this->assertDatabaseCount('kegiatan_petugas', 42);
    }
}
