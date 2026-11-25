<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MasterRuanganSeeder extends Seeder
{
    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $rooms = array_slice([
            ['Rektorat', 'Gedung Administrasi Lt. 2'],
            ['Kaprodi', 'Ruang Dosen Gedung E Lt. 2'],
            ['P3SDI', 'Gedung D Lt. 2'],
            ['UPT Komputer', 'Gedung D Lt. 2'],
            ['LAB 1', 'Gedung D Lt. 2'],
            ['LAB 2 (Lab Mandiri)', 'Gedung D Lt. 2'],
            ['LAB 3', 'Gedung B Lt. 2'],
            ['LAB 4 (Lab Jaringan)', 'Gedung A Lt. 1'],
            ['LAB 5', 'Gedung B Lt. 2'],
            ['LAB 6', 'Gedung A Lt. 2'],
            ['LAB 7', 'Gedung A Lt. 2'],
            ['Ruang Dosen (E2)', 'Gedung E Lt. 2'],
            ['Ruang UKM', 'Gedung E Lt. 2'],
            ['Ruang EO', 'Gedung B Lt. 2'],
        ], 0, max(0, (int) config('load_test.master_ruangan_count', 0)));
        $names = array_column($rooms, 0);
        $existingNames = array_fill_keys(DB::table('master_ruangan')->whereIn('nama_ruangan', $names)->pluck('nama_ruangan')->all(), true);
        $roomRows = [];
        $now = now();

        foreach ($rooms as [$name, $building]) {
            if (isset($existingNames[$name])) {
                continue;
            }

            $roomRows[] = [
                'nama_ruangan' => $name,
                'nama_gedung' => $building,
                'created_at' => $now,
                'updated_at' => $now,
            ];
        }

        foreach (array_chunk($roomRows, 500) as $roomChunk) {
            DB::table('master_ruangan')->insert($roomChunk);
        }
    }
}
