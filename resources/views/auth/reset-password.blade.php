<x-auth-recovery-layout title="Atur kata sandi baru" description="Gunakan kata sandi minimal 8 karakter. Setelah disimpan, masuk kembali menggunakan kata sandi baru.">
    <form method="POST" action="{{ route('pemohon.password.update') }}" class="space-y-5">
        @csrf
        <input type="hidden" name="token" value="{{ $token }}">
        <div>
            <label for="email" class="mb-2 block text-sm font-medium text-slate-700">Alamat email</label>
            <input id="email" type="email" name="email" value="{{ old('email', $email) }}" autocomplete="email" required
                aria-invalid="{{ $errors->has('email') ? 'true' : 'false' }}" @error('email') aria-describedby="email-error" @enderror
                class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-base focus:border-iwima-blue">
            @error('email') <p id="email-error" role="alert" class="mt-2 text-sm text-red-700">{{ $message }}</p> @enderror
        </div>
        <div>
            <label for="password" class="mb-2 block text-sm font-medium text-slate-700">Kata sandi baru</label>
            <input id="password" type="password" name="password" autocomplete="new-password" minlength="8" required
                aria-invalid="{{ $errors->has('password') ? 'true' : 'false' }}" @error('password') aria-describedby="password-error" @enderror
                class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-base focus:border-iwima-blue">
            @error('password') <p id="password-error" role="alert" class="mt-2 text-sm text-red-700">{{ $message }}</p> @enderror
        </div>
        <div>
            <label for="password_confirmation" class="mb-2 block text-sm font-medium text-slate-700">Ulangi kata sandi baru</label>
            <input id="password_confirmation" type="password" name="password_confirmation" autocomplete="new-password" minlength="8" required class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-base focus:border-iwima-blue">
        </div>
        @error('token') <p role="alert" class="text-sm text-red-700">{{ $message }}</p> @enderror
        <button type="submit" class="w-full rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white hover:bg-sky-900">Simpan kata sandi</button>
        <a href="{{ route('pemohon.password.request') }}" class="block text-center text-sm font-medium text-iwima-blue underline-offset-4 hover:underline">Minta tautan baru</a>
    </form>
</x-auth-recovery-layout>
