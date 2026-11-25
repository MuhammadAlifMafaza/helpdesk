<?php

namespace Tests\Feature;

use Database\Seeders\LoadTestSeeder;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use Tests\TestCase;

class LoadTestSeederTest extends TestCase
{
    private string $testDatabaseDirectory;

    protected function setUp(): void
    {
        parent::setUp();

        $this->testDatabaseDirectory = sys_get_temp_dir().DIRECTORY_SEPARATOR.'helpdesk-loadtest-'.uniqid();
        mkdir($this->testDatabaseDirectory);
        $testDatabasePath = $this->testDatabaseDirectory.DIRECTORY_SEPARATOR.'helpdesk_loadtest';
        touch($testDatabasePath);
        config()->set('database.connections.sqlite.database', $testDatabasePath);
        DB::purge('sqlite');
        config()->set('load_test.applicant_email', null);
        config()->set('load_test.applicant_password', null);
        config()->set('load_test.admin_email', null);
        config()->set('load_test.admin_password', null);
        config()->set('load_test.generated_password', 'local-load-test-password');
        config()->set('load_test.users', [
            'pemohon' => 2,
            'teknisi' => 1,
            'admin' => 1,
            'super_admin' => 1,
            'chunk_size' => 2,
        ]);
        config()->set('load_test.master_ruangan_count', 4);
        config()->set('load_test.master_kategori_count', 3);

        Schema::create('users', function (Blueprint $table): void {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('login_id')->nullable()->unique();
            $table->string('password');
            $table->string('role')->nullable();
            $table->string('unit_bidang')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->timestamps();
        });

        Schema::create('roles', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('guard_name');
            $table->timestamps();
            $table->unique(['name', 'guard_name']);
        });

        Schema::create('model_has_roles', function (Blueprint $table): void {
            $table->unsignedBigInteger('role_id');
            $table->string('model_type');
            $table->unsignedBigInteger('model_id');
            $table->primary(['role_id', 'model_id', 'model_type']);
        });

        Schema::create('master_ruangan', function (Blueprint $table): void {
            $table->increments('id');
            $table->string('nama_ruangan');
            $table->string('nama_gedung');
            $table->timestamps();
        });

        Schema::create('master_kategori_barang', function (Blueprint $table): void {
            $table->id();
            $table->string('nama_kategori');
            $table->text('deskripsi')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
            $table->softDeletes();
        });
    }

    protected function tearDown(): void
    {
        DB::disconnect('sqlite');
        unlink($this->testDatabaseDirectory.DIRECTORY_SEPARATOR.'helpdesk_loadtest');
        rmdir($this->testDatabaseDirectory);

        parent::tearDown();
    }

    public function test_load_test_seeder_creates_synthetic_records_idempotently(): void
    {
        $this->seed(LoadTestSeeder::class);
        $this->seed(LoadTestSeeder::class);

        $this->assertDatabaseCount('users', 5);
        $this->assertDatabaseCount('roles', 4);
        $this->assertDatabaseCount('model_has_roles', 5);
        $this->assertDatabaseCount('master_ruangan', 4);
        $this->assertDatabaseCount('master_kategori_barang', 3);
        $user = DB::table('users')->where('role', 'pemohon')->first();

        $this->assertSame(Str::slug($user->name), $user->login_id);
        $this->assertTrue(Hash::check('password123', $user->password));
    }

    public function test_load_test_seeder_uses_the_database_configured_by_the_environment(): void
    {
        config()->set('database.connections.sqlite.database', 'helpdesk_db');

        $this->seed(LoadTestSeeder::class);

        $this->assertDatabaseCount('users', 5);
    }
}
