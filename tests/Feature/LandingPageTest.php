<?php

namespace Tests\Feature;

use App\Models\User;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class LandingPageTest extends TestCase
{
    private User $staff;

    protected function setUp(): void
    {
        parent::setUp();

        config([
            'database.default' => 'mysql',
            'database.connections.mysql.database' => 'helpdesk_dev',
            'queue.default' => 'sync',
        ]);

        DB::purge('mysql');
        DB::reconnect('mysql');

        foreach (['admin', 'pemohon'] as $role) {
            Role::findOrCreate($role, 'web');
        }

        $this->staff = User::create([
            'name' => 'Admin Uji Landing',
            'email' => 'admin@uji-landing.test',
            'password' => bcrypt('password'),
        ]);
        $this->staff->syncRoles(['admin']);
    }

    protected function tearDown(): void
    {
        $userIds = User::where('email', 'like', '%@uji-landing.test')->pluck('id');

        DB::table('model_has_roles')
            ->whereIn('model_id', $userIds)
            ->where('model_type', User::class)
            ->delete();

        User::whereIn('id', $userIds)->forceDelete();

        parent::tearDown();
    }

    public function test_tamu_melihat_landing_page(): void
    {
        $this->get('/')
            ->assertOk()
            ->assertSee('Dukungan teknologi kampus, lewat satu portal.')
            ->assertSee('Ruang lingkup layanan')
            ->assertSee('Alur layanan')
            ->assertSee('Hubungi kami');
    }

    public function test_statistik_dinamis_tampil(): void
    {
        $this->get('/')
            ->assertOk()
            ->assertSee('Tiket perbaikan')
            ->assertSee('Tiket selesai')
            ->assertSee('Pengajuan Barang')
            ->assertSee('Kegiatan teknisi');
    }

    public function test_user_login_dialihkan_ke_halaman_peran(): void
    {
        $this->actingAs($this->staff)
            ->get('/')
            ->assertRedirect($this->staff->homeUrl());
    }
}
