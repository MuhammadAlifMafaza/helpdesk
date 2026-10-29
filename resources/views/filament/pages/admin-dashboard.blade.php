<x-filament-panels::page>
    <div class="grid gap-6 xl:grid-cols-[1.4fr_0.8fr]">
        <x-filament::section>
            <div class="max-w-2xl">
                <p class="text-sm font-semibold uppercase tracking-[0.12em] text-primary-600">Helpdesk IWIMA</p>
                <h2 class="mt-3 text-2xl font-semibold tracking-tight text-gray-950 dark:text-white">
                    Pusat layanan teknis kampus
                </h2>
                <p class="mt-3 text-sm leading-6 text-gray-600 dark:text-gray-300">
                    Kelola tiket perbaikan, kebutuhan barang, dan tindak lanjut operasional dari satu tempat.
                </p>
            </div>

            <div class="mt-6 flex flex-wrap gap-3">
                @if (\App\Filament\Resources\TicketServices\TicketServiceResource::canViewAny())
                <x-filament::button
                    :href="route('filament.admin.resources.ticket-services.index')"
                    tag="a"
                    icon="heroicon-m-wrench-screwdriver"
                >
                    Kelola tiket perbaikan
                </x-filament::button>
                @endif
                @if (\App\Filament\Resources\PengajuanBarangs\PengajuanBarangResource::canViewAny())
                <x-filament::button
                    :href="route('filament.admin.resources.pengajuan-barang.index')"
                    tag="a"
                    color="gray"
                    outlined
                    icon="heroicon-m-archive-box"
                >
                    Lihat pengajuan barang
                </x-filament::button>
                @endif
            </div>
        </x-filament::section>

        <x-filament::section heading="Akses cepat" description="Pintasan ke area kerja utama.">
            <nav aria-label="Akses cepat admin" class="divide-y divide-gray-200 dark:divide-gray-700">
                @if (\App\Filament\Resources\KegiatanTeknisi\KegiatanTeknisiResource::canViewAny())
                <a href="{{ route('filament.admin.resources.kegiatan-teknisi.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Kegiatan teknisi</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
                @if (\App\Filament\Resources\Users\UserResource::canViewAny())
                <a href="{{ route('filament.admin.resources.users.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Manajemen pengguna</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
                @if (\App\Filament\Resources\Laporan\LaporanPerbaikans\LaporanPerbaikanResource::canViewAny())
                <a href="{{ route('filament.admin.resources.Laporan-Perbaikan.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Laporan perbaikan</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
            </nav>
        </x-filament::section>
    </div>
    {{ $this->content }}
</x-filament-panels::page>
