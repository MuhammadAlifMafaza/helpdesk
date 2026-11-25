<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Create the legacy user table when it has not been imported already.
     */
    public function up(): void
    {
        if (Schema::hasTable('users')) {
            return;
        }

        Schema::create('users', function (Blueprint $table): void {
            $table->increments('id');
            $table->string('login_id', 100)->nullable()->unique();
            $table->string('name', 100);
            $table->string('email', 100)->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->enum('role', ['pemohon', 'teknisi', 'admin'])->default('pemohon')->nullable();
            $table->rememberToken();
            $table->string('unit_bidang', 100)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // The table can predate this migration when a database dump is imported.
    }
};
