<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::table('kegiatan_petugas', function (Blueprint $table): void {
            $table->unsignedInteger('kegiatan_id')->change();
            $table->unsignedInteger('petugas_id')->change();

            $table->foreign('kegiatan_id', 'kegiatan_petugas_kegiatan_id_foreign')
                ->references('id')
                ->on('log_harian_teknisi')
                ->cascadeOnDelete();

            $table->foreign('petugas_id', 'kegiatan_petugas_petugas_id_foreign')
                ->references('id')
                ->on('users')
                ->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('kegiatan_petugas', function (Blueprint $table): void {
            $table->dropForeign('kegiatan_petugas_kegiatan_id_foreign');
            $table->dropForeign('kegiatan_petugas_petugas_id_foreign');

            $table->integer('kegiatan_id')->change();
            $table->integer('petugas_id')->change();
        });
    }
};
