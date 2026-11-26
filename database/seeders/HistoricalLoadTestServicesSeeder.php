<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Master\Ruangan\Models\MasterRuangan;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class HistoricalLoadTestServicesSeeder extends Seeder
{
    private const MARKER = 'LOADTEST-HISTORY-v1';

    private const EXAMPLE_PRODUCT_URL = 'https://www.tokopedia.com/search?st=product&q=access%20point%20wi-fi%206';

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $existingTickets = TiketPerbaikan::query()
            ->where('keluhan', 'like', self::MARKER.':%')
            ->count();
        $existingRequests = PengajuanBarang::query()
            ->where('nama_barang', 'like', self::MARKER.':%')
            ->count();

        if ($existingTickets > 0 || $existingRequests > 0) {
            if ($existingTickets === 5 && $existingRequests === 5) {
                $this->command?->info('Riwayat layanan load test sudah tersedia; tidak ada data yang diubah.');

                return;
            }

            throw new RuntimeException('Riwayat load test ditemukan dalam kondisi parsial. Seeder dibatalkan agar data yang ada tidak tertimpa.');
        }

        $applicant = User::role('pemohon')->orderBy('id')->firstOrFail();
        $technician = User::role('teknisi')->orderBy('id')->firstOrFail();
        $room = MasterRuangan::query()->where('is_active', true)->orderBy('id')->firstOrFail();
        $category = MasterKategoriBarang::query()->where('is_active', true)->orderBy('id')->firstOrFail();

        DB::transaction(function () use ($applicant, $technician, $room, $category): void {
            foreach ($this->scenarios() as $scenario) {
                $this->seedTicket($scenario, (int) $applicant->getKey(), (int) $technician->getKey(), (int) $room->getKey());
                $this->seedRequest($scenario, (int) $applicant->getKey(), (int) $technician->getKey(), (int) $category->getKey());
            }
        });

        $this->command?->info('Created 5 historical repair tickets and 5 item requests with chronological status logs.');
    }

    /**
     * @return array<int, array{key: string, days_ago: int, status: string, outcome: string}>
     */
    private function scenarios(): array
    {
        return [
            ['key' => 'menunggu', 'days_ago' => 3, 'status' => 'Open', 'outcome' => 'pending'],
            ['key' => 'berjalan', 'days_ago' => 21, 'status' => 'In Progress', 'outcome' => 'in_progress'],
            ['key' => 'selesai-1', 'days_ago' => 35, 'status' => 'Close', 'outcome' => 'completed'],
            ['key' => 'selesai-2', 'days_ago' => 49, 'status' => 'Close', 'outcome' => 'completed'],
            ['key' => 'ditolak', 'days_ago' => 63, 'status' => 'Close', 'outcome' => 'rejected'],
        ];
    }

    /**
     * @param  array{key: string, days_ago: int, status: string, outcome: string}  $scenario
     */
    private function seedTicket(array $scenario, int $applicantId, int $technicianId, int $roomId): void
    {
        $openedAt = now()->subDays($scenario['days_ago'])->setTime(9, 0);
        $assignedAt = $openedAt->copy()->addHours(2);
        $updatedAt = match ($scenario['outcome']) {
            'pending' => $openedAt,
            'in_progress' => $assignedAt,
            'completed' => $assignedAt->copy()->addDay()->addHours(2),
            'rejected' => $assignedAt->copy()->addDay(),
        };

        $confirmationStatus = $scenario['outcome'] === 'completed' ? 'disetujui' : null;
        $record = TiketPerbaikan::withoutEvents(function () use ($scenario, $applicantId, $roomId, $updatedAt, $confirmationStatus): TiketPerbaikan {
            $record = new TiketPerbaikan([
                'user_id' => $applicantId,
                'ruangan_id' => $roomId,
                'keluhan' => self::MARKER.': '.$scenario['key'].' - PC ruang kuliah perlu pemeriksaan teknisi',
                'kepemilikan' => 'Inventaris Kantor',
                'deskripsi' => 'Data historis simulasi load test. Perangkat memerlukan pemeriksaan koneksi, konfigurasi, dan pencatatan hasil layanan.',
                'status' => $scenario['status'],
                'konfirmasi_status' => $confirmationStatus,
                'konfirmasi_at' => $confirmationStatus ? $updatedAt : null,
                'konfirmasi_catatan' => $confirmationStatus ? 'Hasil pemeriksaan diterima oleh pemohon.' : null,
            ]);
            $record->created_at = now()->subDays($scenario['days_ago'])->setTime(9, 0);
            $record->updated_at = $updatedAt;
            $record->save();

            return $record;
        });

        $this->insertStatusLog('log_data_tiket_perbaikan', 'tiket_id', (int) $record->getKey(), $applicantId, null, 'Open', '[LOADTEST-HISTORY] Tiket dibuat.', $openedAt);

        if (in_array($scenario['outcome'], ['in_progress', 'completed', 'rejected'], true)) {
            $this->insertStatusLog('log_data_tiket_perbaikan', 'tiket_id', (int) $record->getKey(), $technicianId, 'Open', 'In Progress', '[LOADTEST-HISTORY] Teknisi mulai menangani tiket.', $assignedAt);
        }

        if ($scenario['outcome'] === 'completed') {
            $confirmationRequestedAt = $updatedAt->copy()->subHour();
            $this->insertStatusLog('log_data_tiket_perbaikan', 'tiket_id', (int) $record->getKey(), $technicianId, 'In Progress', 'Menunggu Konfirmasi', '[LOADTEST-HISTORY] Pekerjaan selesai dan menunggu konfirmasi pemohon.', $confirmationRequestedAt, 'Konfirmasi');
            $this->insertStatusLog('log_data_tiket_perbaikan', 'tiket_id', (int) $record->getKey(), $applicantId, 'In Progress', 'Close', '[SELESAI] [LOADTEST-HISTORY] Pekerjaan disetujui pemohon.', $updatedAt);
        }

        if ($scenario['outcome'] === 'rejected') {
            $this->insertStatusLog('log_data_tiket_perbaikan', 'tiket_id', (int) $record->getKey(), $technicianId, 'In Progress', 'Close', '[DITOLAK] [LOADTEST-HISTORY] Permintaan tidak dapat dipenuhi karena komponen pengganti tidak tersedia.', $updatedAt);
        }
    }

    /**
     * @param  array{key: string, days_ago: int, status: string, outcome: string}  $scenario
     */
    private function seedRequest(array $scenario, int $applicantId, int $technicianId, int $categoryId): void
    {
        $openedAt = now()->subDays($scenario['days_ago'])->setTime(10, 0);
        $assignedAt = $openedAt->copy()->addHours(2);
        $updatedAt = match ($scenario['outcome']) {
            'pending' => $openedAt,
            'in_progress' => $assignedAt,
            'completed' => $assignedAt->copy()->addDay()->addHours(2),
            'rejected' => $assignedAt->copy()->addDay(),
        };

        $confirmationStatus = $scenario['outcome'] === 'completed' ? 'disetujui' : null;
        $record = PengajuanBarang::withoutEvents(function () use ($scenario, $applicantId, $categoryId, $updatedAt, $confirmationStatus): PengajuanBarang {
            $record = new PengajuanBarang([
                'user_id' => $applicantId,
                'kategori_barang_id' => $categoryId,
                'nama_barang' => self::MARKER.': '.$scenario['key'].' - Access point Wi-Fi 6 untuk ruang kuliah',
                'spesifikasi_barang' => 'Dual-band Wi-Fi 6, Gigabit Ethernet, dukungan manajemen terpusat, dan garansi resmi.',
                'jumlah' => 2,
                'alasan' => 'Data historis simulasi load test untuk pemenuhan kebutuhan konektivitas ruang kuliah.',
                'contoh_barang_url' => self::EXAMPLE_PRODUCT_URL,
                'status' => $scenario['status'],
                'konfirmasi_status' => $confirmationStatus,
                'konfirmasi_at' => $confirmationStatus ? $updatedAt : null,
                'konfirmasi_catatan' => $confirmationStatus ? 'Barang diterima dan pengajuan dikonfirmasi.' : null,
            ]);
            $record->created_at = now()->subDays($scenario['days_ago'])->setTime(10, 0);
            $record->updated_at = $updatedAt;
            $record->save();

            return $record;
        });

        $this->insertStatusLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $record->getKey(), $applicantId, null, 'Open', '[LOADTEST-HISTORY] Pengajuan dibuat dengan referensi contoh barang.', $openedAt);

        if (in_array($scenario['outcome'], ['in_progress', 'completed', 'rejected'], true)) {
            $this->insertStatusLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $record->getKey(), $technicianId, 'Open', 'In Progress', '[LOADTEST-HISTORY] Pengajuan mulai diproses oleh staff.', $assignedAt);
        }

        if ($scenario['outcome'] === 'completed') {
            $confirmationRequestedAt = $updatedAt->copy()->subHour();
            $this->insertStatusLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $record->getKey(), $technicianId, 'In Progress', 'Menunggu Konfirmasi', '[LOADTEST-HISTORY] Pengajuan dipenuhi dan menunggu konfirmasi pemohon.', $confirmationRequestedAt, 'Konfirmasi');
            $this->insertStatusLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $record->getKey(), $applicantId, 'In Progress', 'Close', '[SELESAI] [LOADTEST-HISTORY] Barang diterima dan disetujui pemohon.', $updatedAt);
        }

        if ($scenario['outcome'] === 'rejected') {
            $this->insertStatusLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $record->getKey(), $technicianId, 'In Progress', 'Close', '[DITOLAK] [LOADTEST-HISTORY] Pengajuan ditolak karena spesifikasi tidak sesuai dengan standar perangkat kampus.', $updatedAt);
        }
    }

    private function insertStatusLog(
        string $table,
        string $foreignKey,
        int $recordId,
        int $actorId,
        ?string $oldStatus,
        string $newStatus,
        string $description,
        Carbon $timestamp,
        string $category = 'Status',
    ): void {
        DB::table($table)->insert([
            $foreignKey => $recordId,
            'user_id' => $actorId,
            'kategori_log' => $category,
            'data_lama' => $oldStatus,
            'data_baru' => $newStatus,
            'keterangan' => $description,
            'created_at' => $timestamp,
        ]);
    }
}
