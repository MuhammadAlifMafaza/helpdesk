@props(['title', 'description'])
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="theme-color" content="#004B87">
    <meta name="referrer" content="no-referrer">
    <title>{{ $title }} — Helpdesk IWIMA</title>
    <link rel="icon" type="image/svg+xml" href="{{ asset('branding/logo.svg') }}">
    @vite('resources/css/app.css')
</head>
<body class="min-h-screen bg-paper font-sans text-ink antialiased">
    <main class="flex min-h-screen items-center justify-center px-5 py-10 sm:px-8">
        <section class="w-full max-w-md">
            <a href="{{ route('login') }}" class="inline-flex items-center gap-3 text-sm font-semibold tracking-wide text-iwima-blue">
                <img src="{{ asset('branding/logo.svg') }}" alt="" class="size-10">
                HELPDESK IWIMA
            </a>
            <div class="mt-10 border-l-4 border-iwima-gold pl-5">
                <p class="text-xs font-semibold uppercase tracking-[0.16em] text-slate-500">Pemulihan akun pemohon</p>
                <h1 class="mt-3 text-3xl font-semibold tracking-tight">{{ $title }}</h1>
                <p class="mt-3 text-sm leading-6 text-slate-600">{{ $description }}</p>
            </div>
            <div class="mt-8">
                @if (session('status'))
                    <p role="status" class="mb-6 border-l-4 border-iwima-blue bg-white px-4 py-3 text-sm leading-6 text-slate-700">{{ session('status') }}</p>
                @endif
                {{ $slot }}
            </div>
            <div class="mt-8 border-t border-slate-200 pt-5">
                <a href="{{ route('login') }}" class="text-sm font-medium text-iwima-blue underline-offset-4 hover:underline">Kembali ke halaman masuk</a>
                <p class="mt-3 text-xs text-slate-500">Institut Widya Pratama Pekalongan</p>
            </div>
        </section>
    </main>
</body>
</html>
