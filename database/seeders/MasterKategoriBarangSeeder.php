<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MasterKategoriBarangSeeder extends Seeder
{
    /**
     * @var list<string>
     */
    private const LEGACY_CATEGORIES = [
        'Komponen Komputer & Laptop',
        'Perangkat & Aksesori Jaringan',
        'Perangkat & Suku Cadang Printer',
        'Peralatan Pendukung Infrastruktur IT',
        'Tools & Peralatan Teknisi',
        'Komputer & Laptop',
        'Monitor & Display',
        'Perangkat Jaringan',
        'Printer & Scanner',
        'Perangkat Presentasi & Multimedia',
        'Aksesori & Periferal Komputer',
        'Server & Data Center',
        'CCTV & Keamanan IT',
    ];

    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $allCategories = [
            ['Komputer', 'Komputer desktop dan workstation untuk kebutuhan operasional kampus.'],
            ['Laptop', 'Komputer jinjing untuk kebutuhan kerja, mengajar, dan kegiatan akademik.'],
            ['Komponen Komputer', 'Komponen pengganti khusus untuk komputer desktop dan workstation.'],
            ['Komponen Laptop', 'Komponen pengganti khusus untuk laptop dan notebook.'],
            ['Monitor', 'Monitor untuk komputer, laboratorium, ruang kerja, dan fasilitas institut.'],
            ['Proyektor', 'Proyektor dan perangkat display untuk kegiatan presentasi dan pembelajaran.'],
            ['Perangkat Jaringan', 'Perangkat inti untuk membangun dan memelihara jaringan komputer.'],
            ['Aksesori Jaringan', 'Kabel, konektor, adapter, dan aksesori instalasi jaringan.'],
            ['Printer', 'Perangkat pencetak untuk kebutuhan administrasi dan akademik.'],
            ['Scanner', 'Perangkat pemindai dokumen dan gambar.'],
            ['Suku Cadang Printer', 'Komponen pengganti untuk perawatan dan perbaikan printer.'],
            ['Bahan Habis Pakai Printer', 'Tinta, toner, kertas, dan bahan habis pakai untuk printer.'],
            ['Peralatan Infrastruktur IT', 'Peralatan dan material pendukung infrastruktur teknologi informasi dan ruang server.'],
            ['Tools Teknisi', 'Peralatan kerja untuk instalasi, perawatan, dan troubleshooting perangkat TI.'],
            ['Perangkat Presentasi', 'Perangkat untuk mendukung presentasi, rapat, dan kegiatan pembelajaran.'],
            ['Perangkat Audio', 'Mikrofon, speaker, headset, dan perangkat pengolah suara.'],
            ['Perangkat Video', 'Kamera, webcam, capture device, dan perangkat pengolah video.'],
            ['Aksesori Komputer', 'Aksesori pendukung komputer seperti keyboard, mouse, dan adapter.'],
            ['Periferal Komputer', 'Perangkat periferal komputer seperti webcam, headset, dan perangkat input tambahan.'],
            ['Server', 'Server dan komponen pemrosesan untuk layanan dan sistem kampus.'],
            ['Penyimpanan Data', 'Media dan perangkat penyimpanan data untuk workstation, server, dan cadangan.'],
            ['CCTV', 'Kamera dan perangkat perekaman untuk pemantauan fasilitas kampus.'],
            ['Perangkat Keamanan IT', 'Perangkat pendukung keamanan jaringan, sistem, dan infrastruktur TI.'],
        ];

        $categoryCount = max(0, (int) config('load_test.master_kategori_count', count($allCategories)));
        $categories = array_slice($allCategories, 0, $categoryCount);
        $allManagedNames = array_values(array_unique([
            ...self::LEGACY_CATEGORIES,
            ...array_column($allCategories, 0),
        ]));
        $now = now();

        DB::transaction(function () use ($allManagedNames, $categories, $now): void {
            DB::table('master_kategori_barang')
                ->whereIn('nama_kategori', $allManagedNames)
                ->update([
                    'is_active' => false,
                    'updated_at' => $now,
                ]);

            foreach ($categories as [$name, $description]) {
                $existingCategory = DB::table('master_kategori_barang')
                    ->where('nama_kategori', $name)
                    ->first(['id']);

                if ($existingCategory) {
                    DB::table('master_kategori_barang')
                        ->where('nama_kategori', $name)
                        ->update([
                            'deskripsi' => $description,
                            'is_active' => true,
                            'deleted_at' => null,
                            'updated_at' => $now,
                        ]);

                    continue;
                }

                DB::table('master_kategori_barang')->insert([
                    'nama_kategori' => $name,
                    'deskripsi' => $description,
                    'is_active' => true,
                    'created_at' => $now,
                    'updated_at' => $now,
                ]);
            }
        });
    }
}
