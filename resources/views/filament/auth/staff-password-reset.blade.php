<x-staff-auth-shell
    :livewire="$this"
    stage="password-reset"
    eyebrow="Keamanan akun staff"
    heading="Buat kata sandi baru"
    description="Pilih kata sandi yang kuat dan mudah Anda simpan dengan aman."
>
    <form wire:submit="resetPassword" class="space-y-5" novalidate>
        <div>
            <label for="staff-reset-email" class="mb-2 block text-sm font-medium text-slate-700">Email akun</label>
            <input
                id="staff-reset-email"
                type="email"
                wire:model="email"
                autocomplete="email"
                disabled
                class="w-full rounded-sm border border-slate-300 bg-slate-100 px-4 py-3 text-sm text-slate-600"
            >
        </div>

        <div x-data="{ showPassword: false }">
            <label for="staff-new-password" class="mb-2 block text-sm font-medium text-slate-700">Kata sandi baru</label>
            <div class="flex rounded-sm border border-slate-300 bg-white focus-within:border-iwima-blue focus-within:ring-2 focus-within:ring-iwima-blue/20">
                <input
                    id="staff-new-password"
                    x-bind:type="showPassword ? 'text' : 'password'"
                    wire:model="password"
                    autocomplete="new-password"
                    required
                    aria-invalid="{{ $errors->has('password') ? 'true' : 'false' }}"
                    aria-describedby="staff-new-password-error"
                    class="min-w-0 flex-1 border-0 bg-transparent px-4 py-3 text-sm text-ink focus:outline-none focus:ring-0"
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
            @error('password')
                <p id="staff-new-password-error" class="mt-2 text-sm text-red-700">{{ $message }}</p>
            @enderror
        </div>

        <div x-data="{ showPassword: false }">
            <label for="staff-new-password-confirmation" class="mb-2 block text-sm font-medium text-slate-700">Konfirmasi kata sandi baru</label>
            <div class="flex rounded-sm border border-slate-300 bg-white focus-within:border-iwima-blue focus-within:ring-2 focus-within:ring-iwima-blue/20">
                <input
                    id="staff-new-password-confirmation"
                    x-bind:type="showPassword ? 'text' : 'password'"
                    wire:model="passwordConfirmation"
                    autocomplete="new-password"
                    required
                    aria-invalid="{{ $errors->has('passwordConfirmation') ? 'true' : 'false' }}"
                    aria-describedby="staff-new-password-confirmation-error"
                    class="min-w-0 flex-1 border-0 bg-transparent px-4 py-3 text-sm text-ink focus:outline-none focus:ring-0"
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
            @error('passwordConfirmation')
                <p id="staff-new-password-confirmation-error" class="mt-2 text-sm text-red-700">{{ $message }}</p>
            @enderror
        </div>

        <button
            type="submit"
            wire:loading.attr="disabled"
            wire:target="resetPassword"
            class="flex min-h-11 w-full items-center justify-center rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue disabled:cursor-wait disabled:opacity-70"
        >
            <span wire:loading.remove wire:target="resetPassword">Simpan kata sandi baru</span>
            <span wire:loading wire:target="resetPassword">Memperbarui kata sandi…</span>
        </button>
    </form>
</x-staff-auth-shell>
