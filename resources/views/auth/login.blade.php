<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#004B87">
    <title>Masuk — Helpdesk IWIMA</title>
    <link rel="icon" type="image/svg+xml" href="{{ asset('branding/logo.svg') }}">
    @vite('resources/css/app.css')
</head>

<body class="min-h-screen bg-paper font-sans text-ink antialiased">
    <main class="grid min-h-screen lg:grid-cols-[0.9fr_1.1fr]">
        <section class="flex items-center justify-center px-6 py-10 sm:px-10 lg:px-16 xl:px-24">
            <div class="w-full max-w-md">
                <a href="/" class="inline-flex items-center gap-3 rounded-sm focus-visible:outline-2 focus-visible:outline-offset-4 focus-visible:outline-iwima-blue">
                    <img src="{{ asset('branding/logo.svg') }}" alt="" class="h-10 w-10">
                    <span class="text-sm font-semibold tracking-wide text-iwima-blue">HELPDESK IWIMA</span>
                </a>

                <div class="mt-14 border-l-4 border-iwima-gold pl-5 sm:mt-16">
                    <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Portal layanan kampus</p>
                    <h1 class="mt-3 text-3xl font-semibold tracking-tight text-ink sm:text-4xl">Masuk ke Helpdesk</h1>
                    <p class="mt-3 max-w-sm text-base leading-7 text-slate-600">
                        Gunakan akun yang diberikan administrator untuk mengelola layanan atau melihat pengajuan Anda.
                    </p>
                </div>

                <form method="POST" action="{{ route('login') }}" class="mt-9 space-y-5">
                    @csrf

                    @if ($errors->any())
                        <div role="alert" class="border-l-4 border-red-700 bg-red-50 px-4 py-3 text-sm text-red-800">
                            {{ $errors->first() }}
                        </div>
                    @endif

                    <div>
                        <label for="email" class="mb-2 block text-sm font-medium text-slate-700">Alamat email</label>
                        <input
                            id="email"
                            type="email"
                            name="email"
                            value="{{ old('email') }}"
                            autocomplete="username"
                            inputmode="email"
                            required
                            autofocus
                            aria-invalid="{{ $errors->has('email') ? 'true' : 'false' }}"
                            class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-base text-ink placeholder:text-slate-400 focus:border-iwima-blue focus:outline-none focus:ring-2 focus:ring-iwima-blue/20"
                            placeholder="nama@iwima.ac.id"
                        >
                    </div>

                    <div>
                        <label for="password" class="mb-2 block text-sm font-medium text-slate-700">Kata sandi</label>
                        <div class="flex rounded-sm border border-slate-300 bg-white focus-within:border-iwima-blue focus-within:ring-2 focus-within:ring-iwima-blue/20">
                            <input
                                id="password"
                                type="password"
                                name="password"
                                autocomplete="current-password"
                                required
                                class="min-w-0 flex-1 border-0 bg-transparent px-4 py-3 text-base text-ink placeholder:text-slate-400 focus:outline-none focus:ring-0"
                                placeholder="Masukkan kata sandi"
                            >
                            <button
                                type="button"
                                id="togglePassword"
                                aria-label="Tampilkan kata sandi"
                                aria-controls="password"
                                aria-pressed="false"
                                class="shrink-0 px-4 text-sm font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-[-4px] focus-visible:outline-iwima-blue"
                            >
                                Tampilkan
                            </button>
                        </div>
                    </div>

                    <div class="flex flex-wrap items-center justify-between gap-3 text-sm">
                        <label for="remember" class="inline-flex cursor-pointer items-center gap-2 text-slate-700">
                            <input
                                id="remember"
                                type="checkbox"
                                name="remember"
                                value="1"
                                {{ old('remember') ? 'checked' : '' }}
                                class="size-4 rounded-sm border-slate-400 text-iwima-blue focus:ring-iwima-blue"
                            >
                            Ingat saya
                        </label>

                        <a href="{{ route('filament.pemohon.auth.password-reset.request') }}" class="font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                            Lupa kata sandi?
                        </a>
                    </div>

                    <button type="submit" class="w-full rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                        Masuk
                    </button>
                </form>

                <div class="mt-8 border-t border-slate-200 pt-5 text-sm text-slate-600">
                    <a href="/" class="font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                        Kembali ke halaman utama
                    </a>
                    <p class="mt-3 text-xs text-slate-500">Institut Widya Pratama Pekalongan</p>
                </div>
            </div>
        </section>

        <aside class="relative hidden min-h-screen overflow-hidden bg-iwima-blue lg:block">
            <img
                src="{{ asset('images/kampus.png') }}"
                alt=""
                fetchpriority="high"
                class="absolute inset-0 size-full object-cover object-[60%_center]"
            >
            <div class="absolute inset-x-0 bottom-0 border-t-4 border-iwima-gold bg-iwima-blue px-10 py-8 text-white xl:px-14 xl:py-10">
                <p class="text-xs font-semibold uppercase tracking-[0.18em] text-blue-100">Institut Widya Pratama Pekalongan</p>
                <h2 class="mt-3 max-w-xl text-2xl font-semibold leading-tight xl:text-3xl">Satu portal untuk dukungan teknologi kampus.</h2>
                <p class="mt-3 max-w-xl text-sm leading-6 text-blue-100">Laporkan kendala, ajukan kebutuhan, dan ikuti proses penanganannya.</p>
            </div>
        </aside>
    </main>

    <script>
        const passwordInput = document.getElementById('password');
        const togglePassword = document.getElementById('togglePassword');

        togglePassword.addEventListener('click', () => {
            const shouldShowPassword = passwordInput.type === 'password';

            passwordInput.type = shouldShowPassword ? 'text' : 'password';
            togglePassword.textContent = shouldShowPassword ? 'Sembunyikan' : 'Tampilkan';
            togglePassword.setAttribute('aria-label', shouldShowPassword ? 'Sembunyikan kata sandi' : 'Tampilkan kata sandi');
            togglePassword.setAttribute('aria-pressed', String(shouldShowPassword));
        });
    </script>
</body>

</html>
