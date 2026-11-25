<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Remove a field left over from the former item-master form.
     */
    public function up(): void
    {
        if (Schema::hasColumn('pengajuan_barang', 'deskripsi_barang')) {
            Schema::table('pengajuan_barang', function ($table): void {
                $table->dropColumn('deskripsi_barang');
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // The removed field is not restored because this migration also adopts imported schemas.
    }
};
