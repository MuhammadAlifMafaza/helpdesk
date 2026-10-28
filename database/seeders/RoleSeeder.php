<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Spatie\Permission\Models\Role;

class RoleSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        foreach (['super_admin', 'admin', 'teknisi', 'pemohon'] as $role) {
            Role::findOrCreate($role, 'web');
        }
    }
}
