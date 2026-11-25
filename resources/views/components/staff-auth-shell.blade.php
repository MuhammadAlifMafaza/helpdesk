@props([
    'livewire',
    'stage' => 'login',
    'eyebrow' => 'Akses internal',
    'heading' => 'Masuk ke panel staff',
    'description' => 'Kelola layanan teknis kampus melalui satu ruang kerja.',
])

<x-filament-panels::layout.base :livewire="$livewire">
    <main class="grid min-h-dvh bg-paper font-sans text-ink lg:grid-cols-[minmax(0,1fr)_minmax(0,1fr)]">
        <section class="flex items-center justify-center px-5 py-8 sm:px-10 lg:px-12 xl:px-20">
            <div class="w-full max-w-md">
                <a href="{{ url('/') }}" class="inline-flex items-center rounded-sm focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-iwima-blue" aria-label="Helpdesk IWIMA, halaman utama">
                    <img src="{{ asset('branding/logo-tag.svg') }}" alt="Helpdesk IWIMA — Sistem Manajemen Pelayanan Internal" class="h-11 w-auto object-contain object-left sm:h-12">
                </a>

                <div class="mt-10 border-l-4 border-iwima-gold pl-5 sm:mt-12">
                    <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">{{ $eyebrow }}</p>
                    <h1 class="mt-3 text-3xl font-semibold tracking-tight text-ink sm:text-4xl">{{ $heading }}</h1>
                    <p class="mt-3 text-sm leading-6 text-slate-600">{{ $description }}</p>
                </div>

                <div class="staff-auth-form mt-8 rounded-sm border border-slate-200 bg-white p-5 shadow-sm sm:p-7">
                    {{ $slot }}
                </div>

                <div class="mt-6 flex flex-wrap items-center justify-between gap-3 border-t border-slate-200 pt-5 text-sm text-slate-600">
                    @if ($stage === 'login')
                        <a href="{{ route('login') }}" class="font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                            Masuk sebagai pemohon
                        </a>
                    @else
                        <a href="{{ filament()->getLoginUrl() }}" class="font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                            Kembali ke login staff
                        </a>
                    @endif

                    <a href="{{ url('/') }}" class="text-slate-500 underline-offset-4 hover:text-iwima-blue hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                        Halaman utama
                    </a>
                </div>

                <p class="mt-5 text-xs leading-5 text-slate-500">Helpdesk IWIMA <span aria-hidden="true">·</span> Panel khusus teknisi dan administrator</p>
            </div>
        </section>

        <aside class="relative hidden min-h-dvh overflow-hidden bg-iwima-blue lg:block">
            <img
                src="{{ asset('images/kampus.png') }}"
                alt=""
                fetchpriority="high"
                class="absolute inset-0 size-full object-cover object-[60%_center]"
            >
            <div class="absolute inset-0 bg-gradient-to-br from-[#00345f]/90 via-iwima-blue/65 to-[#001c35]/90"></div>

            <div class="relative flex min-h-dvh flex-col justify-between px-10 py-10 text-white xl:px-16 xl:py-14">
                <div class="flex items-center gap-3 text-xs font-semibold uppercase tracking-[0.18em] text-blue-100">
                    <span class="size-2 rounded-full bg-iwima-gold"></span>
                    Area kerja internal
                </div>

                <div class="max-w-xl py-12">
                    <p class="text-xs font-semibold uppercase tracking-[0.18em] text-blue-100">Helpdesk IWIMA</p>
                    <h2 class="mt-4 text-3xl font-semibold leading-tight xl:text-5xl">Ruang kendali layanan teknis kampus.</h2>
                    <p class="mt-5 max-w-lg text-base leading-7 text-blue-100">Tangani tiket, pengajuan barang, SLA, dan komunikasi layanan melalui panel kerja staff.</p>

                    <div class="mt-9 grid gap-3 sm:grid-cols-2">
                        <div class="border border-white/20 bg-white/10 p-4 backdrop-blur-sm">
                            <p class="text-sm font-semibold">Penanganan layanan</p>
                            <p class="mt-1 text-xs leading-5 text-blue-100">Pantau progres tiket dan pengajuan.</p>
                        </div>
                        <div class="border border-white/20 bg-white/10 p-4 backdrop-blur-sm">
                            <p class="text-sm font-semibold">Koordinasi staff</p>
                            <p class="mt-1 text-xs leading-5 text-blue-100">Kelola komunikasi dan tindak lanjut.</p>
                        </div>
                    </div>
                </div>

                <p class="border-t border-white/20 pt-5 text-xs text-blue-100">Institut Widya Pratama Pekalongan</p>
            </div>
        </aside>
    </main>
</x-filament-panels::layout.base>
