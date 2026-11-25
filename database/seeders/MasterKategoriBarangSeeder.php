<?php

namespace Database\Seeders;

use App\LoadTestSeederGuard;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class MasterKategoriBarangSeeder extends Seeder
{
    public function run(): void
    {
        LoadTestSeederGuard::assertSafeTarget();

        $now = now();
        $categories = array_slice([
            ['Komponen Komputer & Laptop', 'Komponen pengganti dan perangkat pendukung untuk perawatan, perbaikan, dan upgrade komputer serta laptop.'],
            ['Perangkat & Aksesori Jaringan', 'Perangkat dan aksesori untuk instalasi, pemeliharaan, serta troubleshooting jaringan komputer.'],
            ['Perangkat & Suku Cadang Printer', 'Perangkat, komponen, dan bahan habis pakai untuk perawatan serta perbaikan printer.'],
            ['Peralatan Pendukung Infrastruktur IT', 'Peralatan dan material pendukung infrastruktur TI, ruang server, jaringan, dan fasilitas kampus.'],
            ['Tools & Peralatan Teknisi', 'Peralatan kerja untuk instalasi, perawatan, perbaikan, dan troubleshooting perangkat TI.'],
            ['Komputer & Laptop', 'Komputer, laptop, workstation, dan perangkat komputasi untuk operasional institut.'],
            ['Monitor & Display', 'Monitor dan display untuk ruang kerja, laboratorium, dan fasilitas institut.'],
            ['Perangkat Jaringan', 'Perangkat untuk membangun, mengembangkan, dan memelihara jaringan institut.'],
            ['Printer & Scanner', 'Perangkat pencetak, pemindai, dan pendukung kebutuhan administrasi serta akademik.'],
            ['Perangkat Presentasi & Multimedia', 'Perangkat presentasi, audio, video, dan multimedia untuk pembelajaran dan rapat.'],
            ['Aksesori & Periferal Komputer', 'Keyboard, mouse, webcam, headset, adapter, dan aksesori komputer lainnya.'],
            ['Server & Data Center', 'Perangkat dan komponen untuk server, penyimpanan data, dan infrastruktur data center.'],
            ['CCTV & Keamanan IT', 'Perangkat CCTV dan pendukung keamanan infrastruktur teknologi informasi.'],
        ], 0, max(0, (int) config('load_test.master_kategori_count', 0)));
        $names = array_column($categories, 0);

        $existingNames = DB::table('master_kategori_barang')
            ->whereIn('nama_kategori', $names)
            ->pluck('nama_kategori')
            ->all();
        $existingNameLookup = array_fill_keys($existingNames, true);

        foreach (array_chunk($existingNames, 500) as $nameChunk) {
            DB::table('master_kategori_barang')
                ->whereIn('nama_kategori', $nameChunk)
                ->update([
                    'deskripsi' => 'Data sintetis untuk pengujian beban lokal.',
                    'is_active' => true,
                    'deleted_at' => null,
                    'updated_at' => $now,
                ]);
        }

        $categoryRows = [];

        foreach ($categories as [$name, $description]) {
            if (isset($existingNameLookup[$name])) {
                continue;
            }

            $categoryRows[] = [
                'nama_kategori' => $name,
                'deskripsi' => $description,
                'is_active' => true,
                'created_at' => $now,
                'updated_at' => $now,
            ];
        }

        foreach (array_chunk($categoryRows, 500) as $categoryChunk) {
            DB::table('master_kategori_barang')->insert($categoryChunk);
        }
    }
}
