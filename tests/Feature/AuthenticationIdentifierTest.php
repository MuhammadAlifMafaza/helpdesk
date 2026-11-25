<?php

namespace Tests\Feature;

use App\Filament\Auth\StaffLogin;
use App\Filament\Resources\Users\Pages\CreateUser;
use App\Filament\Resources\Users\UserResource;
use App\Models\User;
use Filament\Facades\Filament;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Livewire\Livewire;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class AuthenticationIdentifierTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutVite();

        Schema::create('users', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('login_id')->nullable()->unique();
            $table->string('unit_bidang')->nullable();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });

        (require database_path('migrations/2026_04_22_121933_create_permission_tables.php'))->up();
    }

    public function test_pemohon_can_login_with_institutional_id(): void
    {
        $user = $this->createUser('pemohon', '24001234');

        $this->post('/login', [
            'identifier' => ' 24001234 ',
            'password' => 'correct-password',
        ])->assertRedirect('/');

        $this->assertAuthenticatedAs($user);
    }

    public function test_pemohon_can_login_with_email_and_legacy_email_field(): void
    {
        $user = $this->createUser('pemohon', '24001234');

        $this->post('/login', [
            'email' => $user->email,
            'password' => 'correct-password',
        ])->assertRedirect('/');

        $this->assertAuthenticatedAs($user);
    }

    public function test_regular_login_rejects_staff_accounts(): void
    {
        $user = $this->createUser('admin', 'staff-001');

        $this->from('/login')->post('/login', [
            'identifier' => $user->login_id,
            'password' => 'correct-password',
        ])->assertRedirect('/login')->assertSessionHasErrors('identifier');

        $this->assertGuest();
    }

    public function test_staff_login_page_uses_the_custom_identifier_form(): void
    {
        $this->get('/admin/login')
            ->assertOk()
            ->assertSee('Login panel staff')
            ->assertSee('Username / NIM / NIDN')
            ->assertSee('wire:submit="authenticate"', false)
            ->assertSee('Masuk ke panel staff')
            ->assertSee('Lupa kata sandi?')
            ->assertSee('Ruang kendali layanan teknis kampus.')
            ->assertSee('SLA, dan komunikasi layanan');
    }

    public function test_staff_password_request_uses_custom_page(): void
    {
        $this->get(route('filament.admin.auth.password-reset.request'))
            ->assertOk()
            ->assertSee('Pemulihan akun staff')
            ->assertSee('Masukkan email akun staff yang terdaftar.')
            ->assertSee('Kirim tautan pemulihan')
            ->assertSee('Kembali ke login staff');
    }

    public function test_staff_password_reset_uses_custom_page(): void
    {
        $user = $this->createUser('teknisi', 'staff-reset');
        $resetUrl = Filament::getResetPasswordUrl('sample-reset-token', $user);

        $this->get($resetUrl)
            ->assertOk()
            ->assertSee('Keamanan akun staff')
            ->assertSee('Buat kata sandi baru')
            ->assertSee('Simpan kata sandi baru');
    }

    public function test_staff_can_authenticate_with_institutional_id_on_staff_panel(): void
    {
        $user = $this->createUser('teknisi', 'NIDN-001');
        Filament::setCurrentPanel(Filament::getPanel('admin'));

        Livewire::test(StaffLogin::class)
            ->set('data.identifier', 'nidn-001')
            ->set('data.password', 'correct-password')
            ->call('authenticate')
            ->assertHasNoFormErrors();

        $this->assertAuthenticatedAs($user);
    }

    public function test_admin_cannot_manage_super_admin_or_delete_self(): void
    {
        $admin = $this->createUser('admin', 'admin-01');
        $superAdmin = $this->createUser('super_admin', 'root-01');

        $this->actingAs($admin);

        $this->assertFalse(UserResource::canEdit($superAdmin));
        $this->assertFalse(UserResource::canDelete($superAdmin));
        $this->assertFalse(UserResource::canDelete($admin));
    }

    public function test_admin_cannot_assign_super_admin_role_through_user_form(): void
    {
        $admin = $this->createUser('admin', 'admin-01');
        $superAdminRole = Role::findOrCreate('super_admin', 'web');
        Filament::setCurrentPanel(Filament::getPanel('admin'));

        Livewire::actingAs($admin)->test(CreateUser::class)
            ->fillForm([
                'name' => 'Calon Super Admin',
                'email' => 'candidate@example.test',
                'login_id' => 'candidate-01',
                'password' => 'correct-password',
                'unit_bidang' => 'IT',
                'roles' => $superAdminRole->getKey(),
            ])
            ->call('create')
            ->assertHasFormErrors(['roles']);

        $this->assertDatabaseMissing('users', ['email' => 'candidate@example.test']);
    }

    public function test_super_admin_can_manage_another_super_admin_but_last_one_is_protected(): void
    {
        $firstSuperAdmin = $this->createUser('super_admin', 'root-01');
        $secondSuperAdmin = $this->createUser('super_admin', 'root-02');

        $this->actingAs($firstSuperAdmin);

        $this->assertTrue(UserResource::canEdit($secondSuperAdmin));
        $this->assertTrue(UserResource::canDelete($secondSuperAdmin));
        $this->assertFalse(UserResource::canDelete($firstSuperAdmin));

        $secondSuperAdmin->delete();

        $this->assertFalse(UserResource::canDelete($firstSuperAdmin));
    }

    private function createUser(string $role, string $loginId): User
    {
        $user = User::query()->create([
            'name' => ucfirst($role),
            'email' => $loginId.'@example.test',
            'login_id' => mb_strtolower($loginId),
            'password' => Hash::make('correct-password'),
        ]);

        $user->assignRole(Role::findOrCreate($role, 'web'));

        return $user;
    }
}
