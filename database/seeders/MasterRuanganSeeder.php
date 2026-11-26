<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MasterRuanganSeeder extends Seeder
{
    /**
     * @var list<array{0: string, 1: string}>
     */
    private const ROOMS = [
        ['Ruang Teori B 1.2', 'Gedung B Lt. 1'],
        ['Ruang Teori B 1.3', 'Gedung B Lt. 1'],
        ['Ruang Teori B 1.4', 'Gedung B Lt. 1'],
        ['Ruang Teori B 1.5', 'Gedung B Lt. 1'],
        ['Ruang Teori C 1.1', 'Gedung C Lt. 1'],
        ['Ruang Teori C 1.2', 'Gedung C Lt. 1'],
        ['Ruang Teori C 1.3', 'Gedung C Lt. 1'],
        ['Ruang Teori C 1.4', 'Gedung C Lt. 1'],
        ['Ruang Teori C 1.5', 'Gedung C Lt. 1'],
        ['Ruang Teori C 1.6', 'Gedung C Lt. 1'],
        ['Lab Bahasa', 'Gedung A Lt. 1'],
        ['Mushola Cewek', 'Gedung A Lt. 1'],
        ['Mushola Cowok', 'Gedung A Lt. 1'],
        ['Perpustakaan', 'Gedung A Lt. 1'],
        ['Ruang Teori A 1.1', 'Gedung A Lt. 1'],
        ['Ruang Teori A 1.2', 'Gedung A Lt. 1'],
        ['Ruang D 1.1', 'Gedung D Lt. 1'],
        ['Ruang D 1.2', 'Gedung D Lt. 1'],
        ['Ruang D 1.3', 'Gedung D Lt. 1'],
        ['BAU', 'Gedung Administrasi Lt. 1'],
        ['BAAK', 'Gedung Administrasi Lt. 1'],
        ['Ruang Rektor', 'Gedung Administrasi Lt. 1'],
        ['Ruang Wakil Rektor', 'Gedung Administrasi Lt. 1'],
        ['Ruang E 1.1', 'Gedung E Lt. 1'],
        ['Ruang E 1.2', 'Gedung E Lt. 1'],
        ['Ruang E 1.3', 'Gedung E Lt. 1'],
        ['Ruang E 1.4', 'Gedung E Lt. 1'],
        ['Ruang Dosen', 'Gedung E Lt. 2'],
        ['Ruang Dekan', 'Gedung E Lt. 2'],
        ['Ruang Kaprodi', 'Gedung E Lt. 2'],
    ];

    /**
     * @var list<string>
     */
    private const LEGACY_ROOMS = [
        'Rektorat',
        'Kaprodi',
        'P3SDI',
        'UPT Komputer',
        'LAB 1',
        'LAB 2 (Lab Mandiri)',
        'LAB 3',
        'LAB 4 (Lab Jaringan)',
        'LAB 5',
        'LAB 6',
        'LAB 7',
        'Ruang Dosen (E2)',
        'Ruang UKM',
        'Ruang EO',
        'ruang ukm',
        'ruang eo',
    ];

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $roomCount = max(0, (int) config('load_test.master_ruangan_count', count(self::ROOMS)));
        $activeRooms = array_slice(self::ROOMS, 0, $roomCount);
        $managedNames = array_values(array_unique([
            ...self::LEGACY_ROOMS,
            ...array_column(self::ROOMS, 0),
        ]));
        $now = now();

        DB::transaction(function () use ($activeRooms, $managedNames, $now): void {
            DB::table('master_ruangan')
                ->whereIn('nama_ruangan', $managedNames)
                ->update([
                    'is_active' => false,
                    'updated_at' => $now,
                ]);

            foreach ($activeRooms as [$name, $building]) {
                $existingRoom = DB::table('master_ruangan')
                    ->where('nama_ruangan', $name)
                    ->first(['id']);

                if ($existingRoom) {
                    DB::table('master_ruangan')
                        ->where('nama_ruangan', $name)
                        ->update([
                            'nama_gedung' => $building,
                            'is_active' => true,
                            'updated_at' => $now,
                        ]);

                    continue;
                }

                DB::table('master_ruangan')->insert([
                    'nama_ruangan' => $name,
                    'nama_gedung' => $building,
                    'is_active' => true,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }
        });
    }
}
