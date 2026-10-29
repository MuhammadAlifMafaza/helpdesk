<?php

namespace Tests\Feature;

use App\Models\User;
use App\Notifications\PemohonResetPassword;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Notification;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Schema;
use PHPUnit\Framework\Attributes\DataProvider;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class PemohonPasswordResetTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutVite();

        Schema::create('users', function (Blueprint $table): void {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->timestamp('email_verified_at')->nullable();
            $table->string('password');
            $table->rememberToken();
            $table->timestamps();
        });
        (require database_path('migrations/0001_01_01_000000_create_users_table.php'))->up();
        (require database_path('migrations/2026_04_22_121933_create_permission_tables.php'))->up();
    }

    public function test_pemohon_receives_link_to_custom_reset_page(): void
    {
        $user = $this->userWithRoles(['pemohon']);
        Notification::fake();

        $this->post(route('pemohon.password.email'), ['email' => $user->email])
            ->assertRedirect()->assertSessionHas('status');

        Notification::assertSentTo($user, PemohonResetPassword::class, function (PemohonResetPassword $notification) use ($user): bool {
            $url = $notification->toMail($user)->actionUrl;
            $this->assertSame(route('pemohon.password.reset', ['token' => $notification->token, 'email' => $user->email]), $url);
            $this->get($url)->assertOk()->assertSee('Atur kata sandi baru');

            return Password::broker('users')->tokenExists($user, $notification->token);
        });
    }

    /** @return array<string, array{array<int, string>}> */
    public static function excludedRoles(): array
    {
        return [
            'admin' => [['admin']], 'teknisi' => [['teknisi']],
            'super admin' => [['super_admin']], 'no role' => [[]],
            'mixed roles' => [['pemohon', 'admin']],
        ];
    }

    #[DataProvider('excludedRoles')]
    public function test_non_pemohon_cannot_request_or_use_reset_link(array $roles): void
    {
        $user = $this->userWithRoles($roles);
        $originalPassword = $user->password;
        Notification::fake();

        $this->post(route('pemohon.password.email'), ['email' => $user->email])
            ->assertSessionHas('status')->assertSessionHasNoErrors();
        Notification::assertNothingSent();
        $token = Password::broker('users')->createToken($user);

        $this->post(route('pemohon.password.update'), $this->resetInput($user, $token))
            ->assertSessionHasErrors('email');

        $this->assertSame($originalPassword, $user->fresh()->password);
    }

    public function test_unknown_email_has_the_same_response_and_no_notification(): void
    {
        Notification::fake();

        $this->post(route('pemohon.password.email'), ['email' => 'unknown@example.test'])
            ->assertSessionHas('status')->assertSessionHasNoErrors();
        $status = session('status');
        $user = $this->userWithRoles(['pemohon']);
        $this->post(route('pemohon.password.email'), ['email' => $user->email])->assertSessionHas('status', $status);

        Notification::assertSentTo($user, PemohonResetPassword::class);
        Notification::assertCount(1);
    }

    public function test_valid_token_changes_password_and_cannot_be_reused(): void
    {
        $user = $this->userWithRoles(['pemohon']);
        $rememberToken = $user->remember_token;
        $token = Password::broker('users')->createToken($user);
        Event::fake([PasswordReset::class]);

        $this->post(route('pemohon.password.update'), $this->resetInput($user, $token))
            ->assertRedirect(route('login'))->assertSessionHas('status');

        $this->assertTrue(Hash::check('new-password-123', $user->fresh()->password));
        $this->assertNotSame($rememberToken, $user->fresh()->remember_token);
        Event::assertDispatched(PasswordReset::class);
        $this->post(route('pemohon.password.update'), $this->resetInput($user, $token))
            ->assertSessionHasErrors('email');
    }

    public function test_expired_token_cannot_change_password(): void
    {
        $user = $this->userWithRoles(['pemohon']);
        $originalPassword = $user->password;
        $token = Password::broker('users')->createToken($user);
        $this->travel(61)->minutes();

        $this->post(route('pemohon.password.update'), $this->resetInput($user, $token))
            ->assertSessionHasErrors('email');

        $this->assertSame($originalPassword, $user->fresh()->password);
    }

    public function test_invalid_token_and_mismatched_confirmation_are_rejected(): void
    {
        $user = $this->userWithRoles(['pemohon']);
        $this->post(route('pemohon.password.update'), $this->resetInput($user, 'invalid-token'))
            ->assertSessionHasErrors('email');
        $input = $this->resetInput($user, Password::broker('users')->createToken($user));
        $input['password_confirmation'] = 'different-password';

        $this->post(route('pemohon.password.update'), $input)->assertSessionHasErrors('password');
    }

    public function test_repeated_requests_are_throttled_without_duplicate_mail(): void
    {
        $user = $this->userWithRoles(['pemohon']);
        Notification::fake();
        for ($attempt = 0; $attempt < 5; $attempt++) {
            $this->post(route('pemohon.password.email'), ['email' => $user->email])->assertRedirect();
        }

        $this->post(route('pemohon.password.email'), ['email' => $user->email])->assertTooManyRequests();
        Notification::assertSentToTimes($user, PemohonResetPassword::class, 1);
    }

    public function test_recovery_pages_and_login_have_no_footer(): void
    {
        $this->get(route('pemohon.password.request'))->assertOk()->assertDontSee('<footer', false);
        $this->get(route('pemohon.password.reset', ['token' => 'example']))->assertOk()->assertDontSee('<footer', false);
        $this->get(route('login'))->assertOk()->assertSee(route('pemohon.password.request'), false)->assertDontSee('<footer', false);
        $this->get(route('filament.admin.auth.password-reset.request'))->assertOk();
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

    /** @return array{email: string, token: string, password: string, password_confirmation: string} */
    private function resetInput(User $user, string $token): array
    {
        return ['email' => $user->email, 'token' => $token, 'password' => 'new-password-123', 'password_confirmation' => 'new-password-123'];
    }
}
