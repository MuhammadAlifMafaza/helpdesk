<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#F7F6F1">
    <link rel="icon" type="image/svg+xml" href="{{ asset('branding/logo.svg') }}">
    <title>{{ config('app.name') }} — Institut Widya Pratama Pekalongan</title>
    @vite('resources/css/app.css')
</head>

<body class="bg-paper font-sans text-ink antialiased">
    <a href="#konten-utama" class="sr-only focus:not-sr-only focus:absolute focus:z-50 focus:bg-white focus:p-4 focus:text-iwima-blue">Lewati ke konten utama</a>
    <header class="border-b border-slate-200">
        <nav aria-label="Navigasi utama" class="mx-auto flex max-w-7xl flex-wrap items-center justify-between gap-4 px-5 py-4 sm:px-8 lg:px-12">
            <a href="/" class="inline-flex min-w-0 items-center gap-3 rounded-sm focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-iwima-blue">
                <img src="{{ asset('branding/logo.svg') }}" alt="" class="size-10 shrink-0">
                <span class="min-w-0">
                    <span class="block text-sm font-bold tracking-wide text-iwima-blue">HELPDESK IWIMA</span>
                    <span class="mt-0.5 hidden text-xs text-slate-500 sm:block">Layanan teknologi kampus</span>
                </span>
            </a>

            <div class="flex shrink-0 items-center gap-3 sm:gap-5">
                <a href="{{ route('filament.admin.auth.login') }}" class="text-sm font-medium text-slate-700 underline-offset-4 hover:text-iwima-blue hover:underline">
                    Panel staf
                </a>
                <a href="{{ route('login') }}" class="inline-flex min-h-10 items-center justify-center rounded-sm bg-iwima-blue px-4 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                    Masuk
                </a>
            </div>
        </nav>
    </header>

    <main id="konten-utama">
        <section class="mx-auto grid max-w-7xl items-center gap-10 px-5 py-12 sm:px-8 sm:py-16 lg:grid-cols-[0.88fr_1.12fr] lg:gap-14 lg:px-12 lg:py-20">
            <div class="max-w-2xl">
                <p class="flex items-center gap-3 text-xs font-semibold uppercase tracking-[0.16em] text-iwima-blue">
                    <span aria-hidden="true" class="h-1 w-8 bg-iwima-gold"></span>
                    Layanan teknis dan perawatan infrastruktur
                </p>
                <h1 class="mt-6 max-w-xl text-4xl font-semibold leading-[1.15] tracking-tight text-ink sm:text-5xl">
                    Dukungan teknologi kampus, lewat satu portal.
                </h1>
                <p class="mt-6 max-w-xl text-base leading-7 text-slate-600 sm:text-lg">
                    Laporkan gangguan, ajukan kebutuhan barang, dan pantau tindak lanjut dari tim Helpdesk IWIMA.
                </p>
                <div class="mt-8 flex flex-wrap items-center gap-x-5 gap-y-3">
                    <a href="{{ route('login') }}" class="inline-flex min-h-12 items-center justify-center rounded-sm bg-iwima-blue px-6 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                        Masuk ke portal
                    </a>
                </div>
            </div>

            <figure class="relative min-w-0">
                <img
                    src="{{ asset('images/kampus.png') }}"
                    alt="Gedung Institut Widya Pratama Pekalongan"
                    fetchpriority="high"
                    class="aspect-[4/3] w-full border border-slate-200 object-cover object-center sm:aspect-[16/10]"
                >
                <figcaption class="flex flex-wrap items-center justify-between gap-3 border-b border-slate-200 bg-white px-4 py-3 text-sm sm:px-5">
                    <span class="font-medium text-ink">Institut Widya Pratama</span>
                    <span class="text-slate-500">Pekalongan, Jawa Tengah</span>
                </figcaption>
            </figure>
        </section>

        <section aria-label="Ringkasan layanan" class="border-y border-slate-200 bg-white">
            <div class="mx-auto grid max-w-7xl grid-cols-2 px-5 sm:px-8 lg:grid-cols-4 lg:px-12">
                <div class="border-b border-r border-slate-200 py-6 pr-4 sm:py-7 lg:border-b-0 lg:pr-6">
                    <p class="text-3xl font-semibold tabular-nums tracking-tight text-iwima-blue sm:text-4xl">{{ number_format($statistik['tiket']) }}</p>
                    <p class="mt-2 text-sm text-slate-600">Tiket perbaikan</p>
                </div>
                <div class="border-b border-slate-200 py-6 pl-4 sm:py-7 lg:border-b-0 lg:border-r lg:px-6">
                    <p class="text-3xl font-semibold tabular-nums tracking-tight text-iwima-blue sm:text-4xl">{{ number_format($statistik['tiket_selesai']) }}</p>
                    <p class="mt-2 text-sm text-slate-600">Tiket selesai</p>
                </div>
                <div class="border-r border-slate-200 py-6 pr-4 sm:py-7 lg:px-6">
                    <p class="text-3xl font-semibold tabular-nums tracking-tight text-iwima-blue sm:text-4xl">{{ number_format($statistik['pengajuan']) }}</p>
                    <p class="mt-2 text-sm text-slate-600">Pengajuan barang</p>
                </div>
                <div class="py-6 pl-4 sm:py-7 lg:pl-6">
                    <p class="text-3xl font-semibold tabular-nums tracking-tight text-iwima-blue sm:text-4xl">{{ number_format($statistik['kegiatan']) }}</p>
                    <p class="mt-2 text-sm text-slate-600">Kegiatan teknisi</p>
                </div>
            </div>
        </section>

        <section class="mx-auto max-w-7xl px-5 py-14 sm:px-8 sm:py-16 lg:px-12 lg:py-20">
            <div class="grid gap-8 lg:grid-cols-[0.72fr_1.28fr] lg:gap-16">
                <div>
                    <p class="text-xs font-semibold uppercase tracking-[0.16em] text-iwima-blue">Ruang lingkup layanan</p>
                    <h2 class="mt-3 max-w-sm text-2xl font-semibold leading-tight tracking-tight sm:text-3xl">Apa yang dapat Anda urus di sini?</h2>
                </div>

                <div class="divide-y divide-slate-200 border-y border-slate-200">
                    <article class="grid gap-3 py-5 sm:grid-cols-[5rem_1fr] sm:gap-5 sm:py-6">
                        <p class="text-xs font-semibold tracking-[0.12em] text-iwima-blue">01 / TIKET</p>
                        <div>
                            <h3 class="font-semibold">Gangguan perangkat dan infrastruktur</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Sampaikan masalah, sertakan informasi yang diperlukan, lalu ikuti proses penanganannya.</p>
                        </div>
                    </article>
                    <article class="grid gap-3 py-5 sm:grid-cols-[5rem_1fr] sm:gap-5 sm:py-6">
                        <p class="text-xs font-semibold tracking-[0.12em] text-iwima-blue">02 / BARANG</p>
                        <div>
                            <h3 class="font-semibold">Kebutuhan barang teknis</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Ajukan barang melalui alur yang tercatat dan dapat dipantau.</p>
                        </div>
                    </article>
                    <article class="grid gap-3 py-5 sm:grid-cols-[5rem_1fr] sm:gap-5 sm:py-6">
                        <p class="text-xs font-semibold tracking-[0.12em] text-iwima-blue">03 / STATUS</p>
                        <div>
                            <h3 class="font-semibold">Pembaruan tindak lanjut</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Lihat status dan riwayat aktivitas layanan pada akun Anda.</p>
                        </div>
                    </article>
                </div>
            </div>
        </section>

        <section class="border-y border-slate-200 bg-[#efeee7]">
            <div class="mx-auto max-w-7xl px-5 py-14 sm:px-8 sm:py-16 lg:px-12">
                <div class="max-w-2xl">
                    <p class="text-xs font-semibold uppercase tracking-[0.16em] text-iwima-blue">Alur layanan</p>
                    <h2 class="mt-3 text-2xl font-semibold tracking-tight sm:text-3xl">Dari laporan hingga tindak lanjut</h2>
                </div>
                <ol class="mt-8 grid gap-0 border-y border-slate-300 md:grid-cols-3 md:divide-x md:divide-slate-300">
                    <li class="grid grid-cols-[2.5rem_1fr] gap-4 border-b border-slate-300 py-5 md:border-b-0 md:px-5 md:first:pl-0 md:last:pr-0">
                        <span class="flex size-9 items-center justify-center bg-iwima-gold text-sm font-bold text-iwima-blue">1</span>
                        <div>
                            <h3 class="font-semibold">Masuk ke portal</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Gunakan akun yang diberikan administrator.</p>
                        </div>
                    </li>
                    <li class="grid grid-cols-[2.5rem_1fr] gap-4 border-b border-slate-300 py-5 md:border-b-0 md:px-5">
                        <span class="flex size-9 items-center justify-center bg-iwima-gold text-sm font-bold text-iwima-blue">2</span>
                        <div>
                            <h3 class="font-semibold">Kirim kebutuhan</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Pilih tiket perbaikan atau pengajuan barang.</p>
                        </div>
                    </li>
                    <li class="grid grid-cols-[2.5rem_1fr] gap-4 py-5 md:px-5 md:last:pr-0">
                        <span class="flex size-9 items-center justify-center bg-iwima-gold text-sm font-bold text-iwima-blue">3</span>
                        <div>
                            <h3 class="font-semibold">Pantau prosesnya</h3>
                            <p class="mt-1 text-sm leading-6 text-slate-600">Periksa status dan riwayat dari akun Anda.</p>
                        </div>
                    </li>
                </ol>
            </div>
        </section>

    </main>

    <x-helpdesk-footer />
</body>

</html>
