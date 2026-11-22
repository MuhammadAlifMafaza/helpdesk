<?php

namespace Tests\Feature;

use App\Filament\Resources\Master\MasterKategoriBarang\MasterKategoriBarangResource;
use App\Filament\Resources\Master\MasterKategoriBarang\Pages\ListMasterKategoriBarangs;
use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Livewire\Livewire;
use Tests\TestCase;

class MasterKategoriBarangTest extends TestCase
{
    use DatabaseTransactions;

    protected function setUp(): void
    {
        parent::setUp();
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
            $table->unsignedInteger('jumlah')->default(1);
            $table->text('alasan')->nullable();
            $table->string('status')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });
    }

    public function test_master_kategori_barang_resource_uses_correct_model(): void
    {
        $this->assertSame(MasterKategoriBarang::class, MasterKategoriBarangResource::getModel());
    }

    public function test_list_master_kategori_barangs_table_renders_successfully(): void
    {
        MasterKategoriBarang::create([
            'nama_kategori' => 'Kategori Render Test',
            'deskripsi' => 'Deskripsi Kategori',
            'is_active' => true,
        ]);

        Livewire::test(ListMasterKategoriBarangs::class)
            ->assertSuccessful()
            ->assertTableBulkActionHidden('forceDelete')
            ->filterTable('trashed', true)
            ->assertTableBulkActionVisible('forceDelete');
    }

    public function test_force_delete_bulk_action_prevents_deleting_kategori_used_by_pengajuan(): void
    {
        $kategori = MasterKategoriBarang::create([
            'nama_kategori' => 'Kategori With Barang',
            'is_active' => true,
        ]);

        DB::table('pengajuan_barang')->insert([
            'user_id' => 1,
            'kategori_barang_id' => $kategori->id,
            'nama_barang' => 'Barang Relasi Kategori',
            'jumlah' => 1,
            'status' => 'Open',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $kategori->delete();

        Livewire::test(ListMasterKategoriBarangs::class)
            ->filterTable('trashed', true)
            ->callTableBulkAction('forceDelete', [$kategori]);

        $this->assertDatabaseHas('master_kategori_barang', [
            'id' => $kategori->id,
        ]);
    }

    public function test_force_delete_bulk_action_deletes_kategori_without_pengajuan(): void
    {
        $kategori = MasterKategoriBarang::create([
            'nama_kategori' => 'Kategori Without Barang',
            'is_active' => true,
        ]);

        $kategori->delete();

        Livewire::test(ListMasterKategoriBarangs::class)
            ->filterTable('trashed', true)
            ->callTableBulkAction('forceDelete', [$kategori]);

        $this->assertDatabaseMissing('master_kategori_barang', [
            'id' => $kategori->id,
        ]);
    }
}
