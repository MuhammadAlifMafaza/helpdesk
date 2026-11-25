<x-staff-auth-shell
    :livewire="$this"
    stage="login"
    eyebrow="Login panel staff"
    heading="Masuk ke panel staff"
    description="Gunakan akun resmi teknisi atau administrator untuk mengelola layanan kampus."
>
    <form wire:submit="authenticate" class="space-y-5" novalidate>
        <div>
            <label for="staff-identifier" class="mb-2 block text-sm font-medium text-slate-700">Email atau Username / NIM / NIDN</label>
            <input
                id="staff-identifier"
                type="text"
                wire:model="data.identifier"
                autocomplete="username"
                autofocus
                required
                maxlength="255"
                aria-invalid="{{ $errors->has('data.identifier') ? 'true' : 'false' }}"
                aria-describedby="staff-identifier-error"
                class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-sm text-ink placeholder:text-slate-400 focus:border-iwima-blue focus:outline-none focus:ring-2 focus:ring-iwima-blue/20"
                placeholder="Email, username, NIM, atau NIDN"
            >
            @error('data.identifier')
                <p id="staff-identifier-error" class="mt-2 text-sm text-red-700">{{ $message }}</p>
            @enderror
        </div>

        <div x-data="{ showPassword: false }">
            <div class="mb-2 flex items-center justify-between gap-3">
                <label for="staff-password" class="text-sm font-medium text-slate-700">Kata sandi</label>
                <a href="{{ filament()->getRequestPasswordResetUrl() }}" class="text-sm font-medium text-iwima-blue underline-offset-4 hover:underline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue">
                    Lupa kata sandi?
                </a>
            </div>

            <div class="flex rounded-sm border border-slate-300 bg-white focus-within:border-iwima-blue focus-within:ring-2 focus-within:ring-iwima-blue/20">
                <input
                    id="staff-password"
                    x-bind:type="showPassword ? 'text' : 'password'"
                    wire:model="data.password"
                    autocomplete="current-password"
                    required
                    aria-invalid="{{ $errors->has('data.password') ? 'true' : 'false' }}"
                    aria-describedby="staff-password-error"
                    class="min-w-0 flex-1 border-0 bg-transparent px-4 py-3 text-sm text-ink placeholder:text-slate-400 focus:outline-none focus:ring-0"
                    placeholder="Masukkan kata sandi"
                >
                <button
                    type="button"
                    x-on:click="showPassword = ! showPassword"
                    x-text="showPassword ? 'Sembunyikan' : 'Tampilkan'"
                    x-bind:aria-label="showPassword ? 'Sembunyikan kata sandi' : 'Tampilkan kata sandi'"
                    x-bind:aria-pressed="showPassword.toString()"
                    class="shrink-0 px-4 text-xs font-medium text-iwima-blue hover:underline focus-visible:outline-2 focus-visible:outline-offset-[-4px] focus-visible:outline-iwima-blue"
                ></button>
            </div>

            @error('data.password')
                <p id="staff-password-error" class="mt-2 text-sm text-red-700">{{ $message }}</p>
            @enderror
        </div>

        <label for="staff-remember" class="inline-flex cursor-pointer items-center gap-2 text-sm text-slate-700">
            <input
                id="staff-remember"
                type="checkbox"
                wire:model="data.remember"
                class="size-4 rounded-sm border-slate-400 text-iwima-blue focus:ring-iwima-blue"
            >
            Ingat saya
        </label>

        <button
            type="submit"
            wire:loading.attr="disabled"
            wire:target="authenticate"
            class="flex min-h-11 w-full items-center justify-center rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue disabled:cursor-wait disabled:opacity-70"
        >
            <span wire:loading.remove wire:target="authenticate">Masuk ke panel staff</span>
            <span wire:loading wire:target="authenticate">Memeriksa akun…</span>
        </button>
    </form>
</x-staff-auth-shell>
