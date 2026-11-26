<?php

namespace Tests\Feature;

use Database\Seeders\LoadTestSeeder;
use Database\Seeders\UserSeeder;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use RuntimeException;
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
        config()->set('load_test.master_ruangan_count', 30);
        config()->set('load_test.master_kategori_count', 23);

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
            $table->boolean('is_active')->default(true);
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

    public function test_load_test_seeder_creates_curated_records_idempotently(): void
    {
        DB::table('master_ruangan')->insert([
            'nama_ruangan' => 'LAB 1',
            'nama_gedung' => 'Gedung D Lt. 2',
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        DB::table('master_kategori_barang')->insert([
            'nama_kategori' => 'Komputer & Laptop',
            'deskripsi' => 'Kategori lama gabungan.',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $this->seed(LoadTestSeeder::class);
        $this->seed(LoadTestSeeder::class);

        $this->assertDatabaseCount('users', 57);
        $this->assertDatabaseCount('roles', 4);
        $this->assertDatabaseCount('model_has_roles', 57);
        $this->assertDatabaseCount('master_ruangan', 31);
        $this->assertDatabaseCount('master_kategori_barang', 24);
        $this->assertSame(30, DB::table('master_ruangan')->where('is_active', true)->count());
        $this->assertSame(23, DB::table('master_kategori_barang')->where('is_active', true)->count());
        $this->assertDatabaseHas('master_ruangan', ['nama_ruangan' => 'LAB 1', 'is_active' => false]);
        $this->assertDatabaseHas('master_kategori_barang', ['nama_kategori' => 'Komputer & Laptop', 'is_active' => false]);
        $this->assertDatabaseHas('master_ruangan', ['nama_ruangan' => 'Ruang Teori B 1.2', 'nama_gedung' => 'Gedung B Lt. 1', 'is_active' => true]);

        $this->assertSeededAccount('superadmin@iwima.edu', 'superadmin', 'super_admin', 'SuperAdmin_123');
        $this->assertSeededAccount('edi@iwima.edu', 'edi', 'admin', 'password123');
        $this->assertSeededAccount('fithnan@iwima.edu', 'fithnan', 'teknisi', 'Teknisi_123');
        $this->assertSeededAccount('fajar.ano@iwima.edu', 'fajar.ano', 'teknisi', 'Teknisi_123');
        $this->assertSame(17, DB::table('users')->where('unit_bidang', 'Dosen')->orWhere('unit_bidang', 'Karyawan')->count());
        $this->assertSame(0, DB::table('users')->where('email', 'like', '%@loadtest.invalid')->count());
    }

    public function test_seeder_removes_only_unreferenced_legacy_load_test_accounts(): void
    {
        DB::table('users')->insert([
            'name' => 'Synthetic Old Account',
            'email' => 'synthetic-old@loadtest.invalid',
            'login_id' => 'synthetic-old',
            'password' => Hash::make('password123'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        DB::table('users')->insert([
            'name' => 'Unrelated Account',
            'email' => 'unrelated@example.com',
            'login_id' => 'unrelated',
            'password' => Hash::make('password123'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $this->seed(LoadTestSeeder::class);

        $this->assertDatabaseMissing('users', ['email' => 'synthetic-old@loadtest.invalid']);
        $this->assertDatabaseHas('users', ['email' => 'unrelated@example.com']);
        $this->assertDatabaseCount('users', 58);
    }

    public function test_seeder_refuses_to_remove_legacy_accounts_with_service_history(): void
    {
        $this->seed(LoadTestSeeder::class);
        DB::table('users')->insert([
            'name' => 'Referenced Synthetic Account',
            'email' => 'referenced@loadtest.invalid',
            'login_id' => 'referenced',
            'password' => Hash::make('password123'),
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        $legacyUserId = (int) DB::table('users')->where('email', 'referenced@loadtest.invalid')->value('id');

        Schema::create('tiket_perbaikan', function (Blueprint $table): void {
            $table->id();
            $table->unsignedInteger('user_id');
        });
        DB::table('tiket_perbaikan')->insert(['user_id' => $legacyUserId]);

        try {
            $this->seed(UserSeeder::class);
            $this->fail('Expected referenced load-test account cleanup to be refused.');
        } catch (RuntimeException $exception) {
            $this->assertStringContainsString('tiket_perbaikan', $exception->getMessage());
        }

        $this->assertDatabaseHas('users', ['email' => 'referenced@loadtest.invalid']);
    }

    private function assertSeededAccount(string $email, string $loginId, string $role, string $password): void
    {
        $user = DB::table('users')->where('email', $email)->first();

        $this->assertNotNull($user);
        $this->assertSame($loginId, $user->login_id);
        $this->assertTrue(Hash::check($password, $user->password));
        $this->assertDatabaseHas('model_has_roles', [
            'model_id' => $user->id,
            'role_id' => DB::table('roles')->where('name', $role)->value('id'),
        ]);
    }
}
