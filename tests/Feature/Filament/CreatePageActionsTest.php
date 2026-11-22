<?php

namespace Tests\Feature\Filament;

use App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\Pages\CreateLogPengajuanBarang as CreatePemohonLogPengajuanBarang;
use App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\Pages\CreateLogTiketPerbaikan as CreatePemohonLogTiketPerbaikan;
use App\Filament\Pemohon\Resources\Service\PengajuanBarangs\Pages\CreatePengajuanBarang as CreatePemohonPengajuanBarang;
use App\Filament\Pemohon\Resources\Service\TiketPerbaikans\Pages\CreateTiketPerbaikan as CreatePemohonTiketPerbaikan;
use App\Filament\Resources\KegiatanTeknisi\Pages\CreateKegiatanTeknisi;
use App\Filament\Resources\Laporan\LaporanKegiatans\Pages\CreateLaporanKegiatan;
use App\Filament\Resources\Laporan\LaporanPerbaikans\Pages\CreateLaporanPerbaikan;
use App\Filament\Resources\Laporan\LaporanPermintaanBarangs\Pages\CreateLaporanPermintaanBarang;
use App\Filament\Resources\LogPengajuanBarang\Pages\CreateLogPengajuanBarang;
use App\Filament\Resources\LogPerbaikans\Pages\CreateLogPerbaikan;
use App\Filament\Resources\Master\MasterKategoriBarang\Pages\CreateMasterKategoriBarang;
use App\Filament\Resources\Master\MasterRuangan\Pages\CreateMasterRuangan;
use App\Filament\Resources\PengajuanBarangs\Pages\CreatePengajuanBarang;
use App\Filament\Resources\TicketServices\Pages\CreateTicketService;
use App\Filament\Resources\Users\Pages\CreateUser;
use Illuminate\Support\Facades\Route;
use PHPUnit\Framework\Attributes\DataProvider;
use Tests\TestCase;

class CreatePageActionsTest extends TestCase
{
    /** @return array<string, array{class-string}> */
    public static function createPages(): array
    {
        return [
            'admin user' => [CreateUser::class],
            'admin ticket' => [CreateTicketService::class],
            'admin technician activity' => [CreateKegiatanTeknisi::class],
            'admin room' => [CreateMasterRuangan::class],
            'admin item category' => [CreateMasterKategoriBarang::class],
            'admin damage log' => [CreateLogPerbaikan::class],
            'admin item request log' => [CreateLogPengajuanBarang::class],
            'admin repair report' => [CreateLaporanPerbaikan::class],
            'admin activity report' => [CreateLaporanKegiatan::class],
            'admin item request report' => [CreateLaporanPermintaanBarang::class],
            'admin item request' => [CreatePengajuanBarang::class],
            'pemohon item request' => [CreatePemohonPengajuanBarang::class],
            'pemohon repair ticket' => [CreatePemohonTiketPerbaikan::class],
            'pemohon repair log' => [CreatePemohonLogTiketPerbaikan::class],
            'pemohon item request log' => [CreatePemohonLogPengajuanBarang::class],
        ];
    }

    #[DataProvider('createPages')]
    public function test_create_page_does_not_offer_create_another_action(string $createPageClass): void
    {
        $page = app($createPageClass);

        $this->assertFalse($page->canCreateAnother());
    }

    public function test_pengajuan_barang_create_routes_remain_registered_for_both_panels(): void
    {
        $this->assertTrue(Route::has('filament.admin.resources.pengajuan-barang.create'));
        $this->assertTrue(Route::has('filament.pemohon.resources.pengajuan-barang.create'));
    }
}
