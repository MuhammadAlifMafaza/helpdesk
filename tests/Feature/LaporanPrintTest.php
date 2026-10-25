<?php

namespace Tests\Feature;

use App\Models\Modules\Teknisi\Models\KegiatanTeknisi;
use App\Models\User;
use App\Services\Laporan\LaporanExportService;
use App\Services\Laporan\Pdf\LaporanKegiatanPdf;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class LaporanPrintTest extends TestCase
{
    private User $staff;

    private User $pemohon;

    protected function setUp(): void
    {
        parent::setUp();

        config([
            'database.default' => 'mysql',
            'database.connections.mysql.database' => 'helpdesk_dev',
            'queue.default' => 'sync',
        ]);

        DB::purge('mysql');
        DB::reconnect('mysql');

        foreach (['admin', 'pemohon'] as $role) {
            Role::findOrCreate($role, 'web');
        }

        $this->staff = User::create([
            'name' => 'Admin Uji Cetak',
            'email' => 'admin@uji-cetak.test',
            'password' => bcrypt('password'),
        ]);
        $this->staff->syncRoles(['admin']);

        $this->pemohon = User::create([
            'name' => 'Pemohon Uji Cetak',
            'email' => 'pemohon@uji-cetak.test',
            'password' => bcrypt('password'),
        ]);
        $this->pemohon->syncRoles(['pemohon']);
    }

    protected function tearDown(): void
    {
        $userIds = User::where('email', 'like', '%@uji-cetak.test')->pluck('id');

        DB::table('model_has_roles')
            ->whereIn('model_id', $userIds)
            ->where('model_type', User::class)
            ->delete();

        User::whereIn('id', $userIds)->forceDelete();

        parent::tearDown();
    }

    /**
     * Payload contoh dengan struktur identik hasil preparePrintData()
     * exporter LaporanKegiatanPdf (records kosong → cabang @empty).
     */
    private function payloadCetak(): array
    {
        return [
            'title' => 'LAPORAN KEGIATAN TEKNISI',
            'documentNumber' => 'No. 005/IWIMA/KTPI-P3SDI/0426',
            'documentCode' => '1FM-01.07.16/R0',
            'periode' => '01-10-2026 - 25-10-2026',
            'printedBy' => 'Admin Uji Cetak',
            'printDate' => now()->translatedFormat('d F Y H:i'),
            'records' => collect(),
            'signatures' => [
                ['title' => 'Ka. Bidang Teknisi & Perawatan Infrastruktur', 'name' => 'Edi Purwanto, S.Kom'],
                ['title' => 'Ka. UPT Laboratorium Komputer & Bahasa', 'name' => 'Wachid Darmawan, M.Kom'],
            ],
        ];
    }

    public function test_tamu_dialihkan_ke_halaman_login(): void
    {
        $this->get('/laporan/cetak')->assertRedirect('/login');
    }

    public function test_pemohon_dialihkan_ke_halaman_sendiri(): void
    {
        $this->actingAs($this->pemohon)
            ->get('/laporan/cetak')
            ->assertRedirect($this->pemohon->homeUrl());
    }

    public function test_tanpa_payload_dialihkan_ke_halaman_sendiri(): void
    {
        $this->actingAs($this->staff)
            ->get('/laporan/cetak')
            ->assertRedirect($this->staff->homeUrl());
    }

    public function test_payload_valid_merender_halaman_cetak(): void
    {
        $this->actingAs($this->staff)
            ->withSession(['laporan.print' => [
                'view' => 'laporan.print.kegiatan',
                'data' => $this->payloadCetak(),
            ]])
            ->get('/laporan/cetak')
            ->assertOk()
            ->assertSee('LAPORAN KEGIATAN TEKNISI')
            ->assertSee('Tidak ada kegiatan pada periode ini.')
            ->assertSee('window.print', false);
    }

    public function test_service_print_menyimpan_payload_dan_url_relatif(): void
    {
        $url = app(LaporanExportService::class)->print(
            query: KegiatanTeknisi::query(),
            exportClass: LaporanKegiatanPdf::class,
            periode: 'Periode Uji Cetak',
        );

        // URL relatif: tidak boleh memakai APP_URL absolut.
        $this->assertSame('/laporan/cetak', $url);

        $this->assertSame('laporan.print.kegiatan', session('laporan.print.view'));
        $this->assertSame('Periode Uji Cetak', session('laporan.print.data.periode'));
    }
}
