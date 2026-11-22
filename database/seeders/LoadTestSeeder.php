<?php

namespace Database\Seeders;

use App\Models\Modules\Master\Barang\Models\MasterKategoriBarang;
use App\Models\Modules\Master\Ruangan\Models\MasterRuangan;
use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use InvalidArgumentException;
use Spatie\Permission\Models\Role;

class LoadTestSeeder extends Seeder
{
    /**
     * Seed the isolated database with synthetic applicant and staff accounts.
     */
    public function run(): void
    {
        if (! app()->environment(['local', 'testing'])) {
            throw new InvalidArgumentException('Load test data can only be seeded in local or testing environments.');
        }

        if (config('database.connections.'.config('database.default').'.database') !== 'helpdesk_loadtest') {
            throw new InvalidArgumentException('The active database must be named helpdesk_loadtest.');
        }

        $email = config('load_test.applicant_email');
        $password = config('load_test.applicant_password');
        $adminEmail = config('load_test.admin_email');
        $adminPassword = config('load_test.admin_password');

        if (
            ! is_string($email) || $email === ''
            || ! is_string($password) || strlen($password) < 12
            || ! is_string($adminEmail) || $adminEmail === ''
            || ! is_string($adminPassword) || strlen($adminPassword) < 12
        ) {
            throw new InvalidArgumentException('Set synthetic applicant and admin email/password values. Passwords must contain at least 12 characters.');
        }

        Role::findOrCreate('pemohon', 'web');
        Role::findOrCreate('admin', 'web');

        $pemohon = User::updateOrCreate(
            ['email' => $email],
            [
                'name' => 'Pemohon Load Test',
                'password' => Hash::make($password),
            ],
        );

        $pemohon->syncRoles(['pemohon']);

        $admin = User::updateOrCreate(
            ['email' => $adminEmail],
            [
                'name' => 'Admin Load Test',
                'password' => Hash::make($adminPassword),
            ],
        );

        $admin->syncRoles(['admin']);

        MasterRuangan::firstOrCreate(
            ['nama_ruangan' => 'Ruang Load Test'],
            ['nama_gedung' => 'Gedung Load Test'],
        );

        MasterKategoriBarang::firstOrCreate(
            ['nama_kategori' => 'Kategori Load Test'],
            ['is_active' => true],
        );
    }
}
