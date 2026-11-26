<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Str;
use RuntimeException;
use Spatie\Permission\Models\Role;
use Spatie\Permission\PermissionRegistrar;

class UserSeeder extends Seeder
{
    private const MANAGED_USER_COUNT = 50;

    private const LEGACY_EMAIL_PATTERN = '%@loadtest.invalid';

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $this->call(RoleSeeder::class);
        app(PermissionRegistrar::class)->forgetCachedPermissions();

        $accounts = $this->allSeedAccounts();
        $now = now();
        $roleIds = Role::query()
            ->whereIn('name', ['pemohon', 'teknisi', 'admin', 'super_admin'])
            ->where('guard_name', 'web')
            ->pluck('id', 'name');

        foreach (['pemohon', 'teknisi', 'admin', 'super_admin'] as $roleName) {
            if (! $roleIds->has($roleName)) {
                throw new RuntimeException("Required role [{$roleName}] is missing.");
            }
        }

        $passwords = [
            'default' => Hash::make('password123'),
            'teknisi' => Hash::make('Teknisi_123'),
            'super_admin' => Hash::make('SuperAdmin_123'),
        ];

        DB::transaction(function () use ($accounts, $now, $passwords, $roleIds): void {
            $legacyUserIds = $this->removeLegacySyntheticUsers();
            $this->assertLoginIdsAreAvailable($accounts);

            $userRows = [];

            foreach ($accounts as $account) {
                $userRows[] = [
                    'name' => $account['name'],
                    'email' => $account['email'],
                    'login_id' => $account['login_id'],
                    'password' => $passwords[$account['role']] ?? $passwords['default'],
                    // The legacy users.role enum does not include super_admin.
                    'role' => $account['role'] === 'super_admin' ? 'admin' : $account['role'],
                    'unit_bidang' => $account['unit_bidang'],
                    'email_verified_at' => $now,
                    'created_at' => $now,
                    'updated_at' => $now,
                ];
            }

            DB::table('users')->upsert($userRows, ['email'], [
                'name', 'login_id', 'password', 'role', 'unit_bidang', 'email_verified_at', 'updated_at',
            ]);

            $userIds = DB::table('users')
                ->whereIn('email', array_column($userRows, 'email'))
                ->pluck('id', 'email');
            $seededUserIds = $userIds->values();
            $modelHasRolesTable = config('permission.table_names.model_has_roles');
            $modelHasPermissionsTable = config('permission.table_names.model_has_permissions');
            $modelKey = config('permission.column_names.model_morph_key', 'model_id');

            foreach ([$modelHasRolesTable, $modelHasPermissionsTable] as $pivotTable) {
                if (Schema::hasTable($pivotTable)) {
                    DB::table($pivotTable)
                        ->where('model_type', User::class)
                        ->whereIn($modelKey, $seededUserIds)
                        ->delete();
                }
            }

            $roleAssignments = [];

            foreach ($accounts as $account) {
                $roleAssignments[] = [
                    'role_id' => $roleIds->get($account['role']),
                    'model_type' => User::class,
                    'model_id' => $userIds->get($account['email']),
                ];
            }

            DB::table($modelHasRolesTable)->insert($roleAssignments);

            if ($legacyUserIds->isNotEmpty()) {
                app(PermissionRegistrar::class)->forgetCachedPermissions();
            }
        });

        app(PermissionRegistrar::class)->forgetCachedPermissions();
    }

    /**
     * @return list<array{name: string, email: string, login_id: string, role: string, unit_bidang: string}>
     */
    private function allSeedAccounts(): array
    {
        $accountsByEmail = [];

        $curatedAccounts = $this->curatedAccounts();

        foreach (array_merge($this->sqlBaseAccounts(), $curatedAccounts) as $account) {
            $accountsByEmail[$account['email']] = $account;
        }

        $accounts = array_values($accountsByEmail);

        if (count($curatedAccounts) !== self::MANAGED_USER_COUNT) {
            throw new RuntimeException('The curated user dataset must contain exactly 50 accounts.');
        }

        return $accounts;
    }

    /**
     * @return list<array{name: string, email: string, login_id: string, role: string, unit_bidang: string}>
     */
    private function curatedAccounts(): array
    {
        $accounts = [
            $this->account('Super Admin', 'super_admin', 'P3SDI', 'superadmin'),
            $this->account('Fithnan', 'teknisi', 'UPT Teknisi', 'fithnan'),
            $this->account('Fajar Ano', 'teknisi', 'UPT Teknisi', 'fajar.ano'),
        ];

        $organizationPeople = [
            ['Dr. Paminto Agung Christianto, M.Kom', 'Rektor'],
            ['Taryadi, M.Cs', 'Wakil Rektor 1'],
            ['Nur Fadhilah, M.Hum', 'Wakil Rektor 2'],
            ['Sattriedi Wahyu Binabar, M.Kom', 'Wakil Rektor 3'],
            ['Prastuti Sulistyorini, M.Kom', 'Dekan Fakultas Teknologi Informasi'],
            [
                'Dicke JSH Siregar, M.Kom',
                'Dekan Fakultas Ekonomika dan Bisnis / Plt. Kaprodi Komputerisasi Akuntansi (D3)',
            ],
            ['Eko Budi Susanto, M.Kom', 'Kaprodi Sistem Informasi (S1)'],
            ['Arochman, M.Kom', 'Kaprodi Teknik Informatika (S1)'],
            ['Christian Yulianto Rusli, M.Kom', 'Kaprodi Bisnis Digital'],
            ['Tri Agus Setiawan, M.Kom', 'Kepala P3M'],
            ['Devi Sugianti, M.Kom', 'Kepala BAAK'],
            ['Annas Rivai, S.Kom', 'Kepala BAU'],
            ['Sumiyem, S.E', 'Kepala UPT Perpustakaan'],
            ['Wachid Darmawan, M.Kom', 'Kepala UPT Laboratorium (Komputer dan Bahasa)'],
            ['MT. Nindya Rosalina, SH', 'Kepala PSDM'],
            ['Much. Rifiqi Maulana, M.Kom', 'Kepala Penjaminan Mutu'],
            ['M. Faizal Kurniawan, M.Kom', 'Kepala P3SDI'],
            ['Agus Ilyas, M.Kom', 'Kabid Riset dan Pengelolaan Jurnal Riset'],
            ['Tri Pudji Wahjuningsih, SE, M.Si.', 'Kabid Pengabdian dan Pengelolaan Jurnal Pengabdian'],
            ['Risqiati, M.Kom', 'Kabid Administrasi Fakultas'],
            ['Ichwan Kurniawan, M.Kom', 'Kabid Pengendali Sistem Mutu dan Akreditasi'],
            ['Widiyono, M.Kom', 'Kabid Humas dan Pengelolaan Promosi Digital'],
            ['Ari Putra Wibowo, M.Kom', 'Kabid WPiTV'],
            ['Victorianus Aries Siswanto, M.Kom', 'Kabid Alumni dan Tracer Studi'],
            ['Bambang Ismanto, M.Kom', 'Kabid Beasiswa dan Prestasi Mahasiswa'],
            ['Riski Sulistiyaningsih, M.Kom', 'Kabid Kerjasama (Dalam dan Luar Negeri)'],
            ['Era Yunianto, M.Kom', 'Kabid Peningkatan Karir Dosen dan Tenaga Kependidikan'],
            ['Wahyu Setianto, M.Kom', 'Kabid PDDIKTI dan Pengelolaan Infrastruktur'],
            ['Anas Syaifudin, M.Kom', 'Kabid Pengembangan Sistem Informasi'],
            ['Edi Purwanto, S.Kom', 'Kabid Teknisi dan Perawatan Infrastruktur'],
        ];

        foreach ($organizationPeople as [$name, $position]) {
            $isEdi = Str::startsWith($name, 'Edi Purwanto');
            $accounts[] = $this->account(
                $name,
                $isEdi ? 'admin' : 'pemohon',
                $position,
                $isEdi ? 'edi' : null,
                $isEdi ? 'edi@iwima.edu' : null,
            );
        }

        $reservedAccounts = array_merge($accounts, $this->sqlBaseAccounts());
        $usedLoginIds = array_fill_keys(array_column($reservedAccounts, 'login_id'), true);
        $usedEmails = array_fill_keys(array_column($reservedAccounts, 'email'), true);
        $faker = fake('id_ID');
        $faker->seed(20261126);

        while (count($accounts) < self::MANAGED_USER_COUNT) {
            $name = $faker->name();
            $baseLoginId = Str::slug($name);
            $loginId = $baseLoginId;
            $suffix = 2;

            while (isset($usedLoginIds[$loginId]) || isset($usedEmails[$loginId.'@iwima.edu'])) {
                $loginId = $baseLoginId.'-'.$suffix;
                $suffix++;
            }

            $usedLoginIds[$loginId] = true;
            $email = $loginId.'@iwima.edu';
            $usedEmails[$email] = true;
            $accounts[] = $this->account(
                $name,
                'pemohon',
                $faker->randomElement(['Dosen', 'Karyawan']),
                $loginId,
                $email,
            );
        }

        return $accounts;
    }

    /**
     * @return list<array{name: string, email: string, login_id: string, role: string, unit_bidang: string}>
     */
    private function sqlBaseAccounts(): array
    {
        return [
            $this->account('Fithnan', 'teknisi', 'UPT Teknisi', 'fithnan'),
            $this->account('Sulistyo', 'teknisi', 'UPT Teknisi', 'sulistyo'),
            $this->account('Edi Purwanto, S.Kom', 'admin', 'Kabid Teknisi dan Perawatan Infrastruktur', 'edi'),
            $this->account('Eko', 'pemohon', 'Kaprodi Teknik', 'eko'),
            $this->account('Annas Syaifudin', 'pemohon', 'P3SDI', 'annas'),
            $this->account('Dr. Christianto', 'pemohon', 'Rektorat', 'christianto'),
            $this->account('AdminSuper', 'admin', 'P3SDI', 'admin'),
            $this->account('Faizal Kurniawan', 'pemohon', 'P3SDI', 'faizal'),
            $this->account('Wachid Darmawan, M.Kom', 'pemohon', 'Kepala UPT Laboratorium Komputer dan Bahasa', 'wachiddarmawan'),
        ];
    }

    /**
     * @return array{name: string, email: string, login_id: string, role: string, unit_bidang: string}
     */
    private function account(string $name, string $role, string $unitBidang, ?string $loginId = null, ?string $email = null): array
    {
        $loginId ??= Str::slug($name);

        return [
            'name' => $name,
            'email' => Str::lower($email ?? $loginId.'@iwima.edu'),
            'login_id' => Str::lower($loginId),
            'role' => $role,
            'unit_bidang' => $unitBidang,
        ];
    }

    /**
     * @param  list<array{name: string, email: string, login_id: string, role: string, unit_bidang: string}>  $accounts
     */
    private function assertLoginIdsAreAvailable(array $accounts): void
    {
        $seedEmails = array_column($accounts, 'email');
        $loginIds = array_column($accounts, 'login_id');
        $conflictingUser = DB::table('users')
            ->whereIn('login_id', $loginIds)
            ->whereNotIn('email', $seedEmails)
            ->first(['login_id', 'email']);

        if ($conflictingUser) {
            throw new RuntimeException("Seed login ID [{$conflictingUser->login_id}] is already used by another account.");
        }
    }

    /**
     * @return Collection<int, int>
     */
    private function removeLegacySyntheticUsers(): Collection
    {
        $userIds = DB::table('users')
            ->where('email', 'like', self::LEGACY_EMAIL_PATTERN)
            ->pluck('id');

        if ($userIds->isEmpty()) {
            return $userIds;
        }

        $userReferenceChecks = [
            ['tiket_perbaikan', 'user_id'],
            ['pengajuan_barang', 'user_id'],
            ['log_data_tiket_perbaikan', 'user_id'],
            ['log_data_pengajuan_barang', 'user_id'],
            ['log_harian_teknisi', 'teknisi_id'],
        ];

        foreach ($userReferenceChecks as [$table, $column]) {
            if (Schema::hasTable($table) && Schema::hasColumn($table, $column) && DB::table($table)->whereIn($column, $userIds)->exists()) {
                throw new RuntimeException("Legacy load-test users are referenced by [{$table}]; no users were removed.");
            }
        }

        if (
            Schema::hasTable('notifications') &&
            Schema::hasColumn('notifications', 'notifiable_id') &&
            Schema::hasColumn('notifications', 'notifiable_type') &&
            DB::table('notifications')
                ->where('notifiable_type', User::class)
                ->whereIn('notifiable_id', $userIds)
                ->exists()
        ) {
            throw new RuntimeException('Legacy load-test users have notifications; no users were removed.');
        }

        $modelKey = config('permission.column_names.model_morph_key', 'model_id');

        foreach ([config('permission.table_names.model_has_roles'), config('permission.table_names.model_has_permissions')] as $pivotTable) {
            if (Schema::hasTable($pivotTable)) {
                DB::table($pivotTable)
                    ->where('model_type', User::class)
                    ->whereIn($modelKey, $userIds)
                    ->delete();
            }
        }

        if (Schema::hasTable('password_reset_tokens')) {
            $emails = DB::table('users')->whereIn('id', $userIds)->pluck('email');
            DB::table('password_reset_tokens')->whereIn('email', $emails)->delete();
        }

        DB::table('users')->whereIn('id', $userIds)->delete();

        return $userIds;
    }
}
