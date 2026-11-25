<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class UserSeeder extends Seeder
{
    private const PASSWORD = 'password123';

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $this->call(RoleSeeder::class);
        $this->seedBaselineAccount('applicant', 'pemohon', 'Pemohon Load Test');
        $this->seedBaselineAccount('admin', 'admin', 'Admin Load Test');

        $chunkSize = max(1, (int) config('load_test.users.chunk_size', 500));
        $hashedPassword = Hash::make(self::PASSWORD);
        app(PermissionRegistrar::class)->forgetCachedPermissions();

        $roleIds = Role::query()
            ->whereIn('name', ['pemohon', 'teknisi', 'admin', 'super_admin'])
            ->where('guard_name', 'web')
            ->pluck('id', 'name');

        $unitsByRole = [
            'pemohon' => [
                'Kaprodi Teknik', 'P3SDI', 'Rektorat',
                'Ka. UPT Laboratorium Komputer & Bahasa',
            ],
            'teknisi' => ['UPT Teknisi'],
            'admin' => ['P3SDI'],
            'super_admin' => ['P3SDI'],
        ];

        foreach (['pemohon', 'teknisi', 'admin', 'super_admin'] as $roleName) {
            $count = max(0, (int) config("load_test.users.{$roleName}", 0));
            $roleId = $roleIds->get($roleName);

            for ($offset = 1; $offset <= $count; $offset += $chunkSize) {
                $users = [];
                $last = min($offset + $chunkSize - 1, $count);
                $now = now();

                for ($number = $offset; $number <= $last; $number++) {
                    fake()->seed(crc32($roleName.'-'.$number));
                    $name = fake()->name().' '.str_pad((string) $number, 6, '0', STR_PAD_LEFT);
                    $loginId = $this->loginIdFor($name);
                    $users[] = [
                        'name' => $name,
                        'email' => strtolower($loginId).'@loadtest.invalid',
                        'login_id' => $loginId,
                        'password' => $hashedPassword,
                        'role' => $roleName === 'super_admin' ? 'admin' : $roleName,
                        'unit_bidang' => $unitsByRole[$roleName][($number - 1) % count($unitsByRole[$roleName])],
                        'email_verified_at' => $now,
                        'created_at' => $now,
                        'updated_at' => $now,
                    ];
                }

                DB::table('users')->upsert($users, ['email'], [
                    'name', 'login_id', 'password', 'role', 'unit_bidang', 'email_verified_at', 'updated_at',
                ]);

                $userIds = DB::table('users')
                    ->whereIn('email', array_column($users, 'email'))
                    ->pluck('id', 'email');
                $roleAssignments = [];

                foreach ($users as $user) {
                    $roleAssignments[] = [
                        'role_id' => $roleId,
                        'model_type' => User::class,
                        'model_id' => $userIds->get($user['email']),
                    ];
                }

                $modelKey = config('permission.column_names.model_morph_key', 'model_id');
                DB::table(config('permission.table_names.model_has_roles'))
                    ->where('model_type', User::class)
                    ->whereIn($modelKey, $userIds->values())
                    ->delete();
                DB::table(config('permission.table_names.model_has_roles'))->insertOrIgnore($roleAssignments);
            }
        }

        app(PermissionRegistrar::class)->forgetCachedPermissions();
    }

    private function seedBaselineAccount(string $accountType, string $role, string $name): void
    {
        $email = config("load_test.{$accountType}_email");
        if ($email === null) {
            return;
        }

        if (! is_string($email) || $email === '') {
            throw new \InvalidArgumentException("Set a load test {$accountType} email address.");
        }

        $user = User::updateOrCreate(
            ['email' => $email],
            [
                'name' => $name,
                'login_id' => 'load-'.$accountType,
                'password' => Hash::make($password),
                'role' => $role,
                'unit_bidang' => 'Unit Load Test',
            ],
        );

        $user->syncRoles([$role]);
    }

    private function loginIdFor(string $name): string
    {
        return Str::slug($name);
    }
}
