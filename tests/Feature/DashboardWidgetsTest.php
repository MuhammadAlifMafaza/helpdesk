<?php

namespace Tests\Feature;

use App\Filament\Pemohon\Widgets\AktivitasLayananChart;
use App\Filament\Pemohon\Widgets\TiketPerbaikanTerbaru;
use App\Filament\Widgets\Admin\AdminOverview;
use App\Filament\Widgets\Teknisi\TeknisiOverview;
use App\Filament\Widgets\Teknisi\TeknisiTiketAktif;
use App\Models\Modules\Pengajuan\Models\PengajuanBarang;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Models\User;
use App\Services\DashboardMetrics;
use Filament\Facades\Filament;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Livewire\Livewire;
use PHPUnit\Framework\Attributes\DataProvider;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class DashboardWidgetsTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutVite();
        Livewire::withoutLazyLoading();

        Schema::create('users', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
        (require database_path('migrations/2026_04_22_121933_create_permission_tables.php'))->up();
        (require database_path('migrations/2026_08_22_143652_create_notifications_table.php'))->up();

        foreach (['tiket_perbaikan', 'pengajuan_barang'] as $name) {
            Schema::create($name, function (Blueprint $table): void {
                $table->id();
                $table->unsignedBigInteger('user_id');
                $table->unsignedBigInteger('ruangan_id')->nullable();
                $table->string('keluhan')->nullable();
                $table->string('nama_barang')->nullable();
                $table->integer('jumlah')->default(1);
                $table->string('status');
                $table->timestamps();
                $table->softDeletes();
            });
        }
        foreach (['log_data_tiket_perbaikan' => 'tiket_id', 'log_data_pengajuan_barang' => 'pengajuan_id'] as $name => $foreignKey) {
            Schema::create($name, function (Blueprint $table) use ($foreignKey): void {
                $table->id();
                $table->unsignedBigInteger($foreignKey);
                $table->unsignedBigInteger('user_id');
                $table->string('kategori_log');
                $table->string('data_lama')->nullable();
                $table->string('data_baru')->nullable();
                $table->string('keterangan')->nullable();
                $table->timestamp('created_at');
            });
        }
        Schema::create('master_ruangan', function (Blueprint $table): void {
            $table->id();
            $table->string('nama_ruangan');
            $table->softDeletes();
        });
    }

    /** @return array<string, array{array<int, string>, string, string, string}> */
    public static function dashboardRoles(): array
    {
        return [
            'admin' => [['admin'], '/admin', AdminOverview::class, TeknisiOverview::class],
            'super admin' => [['super_admin'], '/admin', AdminOverview::class, TeknisiOverview::class],
            'teknisi' => [['teknisi'], '/admin', TeknisiOverview::class, AdminOverview::class],
            'mixed roles' => [['admin', 'teknisi'], '/admin', AdminOverview::class, TeknisiOverview::class],
            'pemohon' => [['pemohon'], '/pemohon', AktivitasLayananChart::class, AdminOverview::class],
        ];
    }

    #[DataProvider('dashboardRoles')]
    public function test_dashboard_renders_only_the_widgets_for_its_role(array $roles, string $path, string $visible, string $hidden): void
    {
        $user = $this->userWithRoles($roles);

        $this->actingAs($user)->get($path)->assertOk()->assertSeeLivewire($visible)->assertDontSeeLivewire($hidden);
    }

    public function test_pemohon_trend_and_table_exclude_other_users_and_respect_period(): void
    {
        $this->freezeTime();
        $user = $this->userWithRoles(['pemohon']);
        $other = User::factory()->create();
        $otherId = $this->ticket($other, 'Open');
        $ownId = $this->ticket($user, 'Close', now()->subDays(15)->toDateTimeString());
        $this->actingAs($user);
        Filament::setCurrentPanel(Filament::getPanel('pemohon'));

        $chart = Livewire::test(AktivitasLayananChart::class)->set('filter', '7');
        $this->assertTrue($chart->instance()->isEmpty());
        $chart->set('filter', '30');
        $this->assertFalse($chart->instance()->isEmpty());
        Livewire::test(TiketPerbaikanTerbaru::class)
            ->assertCanSeeTableRecords([TiketPerbaikan::findOrFail($ownId)])
            ->assertCanNotSeeTableRecords([TiketPerbaikan::findOrFail($otherId)]);
    }

    public function test_trend_fills_missing_days_and_excludes_deleted_or_out_of_range_tickets(): void
    {
        $this->freezeTime();
        $user = User::factory()->create();
        $this->ticket($user, 'Open');
        $this->ticket($user, 'Close', now()->subDays(6)->startOfDay()->toDateTimeString());
        $this->ticket($user, 'Open', now()->subDays(7)->toDateTimeString());
        $deleted = $this->ticket($user, 'Open');
        DB::table('tiket_perbaikan')->where('id', $deleted)->update(['deleted_at' => now()]);

        $trend = DashboardMetrics::trend(TiketPerbaikan::query(), PengajuanBarang::query(), 7);

        $this->assertCount(7, $trend['labels']);
        $this->assertSame([1, 0, 0, 0, 0, 0, 1], $trend['perbaikan']);
        $this->assertSame([0, 0, 0, 0, 0, 0, 0], $trend['pengajuan']);
        $this->assertSame(['Close' => 1, 'Open' => 2], DashboardMetrics::statusCounts(TiketPerbaikan::query()));
    }

    public function test_duration_uses_first_start_and_last_close_only_for_completed_tickets(): void
    {
        $user = User::factory()->create();
        $closed = $this->ticket($user, 'Close');
        $open = $this->ticket($user, 'Open');
        $this->ticket($user, 'Close');
        foreach ([$closed, $open] as $id) {
            $this->log($id, $user, 'Open', 'In Progress', '2026-10-01 08:00:00');
            $this->log($id, $user, 'In Progress', 'Close', '2026-10-01 10:00:00');
            $this->log($id, $user, 'Close', 'Open', '2026-10-01 11:00:00');
            $this->log($id, $user, 'Open', 'In Progress', '2026-10-01 12:00:00');
            $this->log($id, $user, 'In Progress', 'Close', '2026-10-01 14:00:00');
        }

        $this->assertSame('6,0 jam', DashboardMetrics::averageCompletedDuration(TiketPerbaikan::query()));
    }

    public function test_active_work_excludes_a_ticket_reassigned_to_another_technician(): void
    {
        $user = $this->userWithRoles(['teknisi']);
        $other = $this->userWithRoles(['teknisi']);
        $ownId = $this->ticket($user, 'In Progress');
        $reassignedId = $this->ticket($user, 'In Progress');
        $this->log($ownId, $user, 'Open', 'In Progress', '2026-10-01 08:00:00');
        $this->log($reassignedId, $user, 'Open', 'In Progress', '2026-10-01 08:00:00');
        $this->log($reassignedId, $other, 'Open', 'In Progress', '2026-10-02 08:00:00');
        $this->actingAs($user);
        Filament::setCurrentPanel(Filament::getPanel('admin'));

        Livewire::test(TeknisiTiketAktif::class)
            ->assertCanSeeTableRecords([TiketPerbaikan::findOrFail($ownId)])
            ->assertCanNotSeeTableRecords([TiketPerbaikan::findOrFail($reassignedId)]);
    }

    /** @param array<int, string> $roles */
    private function userWithRoles(array $roles): User
    {
        $user = User::factory()->create();
        foreach ($roles as $role) {
            $user->assignRole(Role::findOrCreate($role, 'web'));
        }

        return $user;
    }

    private function ticket(User $user, string $status, ?string $createdAt = null): int
    {
        return DB::table('tiket_perbaikan')->insertGetId([
            'user_id' => $user->id, 'status' => $status, 'keluhan' => 'Perangkat tidak menyala',
            'created_at' => $createdAt ?? now(), 'updated_at' => $createdAt ?? now(),
        ]);
    }

    private function log(int $ticketId, User $user, string $from, string $to, string $at): void
    {
        DB::table('log_data_tiket_perbaikan')->insert([
            'tiket_id' => $ticketId, 'user_id' => $user->id, 'kategori_log' => 'Status',
            'data_lama' => $from, 'data_baru' => $to, 'created_at' => $at,
        ]);
    }
}
