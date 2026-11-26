<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Create the legacy service tables before the migrations that evolve them.
     */
    public function up(): void
    {
        $coreTables = [
            'master_ruangan',
            'tiket_perbaikan',
            'pengajuan_barang',
            'log_data_tiket_perbaikan',
            'log_data_pengajuan_barang',
            'log_harian_teknisi',
        ];
        $existingTables = array_filter($coreTables, fn (string $table): bool => Schema::hasTable($table));

        if (count($existingTables) === count($coreTables)) {
            return;
        }

        if ($existingTables !== []) {
            throw new RuntimeException(
                'Helpdesk core schema is partially present. Restore the complete schema dump or reconcile these tables before migrating.'
            );
        }

        Schema::create('master_ruangan', function (Blueprint $table): void {
            $table->increments('id');
            $table->string('nama_ruangan', 100);
            $table->string('nama_gedung', 100);
            $table->timestamps();
        });

        Schema::create('tiket_perbaikan', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('ruangan_id');
            $table->string('keluhan', 255);
            $table->enum('kepemilikan', ['Inventaris Kantor', 'Pribadi', 'Lainnya'])
                ->default('Inventaris Kantor')
                ->nullable();
            $table->text('deskripsi');
            $table->enum('status', ['Open', 'In Progress', 'Close'])->default('Open')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('ruangan_id')->references('id')->on('master_ruangan');
            $table->index('status', 'idx_status');
            $table->index('created_at', 'idx_created_at');
        });

        Schema::create('pengajuan_barang', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->string('nama_barang', 255);
            $table->text('spesifikasi_barang')->nullable();
            $table->unsignedInteger('jumlah')->default(1);
            $table->text('alasan')->nullable();
            $table->enum('status', ['Open', 'In Progress', 'Close'])->default('Open')->nullable();
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('user_id')->references('id')->on('users');
            $table->index('status', 'pengajuan_barang_status_index');
            $table->index('created_at', 'pengajuan_barang_created_at_index');
        });

        Schema::create('log_data_tiket_perbaikan', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('tiket_id');
            $table->unsignedInteger('user_id');
            if (DB::getDriverName() === 'mysql') {
                $table->enum('kategori_log', ['Status', 'Chat', 'Update Data', 'Delete Data']);
            } else {
                $table->string('kategori_log', 30);
            }
            $table->string('data_lama', 255)->nullable();
            $table->string('data_baru', 255)->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();

            $table->foreign('tiket_id')->references('id')->on('tiket_perbaikan')->cascadeOnDelete();
            $table->foreign('user_id')->references('id')->on('users');
        });

        Schema::create('log_data_pengajuan_barang', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('pengajuan_id');
            $table->unsignedInteger('user_id');
            if (DB::getDriverName() === 'mysql') {
                $table->enum('kategori_log', ['Status', 'Chat', 'Update Data', 'Delete Data']);
            } else {
                $table->string('kategori_log', 30);
            }
            $table->string('data_lama', 255)->nullable();
            $table->string('data_baru', 255)->nullable();
            $table->text('keterangan')->nullable();
            $table->timestamp('created_at')->nullable()->useCurrent();

            $table->foreign('pengajuan_id')->references('id')->on('pengajuan_barang')->cascadeOnDelete();
            $table->foreign('user_id')->references('id')->on('users');
            $table->index(
                ['pengajuan_id', 'kategori_log', 'data_baru', 'created_at'],
                'log_pengajuan_status_lookup'
            );
        });

        Schema::create('log_harian_teknisi', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('teknisi_id');
            $table->unsignedInteger('ruangan_id')->nullable();
            $table->date('tanggal');
            $table->text('deskripsi_kegiatan');
            $table->timestamps();
            $table->softDeletes();

            $table->foreign('teknisi_id')->references('id')->on('users')->cascadeOnDelete();
            $table->foreign('ruangan_id')->references('id')->on('master_ruangan')->nullOnDelete();
            $table->index('tanggal');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // These legacy tables may have existed before this migration was added.
    }
};
