<?php

namespace Tests\Feature;

use App\Events\HelpdeskActivityCreated;
use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Schema;
use Illuminate\Validation\ValidationException;
use Tests\TestCase;

class PengajuanBarangInputTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();

        Schema::create('users', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('email');
            $table->string('password');
            $table->string('role')->nullable();
        });

        Schema::create('master_kategori_barang', function (Blueprint $table): void {
            $table->id();
            $table->string('nama_kategori', 100);
            $table->text('deskripsi')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('pengajuan_barang', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('kategori_barang_id')->nullable();
            $table->string('nama_barang');
            $table->text('spesifikasi_barang')->nullable();
            $table->unsignedInteger('jumlah')->default(1);
            $table->text('alasan')->nullable();
            $table->string('status')->nullable();
            $table->string('konfirmasi_status', 30)->nullable();
            $table->timestamp('konfirmasi_at')->nullable();
            $table->text('konfirmasi_catatan')->nullable();
            $table->string('contoh_barang_path', 1024)->nullable();
            $table->string('contoh_barang_url', 2048)->nullable();
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('log_data_pengajuan_barang', function (Blueprint $table): void {
            $table->id();
            $table->unsignedBigInteger('pengajuan_id');
            $table->unsignedBigInteger('user_id');
            $table->string('kategori_log', 30);
            $table->string('data_lama')->nullable();
            $table->string('data_baru')->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamp('created_at')->nullable();
        });
    }

    public function test_pengajuan_menyimpan_nama_barang_kategori_dan_tautan_langsung(): void
    {
        Event::fake([HelpdeskActivityCreated::class]);

        $kategori = $this->buatKategori();
        $userId = $this->buatUser();

        $pengajuan = PengajuanBarang::create([
            'user_id' => $userId,
            'kategori_barang_id' => $kategori->id,
            'nama_barang' => 'Laptop untuk laboratorium',
            'jumlah' => 2,
            'alasan' => 'Perangkat lama tidak memadai.',
            'contoh_barang_url' => 'https://market.example.test/laptop',
        ]);

        $this->assertDatabaseHas('pengajuan_barang', [
            'id' => $pengajuan->id,
            'kategori_barang_id' => $kategori->id,
            'nama_barang' => 'Laptop untuk laboratorium',
            'contoh_barang_url' => 'https://market.example.test/laptop',
            'contoh_barang_path' => null,
        ]);
        $this->assertSame($kategori->id, $pengajuan->kategoriBarang->id);
    }

    public function test_pengajuan_menolak_tautan_dengan_skema_non_http(): void
    {
        Event::fake([HelpdeskActivityCreated::class]);

        $this->expectException(ValidationException::class);

        PengajuanBarang::create([
            'user_id' => $this->buatUser(),
            'kategori_barang_id' => $this->buatKategori()->id,
            'nama_barang' => 'Barang uji tautan',
            'jumlah' => 1,
            'alasan' => 'Pengujian validasi tautan.',
            'contoh_barang_url' => 'javascript:alert(1)',
        ]);
    }

    public function test_pengajuan_menolak_pengisian_gambar_dan_tautan_bersamaan(): void
    {
        Event::fake([HelpdeskActivityCreated::class]);

        $this->expectException(ValidationException::class);

        PengajuanBarang::create([
            'user_id' => $this->buatUser(),
            'kategori_barang_id' => $this->buatKategori()->id,
            'nama_barang' => 'Barang uji contoh ganda',
            'jumlah' => 1,
            'alasan' => 'Pengujian pilihan contoh barang.',
            'contoh_barang_path' => 'pengajuan-barang/contoh/contoh.png',
            'contoh_barang_url' => 'https://market.example.test/produk',
        ]);
    }

    private function buatKategori(): MasterKategoriBarang
    {
        return MasterKategoriBarang::create([
            'nama_kategori' => 'Kategori Pengajuan Input Test',
            'is_active' => true,
        ]);
    }

    private function buatUser(): int
    {
        return (int) DB::table('users')->insertGetId([
            'name' => 'Pemohon Pengajuan Input Test',
            'email' => 'pemohon-pengajuan-input-test@example.com',
            'password' => bcrypt('password'),
            'role' => 'pemohon',
        ]);
    }
}
