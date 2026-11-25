<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use Illuminate\Database\Seeder;

class LoadTestSeeder extends Seeder
{
    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $this->call([
            RoleSeeder::class,
            UserSeeder::class,
            MasterRuanganSeeder::class,
            MasterKategoriBarangSeeder::class,
        ]);
    }
}
