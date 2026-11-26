<?php

namespace Tests\Feature;

use App\Models\Modules\Pengajuan\Models\LogPengajuan;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use Database\Seeders\HistoricalLoadTestServicesSeeder;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Tests\TestCase;

class HistoricalLoadTestServicesSeederTest extends TestCase
{
    private string $testDatabaseDirectory;

    protected function setUp(): void
    {
        parent::setUp();

        $this->testDatabaseDirectory = sys_get_temp_dir().DIRECTORY_SEPARATOR.'helpdesk-history-'.uniqid();
        mkdir($this->testDatabaseDirectory);
        $testDatabasePath = $this->testDatabaseDirectory.DIRECTORY_SEPARATOR.'helpdesk_history';
        touch($testDatabasePath);
        config()->set('database.connections.sqlite.database', $testDatabasePath);
        DB::purge('sqlite');

        Schema::create('users', function (Blueprint $table): void {
            $table->increments('id');
            $table->string('name');
            $table->string('email')->unique();
            $table->string('login_id')->nullable();
            $table->string('password');
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

        Schema::create('tiket_perbaikan', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->unsignedInteger('ruangan_id');
            $table->string('keluhan');
            $table->string('kepemilikan')->nullable();
            $table->text('deskripsi');
            $table->string('status')->nullable();
            $table->string('konfirmasi_status')->nullable();
            $table->timestamp('konfirmasi_at')->nullable();
            $table->text('konfirmasi_catatan')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('pengajuan_barang', function (Blueprint $table): void {
            $table->increments('id');
            $table->unsignedInteger('user_id');
            $table->unsignedBigInteger('kategori_barang_id')->nullable();
            $table->string('nama_barang');
            $table->text('spesifikasi_barang')->nullable();
            $table->unsignedInteger('jumlah')->default(1);
            $table->text('alasan')->nullable();
            $table->string('status')->nullable();
            $table->string('contoh_barang_path', 1024)->nullable();
            $table->string('contoh_barang_url', 2048)->nullable();
            $table->string('konfirmasi_status')->nullable();
            $table->timestamp('konfirmasi_at')->nullable();
            $table->text('konfirmasi_catatan')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });

        foreach (['log_data_tiket_perbaikan', 'log_data_pengajuan_barang'] as $tableName) {
            Schema::create($tableName, function (Blueprint $table): void {
                $table->increments('id');
                $table->unsignedInteger('tiket_id')->nullable();
                $table->unsignedInteger('pengajuan_id')->nullable();
                $table->unsignedInteger('user_id');
                $table->string('kategori_log');
                $table->string('data_lama')->nullable();
                $table->string('data_baru')->nullable();
                $table->text('keterangan')->nullable();
                $table->timestamp('created_at')->nullable();
            });
        }
    }

    protected function tearDown(): void
    {
        DB::disconnect('sqlite');
        unlink($this->testDatabaseDirectory.DIRECTORY_SEPARATOR.'helpdesk_history');
        rmdir($this->testDatabaseDirectory);

        parent::tearDown();
    }

    public function test_seeder_creates_historical_workflows_with_examples_and_is_idempotent(): void
    {
        $this->insertUserWithRole(1, 'Pemohon Uji', 'pemohon');
        $this->insertUserWithRole(2, 'Teknisi Uji', 'teknisi');
        DB::table('master_ruangan')->insert([
            'nama_ruangan' => 'Ruang Teori A 1.1',
            'nama_gedung' => 'Gedung A Lt. 1',
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);
        DB::table('master_kategori_barang')->insert([
            'nama_kategori' => 'Perangkat Jaringan',
            'is_active' => true,
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $this->seed(HistoricalLoadTestServicesSeeder::class);
        $this->seed(HistoricalLoadTestServicesSeeder::class);

        $this->assertDatabaseCount('tiket_perbaikan', 5);
        $this->assertDatabaseCount('pengajuan_barang', 5);
        $this->assertSame(1, DB::table('tiket_perbaikan')->where('status', 'Open')->count());
        $this->assertSame(1, DB::table('tiket_perbaikan')->where('status', 'In Progress')->count());
        $this->assertSame(3, DB::table('tiket_perbaikan')->where('status', 'Close')->count());
        $this->assertSame(1, DB::table('pengajuan_barang')->where('status', 'Open')->count());
        $this->assertSame(1, DB::table('pengajuan_barang')->where('status', 'In Progress')->count());
        $this->assertSame(3, DB::table('pengajuan_barang')->where('status', 'Close')->count());
        $this->assertSame(5, DB::table('pengajuan_barang')->whereNotNull('contoh_barang_url')->count());
        $this->assertSame(1, DB::table('log_data_tiket_perbaikan')->where('keterangan', 'like', '%[DITOLAK]%')->count());
        $this->assertSame(1, DB::table('log_data_pengajuan_barang')->where('keterangan', 'like', '%[DITOLAK]%')->count());

        $rejectedTicket = TiketPerbaikan::query()
            ->where('keluhan', 'like', 'LOADTEST-HISTORY-v1:%ditolak%')
            ->firstOrFail();
        $this->assertSame('Rejected', $rejectedTicket->status_outcome);

        $rejectedRequestLog = LogPengajuan::query()
            ->where('keterangan', 'like', '[DITOLAK]%')
            ->firstOrFail();
        $this->assertSame(LogPengajuan::EVENT_REJECT, $rejectedRequestLog->event_type);

        $oldestTicket = DB::table('tiket_perbaikan')->orderBy('created_at')->first();
        $this->assertTrue(Carbon::parse($oldestTicket->created_at)->lessThan(now()->subDays(62)));

        $ticketLogTimes = DB::table('log_data_tiket_perbaikan')
            ->where('tiket_id', $oldestTicket->id)
            ->orderBy('created_at')
            ->pluck('created_at');
        $this->assertSame($ticketLogTimes->sort()->values()->all(), $ticketLogTimes->values()->all());
    }

    private function insertUserWithRole(int $userId, string $name, string $role): void
    {
        DB::table('users')->insert([
            'id' => $userId,
            'name' => $name,
            'email' => $role.'@example.test',
            'login_id' => $role,
            'password' => 'test-password',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        $roleId = DB::table('roles')->insertGetId([
            'name' => $role,
            'guard_name' => 'web',
            'created_at' => now(),
            'updated_at' => now(),
        ]);

        DB::table('model_has_roles')->insert([
            'role_id' => $roleId,
            'model_type' => 'App\\Models\\User',
            'model_id' => $userId,
        ]);
    }
}
