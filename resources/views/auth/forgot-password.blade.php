<x-auth-recovery-layout title="Lupa kata sandi?" description="Masukkan alamat email akun pemohon. Kami akan mengirimkan tautan untuk membuat kata sandi baru.">
    <form method="POST" action="{{ route('pemohon.password.email') }}" class="space-y-5">
        @csrf
        <div>
            <label for="email" class="mb-2 block text-sm font-medium text-slate-700">Alamat email</label>
            <input id="email" type="email" name="email" value="{{ old('email') }}" autocomplete="email" required autofocus
                aria-invalid="{{ $errors->has('email') ? 'true' : 'false' }}" @error('email') aria-describedby="email-error" @enderror
                class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-base focus:border-iwima-blue" placeholder="nama@iwima.ac.id">
            @error('email') <p id="email-error" role="alert" class="mt-2 text-sm text-red-700">{{ $message }}</p> @enderror
        </div>
        <button type="submit" class="w-full rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white hover:bg-sky-900">Kirim tautan reset</button>
    </form>
    <p class="mt-5 text-sm leading-6 text-slate-600">Untuk akun admin atau teknisi, gunakan pemulihan kata sandi pada <a href="{{ route('filament.admin.auth.password-reset.request') }}" class="font-medium text-iwima-blue underline underline-offset-4">panel staf</a>.</p>
</x-auth-recovery-layout>
