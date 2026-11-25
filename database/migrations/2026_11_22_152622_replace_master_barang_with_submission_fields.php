<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('pengajuan_barang', function (Blueprint $table): void {
            $table->foreignId('kategori_barang_id')
                ->nullable()
                ->after('user_id')
                ->constrained('master_kategori_barang')
                ->restrictOnDelete()
                ->cascadeOnUpdate();

            $table->string('contoh_barang_path', 1024)->nullable();
            $table->string('contoh_barang_url', 2048)->nullable();
        });

        DB::table('pengajuan_barang')
            ->whereNotNull('barang_id')
            ->update([
                'kategori_barang_id' => DB::table('master_barang')
                    ->select('kategori_barang_id')
                    ->whereColumn('master_barang.id', 'pengajuan_barang.barang_id'),
            ]);

        Schema::table('pengajuan_barang', function (Blueprint $table): void {
            $table->dropForeign(['barang_id']);
            $table->dropIndex('pengajuan_barang_barang_id_index');
            $table->dropColumn('barang_id');
        });

        Schema::dropIfExists('master_barang');
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::create('master_barang', function (Blueprint $table): void {
            $table->id();
            $table->foreignId('kategori_barang_id')
                ->constrained('master_kategori_barang')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
            $table->string('nama_barang', 255);
            $table->text('keterangan')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes();
            $table->index(['kategori_barang_id', 'is_active']);
            $table->index('nama_barang');
        });

        Schema::table('pengajuan_barang', function (Blueprint $table): void {
            $table->foreignId('barang_id')
                ->nullable()
                ->after('user_id')
                ->constrained('master_barang')
                ->restrictOnDelete()
                ->cascadeOnUpdate();
        });

        DB::table('pengajuan_barang')
            ->select(['id', 'kategori_barang_id', 'nama_barang'])
            ->whereNotNull('kategori_barang_id')
            ->orderBy('id')
            ->get()
            ->each(function (object $pengajuan): void {
                $barangId = DB::table('master_barang')->insertGetId([
                    'kategori_barang_id' => $pengajuan->kategori_barang_id,
                    'nama_barang' => $pengajuan->nama_barang,
                    'is_active' => true,
                    'created_at' => now(),
                    'updated_at' => now(),
                ]);

                DB::table('pengajuan_barang')
                    ->where('id', $pengajuan->id)
                    ->update(['barang_id' => $barangId]);
            });

        Schema::table('pengajuan_barang', function (Blueprint $table): void {
            $table->dropForeign(['kategori_barang_id']);
            $table->dropColumn([
                'kategori_barang_id',
                'contoh_barang_path',
                'contoh_barang_url',
            ]);

            $table->index('barang_id');
        });
    }
};
