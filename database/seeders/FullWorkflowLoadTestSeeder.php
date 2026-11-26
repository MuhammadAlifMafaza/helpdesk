<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Master\Ruangan\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Carbon;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use RuntimeException;

class FullWorkflowLoadTestSeeder extends Seeder
{
    private const MARKER = '[SIMULASI UJI ALUR HELPDESK 2026-11]';

    /**
     * Four submissions per active category: new, in progress, completed, and rejected.
     * The rejected entry in each category intentionally describes an item from another
     * category so staff can record a realistic mismatch decision.
     *
     * @var array<string, array{0: string, 1: string, 2: string, 3: string}>
     */
    private const PRODUCTS_BY_CATEGORY = [
        'Komputer' => ['Dell OptiPlex 7010 SFF', 'HP ProDesk 400 G9 SFF', 'Lenovo ThinkCentre M70s Gen 4', 'Epson WorkForce DS-530II'],
        'Laptop' => ['Lenovo ThinkPad E14 Gen 5', 'ASUS ExpertBook B1 B1502', 'Acer TravelMate P2 TMP214', 'Epson EcoTank L3250'],
        'Komponen Komputer' => ['Kingston FURY Beast DDR4 16 GB', 'Corsair CV550 550 W 80+ Bronze', 'Samsung 990 EVO NVMe 1 TB', 'ASUS ExpertBook B1 B1502'],
        'Komponen Laptop' => ['Baterai Lenovo ThinkPad E14 Gen 4', 'Adaptor ASUS 65 W USB-C', 'Keyboard Lenovo ThinkPad E14 Gen 4', 'TP-Link Omada EAP610'],
        'Monitor' => ['Dell P2422H 24-inch IPS', 'Lenovo ThinkVision E24-30', 'LG 24MR400-B 24-inch IPS', 'Brother DCP-T720DW'],
        'Proyektor' => ['Epson EB-E01 XGA 3LCD', 'BenQ MS560 DLP', 'Epson CO-W01 WXGA 3LCD', 'Logitech Brio 4K'],
        'Perangkat Jaringan' => ['TP-Link Omada EAP610 Wi-Fi 6', 'Aruba Instant On AP22', 'Cisco CBS350-24T-4G Switch', 'Canon imageFORMULA DR-C240'],
        'Aksesori Jaringan' => ['Kabel patch Cat6 UTP 3 meter', 'Keystone jack Cat6 UTP', 'Modul SFP 1G LC duplex', 'Dell P2422H 24-inch IPS'],
        'Printer' => ['Epson EcoTank L3250', 'Brother DCP-T720DW', 'HP LaserJet Pro M404dn', 'Lenovo ThinkCentre M70s Gen 4'],
        'Scanner' => ['Epson WorkForce DS-530II', 'Canon imageFORMULA DR-C240', 'Ricoh fi-8170 ADF Scanner', 'HP LaserJet Pro M404dn'],
        'Suku Cadang Printer' => ['Printhead Epson L3250', 'Fuser assembly HP LaserJet Pro M404', 'Pickup roller kit Brother DCP-T720DW', 'Cisco CBS350-24T-4G Switch'],
        'Bahan Habis Pakai Printer' => ['Tinta Epson 003 Black Cyan Magenta Yellow', 'Toner HP 59A CF259A', 'Toner Brother TN-2480', 'Canon imageFORMULA DR-C240'],
        'Peralatan Infrastruktur IT' => ['APC Smart-UPS SMT1500IC 1500 VA', 'Rack server 20U 600x1000 mm', 'Patch panel Cat6 24-port', 'ASUS ExpertBook B1 B1502'],
        'Peralatan Teknisi' => ['LAN cable tester Noyafa NF-8209', 'Tang crimping modular RJ45 Cat6', 'Multimeter digital UNI-T UT33D+', 'Epson EB-E01 XGA 3LCD'],
        'Perangkat Presentasi' => ['Logitech R500s Wireless Presenter', 'Logitech Spotlight Presentation Remote', 'HDMI switcher 4-input 1-output 4K', 'Kingston FURY Beast DDR4 16 GB'],
        'Perangkat Audio' => ['Jabra Speak 510 USB/Bluetooth Speakerphone', 'Logitech H390 USB Headset', 'JBL EON One Compact Portable PA', 'TP-Link Omada EAP610 Wi-Fi 6'],
        'Perangkat Video' => ['Logitech Brio 4K Webcam', 'AVerMedia PW315 Full HD Webcam', 'AVerMedia Live Gamer MINI Capture Card', 'Epson EcoTank L3250'],
        'Aksesori Komputer' => ['USB-C docking station Dell WD19S', 'Kensington laptop lock K64673', 'Adjustable laptop stand aluminium', 'Epson WorkForce DS-530II'],
        'Periferal Komputer' => ['Logitech MK270 Wireless Keyboard and Mouse', 'Logitech M650 Wireless Mouse', 'Wacom One Small CTL-472 Tablet', 'Aruba Instant On AP22'],
        'Server' => ['Dell PowerEdge R350 Xeon E-2334', 'HPE ProLiant DL20 Gen10 Plus', 'Lenovo ThinkSystem SR250 V2', 'BenQ MS560 DLP'],
        'Penyimpanan Data' => ['Synology DS923+ NAS 4-bay', 'WD Red Plus 8 TB NAS HDD', 'Samsung T7 Shield Portable SSD 2 TB', 'Brother DCP-T720DW'],
        'CCTV' => ['Hikvision DS-2CD2043G2-I 4 MP IP Camera', 'Dahua NVR4108HS-8P-4KS2 8-channel NVR', 'Hikvision DS-2CD2346G2-IU 4 MP Turret Camera', 'Kingston FURY Beast DDR4 16 GB'],
        'Perangkat Keamanan IT' => ['Fortinet FortiGate 40F Firewall', 'Sophos XGS 87 Security Appliance', 'Ubiquiti UniFi Dream Machine Pro', 'Epson EcoTank L3250'],
    ];

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        if ($this->hasCompleteDataset()) {
            $this->synchronizeUpdatedAtFromLogs();
            $this->synchronizeTechnicianActivities();
            $this->synchronizeReviewerMessages();
            $this->command?->info('Full workflow dataset already exists; timestamps and staff participation were reconciled.');

            return;
        }

        $this->assertNoPartialDataset();

        $applicants = User::role('pemohon')->orderBy('id')->get();
        $technicians = User::role('teknisi')->orderBy('id')->get();
        $edi = User::query()->where('email', 'edi@iwima.edu')->first();
        $reviewAdmin = $edi ? User::role('admin')->where('id', '<>', $edi->id)->orderBy('id')->first() : null;
        $superAdmin = User::role('super_admin')->orderBy('id')->first();
        $rooms = MasterRuangan::query()->where('is_active', true)->orderBy('id')->get();
        $categories = MasterKategoriBarang::query()->where('is_active', true)->orderBy('id')->get();

        if ($applicants->count() !== 51 || $technicians->count() !== 3 || ! $edi?->hasRole('admin') || ! $reviewAdmin || ! $superAdmin) {
            throw new RuntimeException('Expected all 51 pemohon, 3 teknisi, Edi and another admin, and one super_admin before seeding.');
        }

        $categoryNames = $categories->pluck('nama_kategori')
            ->map(fn (string $name): string => $name === 'Tools Teknisi' ? 'Peralatan Teknisi' : $name)
            ->sort()
            ->values()
            ->all();
        $expectedCategoryNames = collect(array_keys(self::PRODUCTS_BY_CATEGORY))->sort()->values()->all();

        if ($categories->count() !== 23 || $categoryNames !== $expectedCategoryNames) {
            throw new RuntimeException('The active item categories differ from the reviewed 23-category dataset. No data was added.');
        }

        if ($rooms->isEmpty()) {
            throw new RuntimeException('At least one active room is required to seed repair requests.');
        }

        DB::transaction(function () use ($applicants, $technicians, $edi, $reviewAdmin, $superAdmin, $rooms, $categories): void {
            $ticketWorkloads = $this->seedRepairTickets($applicants, $technicians, $reviewAdmin, $superAdmin, $rooms);
            $this->seedItemRequests($applicants, $edi, $categories);
            $this->seedTechnicianActivities($technicians, $rooms, $ticketWorkloads, $edi);
        });

        $this->command?->info('Seeded workflows using all 57 accounts: 51 repair tickets, 92 item requests, and 18 technician activity records.');
    }

    private function hasCompleteDataset(): bool
    {
        $ticketCount = DB::table('tiket_perbaikan')
            ->where('deskripsi', 'like', '%'.self::MARKER.'%')
            ->count();
        $requestCount = DB::table('pengajuan_barang')
            ->where('alasan', 'like', '%'.self::MARKER.'%')
            ->count();
        $activityCount = DB::table('log_harian_teknisi')
            ->where('deskripsi_kegiatan', 'like', '%'.self::MARKER.'%')
            ->count();

        return $ticketCount === 51 && $requestCount === 92 && $activityCount === 18;
    }

    private function assertNoPartialDataset(): void
    {
        $ticketCount = DB::table('tiket_perbaikan')
            ->where('deskripsi', 'like', '%'.self::MARKER.'%')
            ->count();
        $requestCount = DB::table('pengajuan_barang')
            ->where('alasan', 'like', '%'.self::MARKER.'%')
            ->count();
        $activityCount = DB::table('log_harian_teknisi')
            ->where('deskripsi_kegiatan', 'like', '%'.self::MARKER.'%')
            ->count();

        if ($ticketCount > 0 || $requestCount > 0 || $activityCount > 0) {
            throw new RuntimeException('A partial full-workflow dataset was found. Seeder stopped without changing existing records.');
        }
    }

    private function synchronizeUpdatedAtFromLogs(): void
    {
        DB::table('tiket_perbaikan as tickets')
            ->where('tickets.deskripsi', 'like', '%'.self::MARKER.'%')
            ->update([
                'updated_at' => DB::raw('(
                    SELECT MAX(logs.created_at)
                    FROM log_data_tiket_perbaikan AS logs
                    WHERE logs.tiket_id = tickets.id
                )'),
            ]);

        DB::table('pengajuan_barang as requests')
            ->where('requests.alasan', 'like', '%'.self::MARKER.'%')
            ->update([
                'updated_at' => DB::raw('(
                    SELECT MAX(logs.created_at)
                    FROM log_data_pengajuan_barang AS logs
                    WHERE logs.pengajuan_id = requests.id
                )'),
            ]);
    }

    private function synchronizeTechnicianActivities(): void
    {
        $technicians = User::role('teknisi')->orderBy('id')->get();
        $edi = User::query()->where('email', 'edi@iwima.edu')->firstOrFail();

        foreach ($technicians->values() as $technicianIndex => $technician) {
            $activities = DB::table('log_harian_teknisi')
                ->where('teknisi_id', $technician->id)
                ->where('deskripsi_kegiatan', 'like', '%'.self::MARKER.'%')
                ->orderBy('id')
                ->get();
            $assignments = DB::table('log_data_tiket_perbaikan as logs')
                ->join('tiket_perbaikan as tickets', 'tickets.id', '=', 'logs.tiket_id')
                ->where('logs.user_id', $technician->id)
                ->where('logs.kategori_log', 'Status')
                ->where('logs.data_baru', 'In Progress')
                ->where('tickets.deskripsi', 'like', '%'.self::MARKER.'%')
                ->orderBy('logs.id')
                ->limit(6)
                ->get(['tickets.id', 'tickets.created_at', 'tickets.ruangan_id']);

            foreach ($activities as $activityIndex => $activity) {
                $ticket = TiketPerbaikan::query()->findOrFail($assignments[$activityIndex]->id);
                $activityAt = Carbon::parse($assignments[$activityIndex]->created_at)->addDay()->setTime(14, 0);

                if ($activityAt->isFuture()) {
                    $activityAt = now()->subMinute();
                }

                DB::table('log_harian_teknisi')
                    ->where('id', $activity->id)
                    ->update([
                        'ruangan_id' => $assignments[$activityIndex]->ruangan_id,
                        'tanggal' => $activityAt->toDateString(),
                        'deskripsi_kegiatan' => self::MARKER.' Pemeriksaan lanjutan dan pencatatan hasil penanganan '.$ticket->kode_tiket.'; pengecekan koneksi, kondisi perangkat, dan uji fungsi setelah tindakan teknis.',
                        'created_at' => $activityAt,
                        'updated_at' => $activityAt,
                    ]);

                $petugasIds = $this->petugasIdsForActivity($technicians, $technicianIndex, $activityIndex, $edi);

                DB::table('kegiatan_petugas')->where('kegiatan_id', $activity->id)->delete();
                DB::table('kegiatan_petugas')->insert(array_map(
                    fn (int $petugasId): array => [
                        'kegiatan_id' => $activity->id,
                        'petugas_id' => $petugasId,
                        'created_at' => $activityAt,
                        'updated_at' => $activityAt,
                    ],
                    $petugasIds,
                ));
            }
        }
    }

    private function synchronizeReviewerMessages(): void
    {
        $reviewAdmin = User::role('admin')->where('email', '!=', 'edi@iwima.edu')->orderBy('id')->first();
        $superAdmin = User::role('super_admin')->orderBy('id')->first();

        foreach ([1 => $reviewAdmin, 2 => $superAdmin] as $applicantIndex => $reviewer) {
            if (! $reviewer) {
                continue;
            }

            $applicant = User::role('pemohon')->orderBy('id')->skip($applicantIndex)->first();
            $ticket = DB::table('tiket_perbaikan')
                ->where('user_id', $applicant?->id)
                ->where('deskripsi', 'like', '%'.self::MARKER.'%')
                ->first();

            if (! $ticket || DB::table('log_data_tiket_perbaikan')
                ->where('tiket_id', $ticket->id)
                ->where('user_id', $reviewer->id)
                ->where('kategori_log', 'Chat')
                ->exists()) {
                continue;
            }

            $message = $applicantIndex === 1
                ? 'Saya ikut memantau tindak lanjut layanan. Teknisi yang bertugas akan mengabari hasil pemeriksaan melalui tiket ini.'
                : 'Catatan supervisi: mohon pastikan hasil uji fungsi dicatat dan pemohon menerima informasi penyelesaian.';

            $this->insertLog(
                'log_data_tiket_perbaikan',
                'tiket_id',
                (int) $ticket->id,
                (int) $reviewer->id,
                'Chat',
                null,
                null,
                $message,
                Carbon::parse($ticket->created_at)->addMinutes(40),
            );
        }
    }

    /**
     * @param  Collection<int, User>  $applicants
     * @param  Collection<int, User>  $technicians
     * @param  Collection<int, MasterRuangan>  $rooms
     * @return array<int, list<array{ticket_id: int, code: string, created_at: Carbon, room_id: int}>>
     */
    private function seedRepairTickets(Collection $applicants, Collection $technicians, User $reviewAdmin, User $superAdmin, Collection $rooms): array
    {
        $workloads = [];

        foreach ($applicants as $index => $applicant) {
            $outcome = ['open', 'in_progress', 'completed', 'rejected'][$index % 4];
            $technician = $technicians[$index % $technicians->count()];
            $room = $rooms[$index % $rooms->count()];
            $openedAt = $this->openedAt($index, $outcome);
            $details = $this->ticketDetails($index);
            $assignedAt = $openedAt->copy()->addHours(1);
            $inspectedAt = $assignedAt->copy()->addMinutes(40);
            $completedAt = $inspectedAt->copy()->addDays(1)->addHours(2);
            $rejectedAt = $inspectedAt->copy()->addHours(3);
            $latestAt = match ($outcome) {
                'open' => $openedAt->copy()->addMinutes(8),
                'in_progress' => $inspectedAt->copy()->addMinutes(15),
                'completed' => $completedAt,
                'rejected' => $rejectedAt,
            };

            $ticketId = DB::table('tiket_perbaikan')->insertGetId([
                'user_id' => $applicant->id,
                'ruangan_id' => $room->id,
                'keluhan' => $details['subject'],
                'kepemilikan' => 'Inventaris Kantor',
                'deskripsi' => self::MARKER.' '.$details['description'],
                'status' => $outcome === 'open' ? 'Open' : ($outcome === 'in_progress' ? 'In Progress' : 'Close'),
                'konfirmasi_status' => $outcome === 'completed' ? 'disetujui' : null,
                'konfirmasi_at' => $outcome === 'completed' ? $completedAt : null,
                'konfirmasi_catatan' => $outcome === 'completed' ? 'Perangkat berfungsi normal setelah pemeriksaan dan perbaikan.' : null,
                'created_at' => $openedAt,
                'updated_at' => $latestAt,
            ]);

            $ticket = TiketPerbaikan::query()->findOrFail($ticketId);
            $code = $ticket->kode_tiket;
            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $applicant->id, 'Status', null, 'Open', 'Tiket dibuat oleh pemohon untuk '.$room->nama_ruangan.'.', $openedAt);
            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $applicant->id, 'Chat', null, null, 'Mohon dibantu pemeriksaan perangkat di '.$room->nama_ruangan.'. Gejala dan waktu gangguan sudah saya jelaskan pada tiket.', $openedAt->copy()->addMinutes(8));

            if ($outcome === 'open') {
                continue;
            }

            $workloads[$technician->id][] = [
                'ticket_id' => (int) $ticketId,
                'code' => $code,
                'created_at' => $openedAt,
                'room_id' => (int) $room->id,
            ];

            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Chat', null, null, 'Tiket sudah kami terima. Saya akan memeriksa perangkat dan menghubungi Anda jika perlu informasi tambahan.', $openedAt->copy()->addMinutes(24));

            if ($index === 1) {
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $reviewAdmin->id, 'Chat', null, null, 'Saya ikut memantau tindak lanjut layanan. Teknisi yang bertugas akan mengabari hasil pemeriksaan melalui tiket ini.', $openedAt->copy()->addMinutes(40));
            }

            if ($index === 2) {
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $superAdmin->id, 'Chat', null, null, 'Catatan supervisi: mohon pastikan hasil uji fungsi dicatat dan pemohon menerima informasi penyelesaian.', $openedAt->copy()->addMinutes(40));
            }

            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Status', 'Open', 'In Progress', '[PENUGASAN] Ditangani '.$technician->name.'. Pemeriksaan dimulai di '.$room->nama_ruangan.'.', $assignedAt);
            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Update Data', 'Pemeriksaan awal', 'Diagnosis teknisi', '[PEMERIKSAAN] '.$details['diagnosis'], $inspectedAt);

            if ($outcome === 'in_progress') {
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $applicant->id, 'Chat', null, null, 'Terima kasih. Saya dapat memastikan perangkat dapat diperiksa pada jam kerja di ruangan tersebut.', $inspectedAt->copy()->addMinutes(15));

                continue;
            }

            if ($outcome === 'completed') {
                $confirmationRequestedAt = $completedAt->copy()->subMinutes(45);
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Chat', null, null, 'Perbaikan telah selesai. Perangkat sudah diuji kembali dan dapat digunakan. Mohon konfirmasi hasilnya.', $confirmationRequestedAt->copy()->subMinutes(5));
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Konfirmasi', 'In Progress', 'Menunggu Konfirmasi', '[MENUNGGU KONFIRMASI] Perbaikan selesai; pemohon diminta menguji perangkat.', $confirmationRequestedAt);
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $applicant->id, 'Chat', null, null, 'Perangkat sudah dapat digunakan kembali. Saya menyetujui penyelesaian tiket ini.', $completedAt->copy()->subMinutes(10));
                $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $applicant->id, 'Status', 'In Progress', 'Close', '[SELESAI] [KONFIRMASI PEMOHON] Perangkat sudah berfungsi normal setelah perbaikan.', $completedAt);

                continue;
            }

            $this->insertLog('log_data_tiket_perbaikan', 'tiket_id', (int) $ticketId, (int) $technician->id, 'Status', 'In Progress', 'Close', '[DITOLAK] Pemeriksaan menemukan kerusakan pada komponen utama yang tidak tersedia dan sudah tidak didukung. Pemohon disarankan mengajukan penggantian perangkat melalui jalur inventaris.', $rejectedAt);
        }

        return $workloads;
    }

    /**
     * @param  Collection<int, User>  $applicants
     * @param  Collection<int, MasterKategoriBarang>  $categories
     */
    private function seedItemRequests(Collection $applicants, User $edi, Collection $categories): void
    {
        $applicantIndex = 0;
        $categoryIndex = 0;

        foreach ($categories as $category) {
            $products = self::PRODUCTS_BY_CATEGORY[$category->nama_kategori]
                ?? self::PRODUCTS_BY_CATEGORY['Peralatan Teknisi'];

            foreach ($products as $scenarioIndex => $product) {
                $outcome = ['open', 'in_progress', 'completed', 'rejected'][$scenarioIndex];
                $applicant = $applicants[$applicantIndex % $applicants->count()];
                $applicantIndex++;
                $openedAt = $this->openedAt(($categoryIndex * 4) + $scenarioIndex, $outcome);
                $assignedAt = $openedAt->copy()->addHours(2);
                $inspectedAt = $assignedAt->copy()->addMinutes(35);
                $completedAt = $inspectedAt->copy()->addDays(2)->addHours(1);
                $rejectedAt = $inspectedAt->copy()->addHours(4);
                $latestAt = match ($outcome) {
                    'open' => $openedAt->copy()->addMinutes(12),
                    'in_progress' => $inspectedAt->copy()->addMinutes(20),
                    'completed' => $completedAt,
                    'rejected' => $rejectedAt,
                };
                $specification = $this->specificationFor($category->nama_kategori);
                $reason = $outcome === 'rejected'
                    ? 'Permintaan pengadaan '.$product.' untuk kebutuhan operasional unit; mohon telaah kesesuaian kategori dan spesifikasi sebelum diproses.'
                    : 'Diperlukan untuk mendukung kegiatan perkuliahan dan operasional unit '.$applicant->unit_bidang.'; perangkat yang tersedia sudah tidak mencukupi kebutuhan.';

                $requestId = DB::table('pengajuan_barang')->insertGetId([
                    'user_id' => $applicant->id,
                    'kategori_barang_id' => $category->id,
                    'nama_barang' => $product,
                    'spesifikasi_barang' => $specification,
                    'jumlah' => $scenarioIndex === 2 ? 2 : 1,
                    'alasan' => self::MARKER.' '.$reason,
                    'contoh_barang_url' => 'https://www.tokopedia.com/search?st=product&q='.rawurlencode($product),
                    'status' => $outcome === 'open' ? 'Open' : ($outcome === 'in_progress' ? 'In Progress' : 'Close'),
                    'konfirmasi_status' => $outcome === 'completed' ? 'disetujui' : null,
                    'konfirmasi_at' => $outcome === 'completed' ? $completedAt : null,
                    'konfirmasi_catatan' => $outcome === 'completed' ? 'Barang diterima dan jumlah serta spesifikasinya telah diperiksa pemohon.' : null,
                    'created_at' => $openedAt,
                    'updated_at' => $latestAt,
                ]);

                $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $applicant->id, 'Status', null, 'Open', 'Pengajuan dibuat dengan tautan contoh barang dan spesifikasi kebutuhan.', $openedAt);
                $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $applicant->id, 'Chat', null, null, 'Saya sudah melampirkan contoh barang dan spesifikasi. Mohon informasi jika diperlukan alternatif produk.', $openedAt->copy()->addMinutes(12));

                if ($outcome === 'open') {
                    $categoryIndex++;

                    continue;
                }

                $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Chat', null, null, 'Pengajuan diterima oleh Kepala Teknisi. Kami sedang memeriksa kecocokan kategori, spesifikasi, ketersediaan, dan kebutuhan unit.', $openedAt->copy()->addMinutes(30));
                $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Status', 'Open', 'In Progress', '[PENUGASAN] Pengajuan ditelaah oleh Edi Purwanto selaku Kepala Teknisi.', $assignedAt);
                $inspection = $outcome === 'rejected'
                    ? '[PEMERIKSAAN] Barang yang diminta tidak sesuai kategori '.$category->nama_kategori.'. Nama barang menunjukkan produk dari kategori lain; jumlah dan alasan belum cukup membuktikan kebutuhan barang dalam kategori terpilih.'
                    : '[PEMERIKSAAN] Kategori, nama barang, tautan contoh, spesifikasi, jumlah, dan alasan telah diperiksa. Kebutuhan dinilai relevan dengan kegiatan unit.';
                $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Update Data', 'Pemeriksaan awal', 'Hasil telaah Kepala Teknisi', $inspection, $inspectedAt);

                if ($outcome === 'in_progress') {
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $applicant->id, 'Chat', null, null, 'Baik, unit kami dapat menunggu proses pengadaan. Mohon kabari jika ada penyesuaian spesifikasi.', $inspectedAt->copy()->addMinutes(20));
                    $categoryIndex++;

                    continue;
                }

                if ($outcome === 'completed') {
                    $confirmationRequestedAt = $completedAt->copy()->subMinutes(50);
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Chat', null, null, 'Barang sudah diserahkan kepada unit pemohon. Silakan periksa jumlah, kondisi fisik, dan kesesuaian spesifikasi.', $confirmationRequestedAt->copy()->subMinutes(8));
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Konfirmasi', 'In Progress', 'Menunggu Konfirmasi', '[MENUNGGU KONFIRMASI] Barang diserahkan; pemohon diminta memeriksa penerimaan.', $confirmationRequestedAt);
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $applicant->id, 'Chat', null, null, 'Barang telah diterima dalam kondisi baik dan sesuai dengan spesifikasi serta jumlah yang diajukan.', $completedAt->copy()->subMinutes(10));
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $applicant->id, 'Status', 'In Progress', 'Close', '[SELESAI] [KONFIRMASI PEMOHON] Barang diterima dan sesuai kebutuhan unit.', $completedAt);
                } else {
                    $this->insertLog('log_data_pengajuan_barang', 'pengajuan_id', (int) $requestId, (int) $edi->id, 'Status', 'In Progress', 'Close', '[DITOLAK] Nama barang tidak sesuai kategori yang dipilih dan alasan pengajuan belum mendukung kebutuhan kategori tersebut. Silakan buat pengajuan baru dengan kategori dan deskripsi yang sesuai.', $rejectedAt);
                }

                $categoryIndex++;
            }
        }
    }

    /**
     * @param  Collection<int, User>  $technicians
     * @param  Collection<int, MasterRuangan>  $rooms
     * @param  array<int, list<array{ticket_id: int, code: string, created_at: Carbon, room_id: int}>>  $workloads
     */
    private function seedTechnicianActivities(Collection $technicians, Collection $rooms, array $workloads, User $edi): void
    {
        foreach ($technicians->values() as $technicianIndex => $technician) {
            $assignedTickets = $workloads[$technician->id] ?? [];

            if (count($assignedTickets) < 6) {
                throw new RuntimeException("Technician {$technician->name} does not have enough assigned tickets for activity records.");
            }

            foreach (array_slice($assignedTickets, 0, 6) as $activityIndex => $ticket) {
                $activityAt = $ticket['created_at']->copy()->addDay()->setTime(14, 0);

                if ($activityAt->isFuture()) {
                    $activityAt = $ticket['created_at']->copy()->setTime(14, 0);
                }

                $activityId = DB::table('log_harian_teknisi')->insertGetId([
                    'teknisi_id' => $technician->id,
                    'ruangan_id' => $ticket['room_id'] ?: $rooms[0]->id,
                    'tanggal' => $activityAt->toDateString(),
                    'deskripsi_kegiatan' => self::MARKER.' Pemeriksaan lanjutan dan pencatatan hasil penanganan '.$ticket['code'].'; pengecekan koneksi, kondisi perangkat, dan uji fungsi setelah tindakan teknis.',
                    'created_at' => $activityAt,
                    'updated_at' => $activityAt,
                ]);

                $petugasIds = $this->petugasIdsForActivity($technicians, $technicianIndex, $activityIndex, $edi);

                DB::table('kegiatan_petugas')->insert(array_map(
                    fn (int $petugasId): array => [
                        'kegiatan_id' => $activityId,
                        'petugas_id' => $petugasId,
                        'created_at' => $activityAt,
                        'updated_at' => $activityAt,
                    ],
                    $petugasIds,
                ));
            }
        }
    }

    /**
     * @param  Collection<int, User>  $technicians
     * @return list<int>
     */
    private function petugasIdsForActivity(Collection $technicians, int $technicianIndex, int $activityIndex, User $edi): array
    {
        $partnerIndexesByTechnician = [
            [1, 2, 2, 1, 2, 1],
            [0, 2, 0, 2, 0, 2],
            [0, 1, 0, 1, 0, 1],
        ];
        $partnerIndex = $partnerIndexesByTechnician[$technicianIndex][$activityIndex % 6];
        $petugasIds = [
            $technicians->values()->get($technicianIndex)->id,
            $technicians->values()->get($partnerIndex)->id,
        ];

        if (($activityIndex + 1) % 3 === 0) {
            $petugasIds[] = $edi->id;
        }

        return $petugasIds;
    }

    /**
     * @return array{subject: string, description: string, diagnosis: string}
     */
    private function ticketDetails(int $index): array
    {
        $cases = [
            ['subject' => 'Komputer ruang teori tidak dapat masuk ke jaringan kampus', 'description' => 'Komputer menyala dan dapat digunakan secara lokal, tetapi tidak memperoleh alamat IP saat terhubung ke jaringan kabel. Gangguan terjadi ketika kelas dimulai.', 'diagnosis' => 'Port jaringan pada komputer normal. Pemeriksaan awal menemukan konektor patch cord longgar; port switch dan kabel diuji untuk memastikan kestabilan koneksi.'],
            ['subject' => 'Laptop dosen cepat panas dan mati saat menjalankan aplikasi', 'description' => 'Laptop mengalami peningkatan suhu dan mati sendiri setelah digunakan untuk rapat daring serta membuka beberapa aplikasi perkuliahan.', 'diagnosis' => 'Saluran udara pendingin tertutup debu dan kipas berputar tidak stabil. Tim membersihkan ventilasi, menguji suhu, lalu menjadwalkan pemantauan beban.'],
            ['subject' => 'Printer unit tidak menarik kertas dari baki utama', 'description' => 'Printer menampilkan indikator kertas tetapi lembar tidak tertarik dari baki utama. Kondisi terjadi pada beberapa jenis kertas yang biasa digunakan unit.', 'diagnosis' => 'Roller penarik aus dan sensor baki membaca posisi kertas secara tidak konsisten. Pembersihan serta uji cetak diperlukan untuk memastikan hasil.'],
            ['subject' => 'Proyektor ruang kelas menampilkan gambar berkedip', 'description' => 'Tampilan proyektor berkedip ketika laptop pengajar tersambung melalui HDMI, sementara suara dari laptop tetap terdengar normal.', 'diagnosis' => 'Sumber gangguan berada pada konektor dan jalur HDMI. Teknisi memeriksa kabel, resolusi keluaran, dan kestabilan port proyektor.'],
            ['subject' => 'Access point ruang kerja sering memutus koneksi Wi-Fi', 'description' => 'Beberapa perangkat kehilangan koneksi secara bersamaan pada jam kerja, kemudian dapat terhubung kembali beberapa menit kemudian.', 'diagnosis' => 'Log access point menunjukkan kanal radio padat. Pemeriksaan meliputi daya PoE, kualitas uplink, dan pemilihan kanal yang lebih sesuai.'],
            ['subject' => 'Monitor ruang administrasi menampilkan garis horizontal', 'description' => 'Monitor menampilkan garis horizontal setelah digunakan beberapa jam. Kabel daya dan kabel sinyal sudah dicoba pasang ulang.', 'diagnosis' => 'Gangguan tetap muncul pada sumber video lain. Pemeriksaan berfokus pada panel monitor dan adaptor daya untuk menentukan kelayakan perbaikan.'],
            ['subject' => 'Komputer laboratorium gagal menyelesaikan proses boot', 'description' => 'Komputer berhenti pada layar logo dan tidak masuk ke sistem operasi setelah pemadaman listrik singkat di gedung.', 'diagnosis' => 'Pemeriksaan menunjukkan urutan boot berubah dan media penyimpanan tidak terbaca konsisten. Data pengguna diamankan sebelum uji komponen.'],
            ['subject' => 'Kamera konferensi tidak terdeteksi pada komputer rapat', 'description' => 'Kamera USB tidak muncul pada aplikasi konferensi meskipun indikator daya menyala. Mikrofon internal perangkat tetap terdeteksi.', 'diagnosis' => 'Perangkat terdeteksi pada port USB lain. Teknisi memperbarui driver, memeriksa kebijakan akses kamera, dan melakukan uji panggilan.'],
        ];

        return $cases[$index % count($cases)];
    }

    private function openedAt(int $index, string $outcome): Carbon
    {
        $daysAgo = match ($outcome) {
            'open' => $index % 36,
            'in_progress' => 1 + ($index % 35),
            'completed' => 4 + ($index % 32),
            'rejected' => 3 + ($index % 33),
        };

        $openedAt = now()->subDays($daysAgo)->setTime(9 + ($index % 7), ($index * 7) % 60);

        return $openedAt->isFuture() ? now()->subMinute() : $openedAt;
    }

    private function insertLog(
        string $table,
        string $foreignKey,
        int $recordId,
        int $actorId,
        string $category,
        ?string $oldValue,
        ?string $newValue,
        string $description,
        Carbon $timestamp,
    ): void {
        DB::table($table)->insert([
            $foreignKey => $recordId,
            'user_id' => $actorId,
            'kategori_log' => $category,
            'data_lama' => $oldValue,
            'data_baru' => $newValue,
            'keterangan' => $description,
            'created_at' => $timestamp,
        ]);
    }

    private function specificationFor(string $category): string
    {
        return match ($category) {
            'Komputer', 'Laptop' => 'Garansi resmi minimal 1 tahun, perangkat baru, kompatibel dengan aplikasi perkuliahan, dan dapat dikelola unit TI kampus.',
            'Komponen Komputer', 'Komponen Laptop' => 'Komponen baru dengan spesifikasi dan antarmuka yang kompatibel dengan perangkat inventaris yang digunakan.',
            'Monitor' => 'Ukuran 23–24 inci, resolusi Full HD, panel IPS, input HDMI, dan garansi resmi.',
            'Proyektor', 'Perangkat Presentasi' => 'Kecerahan minimal 3.000 lumen, input HDMI, kompatibel dengan laptop kampus, dan disertai garansi resmi.',
            'Perangkat Jaringan', 'Aksesori Jaringan' => 'Mendukung Gigabit Ethernet, standar jaringan yang digunakan kampus, dan dapat ditata pada infrastruktur yang tersedia.',
            'Printer', 'Scanner' => 'Mendukung kebutuhan administrasi unit, tersedia dukungan driver, suku cadang, dan garansi resmi.',
            'Suku Cadang Printer', 'Bahan Habis Pakai Printer' => 'Harus cocok dengan model printer yang tercatat pada inventaris dan menggunakan produk resmi agar hasil cetak stabil.',
            'Peralatan Infrastruktur IT' => 'Sesuai kapasitas rak, kelistrikan, pendinginan, dan tata kabel ruang perangkat kampus.',
            'Peralatan Teknisi', 'Tools Teknisi' => 'Layak untuk pemeriksaan perangkat kampus, memiliki rentang pengukuran yang sesuai, serta disertai petunjuk penggunaan.',
            'Perangkat Audio', 'Perangkat Video' => 'Kompatibel dengan komputer ruang rapat, koneksi USB atau HDMI standar, dan mendukung kegiatan rapat atau pembelajaran.',
            'Aksesori Komputer', 'Periferal Komputer' => 'Kompatibel dengan perangkat kantor/laboratorium dan mendukung penggunaan bersama tanpa instalasi khusus.',
            'Server' => 'Prosesor kelas server, memori dapat ditingkatkan, penyimpanan redundant, dukungan garansi on-site, dan kompatibel dengan rak yang tersedia.',
            'Penyimpanan Data' => 'Kapasitas dan antarmuka sesuai kebutuhan pencadangan, mendukung redundansi data, dan tersedia dukungan garansi.',
            'CCTV' => 'Kompatibel dengan sistem perekam yang berjalan, resolusi minimal 4 MP, mendukung PoE, dan memiliki garansi resmi.',
            'Perangkat Keamanan IT' => 'Mendukung firewall/VPN, pembaruan keamanan resmi, kapasitas sesuai jumlah perangkat, serta dukungan konfigurasi terpusat.',
            default => 'Spesifikasi sesuai kebutuhan operasional unit dan kompatibel dengan infrastruktur kampus.',
        };
    }
}
