<x-filament-panels::page>
    <div class="grid gap-6 xl:grid-cols-[1.2fr_0.8fr]">
        <x-filament::section>
            <p class="text-sm font-semibold uppercase tracking-[0.12em] text-primary-600">Helpdesk IWIMA</p>
            <h2 class="mt-3 text-2xl font-semibold tracking-tight text-gray-950 dark:text-white">
                Layanan teknis untuk kebutuhan kampus
            </h2>
            <p class="mt-3 max-w-2xl text-sm leading-6 text-gray-600 dark:text-gray-300">
                Sampaikan kendala perangkat atau kebutuhan barang kampus. Anda dapat memantau status dan riwayatnya melalui menu layanan.
            </p>

            <div class="mt-6 flex flex-wrap gap-3">
                @if (\App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource::canCreate())
                <x-filament::button
                    :href="route('filament.pemohon.resources.ticket-perbaikan.create')"
                    tag="a"
                    icon="heroicon-m-wrench-screwdriver"
                >
                    Buat tiket perbaikan
                </x-filament::button>
                @endif
                @if (\App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource::canCreate())
                <x-filament::button
                    :href="route('filament.pemohon.resources.pengajuan-barang.create')"
                    tag="a"
                    color="gray"
                    outlined
                    icon="heroicon-m-archive-box"
                >
                    Ajukan barang
                </x-filament::button>
                @endif
            </div>
        </x-filament::section>

        <x-filament::section heading="Pantau layanan" description="Buka daftar atau riwayat layanan yang terkait dengan akun Anda.">
            <nav aria-label="Layanan saya" class="divide-y divide-gray-200 dark:divide-gray-700">
                @if (\App\Filament\Pemohon\Resources\Service\TiketPerbaikans\TiketPerbaikanResource::canViewAny())
                <a href="{{ route('filament.pemohon.resources.ticket-perbaikan.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Tiket perbaikan saya</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
                @if (\App\Filament\Pemohon\Resources\Service\PengajuanBarangs\PengajuanBarangResource::canViewAny())
                <a href="{{ route('filament.pemohon.resources.pengajuan-barang.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Pengajuan barang saya</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
                @if (\App\Filament\Pemohon\Resources\Monitoring\LogTiketPerbaikans\LogTiketPerbaikanResource::canViewAny())
                <a href="{{ route('filament.pemohon.resources.log-perbaikan.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Riwayat perbaikan</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
                @if (\App\Filament\Pemohon\Resources\Monitoring\LogPengajuanBarangs\LogPengajuanBarangResource::canViewAny())
                <a href="{{ route('filament.pemohon.resources.log-pengajuan.index') }}" class="flex min-h-12 items-center justify-between gap-4 py-3 text-sm font-medium text-gray-700 hover:text-primary-600 dark:text-gray-200 dark:hover:text-primary-400">
                    <span>Riwayat pengajuan barang</span>
                    <span aria-hidden="true">→</span>
                </a>
                @endif
            </nav>
        </x-filament::section>
    </div>
    {{ $this->content }}
</x-filament-panels::page>
