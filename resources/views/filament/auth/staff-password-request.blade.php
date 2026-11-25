<x-staff-auth-shell
    :livewire="$this"
    stage="password-request"
    eyebrow="Pemulihan akun staff"
    heading="Pulihkan akses staff"
    description="Masukkan email akun staff yang terdaftar. Kami akan mengirim tautan untuk mengatur ulang kata sandi."
>
    <form wire:submit="request" class="space-y-5" novalidate>
        <div>
            <label for="staff-reset-email" class="mb-2 block text-sm font-medium text-slate-700">Email akun staff</label>
            <input
                id="staff-reset-email"
                type="email"
                wire:model="data.email"
                autocomplete="email"
                autofocus
                required
                maxlength="255"
                aria-invalid="{{ $errors->has('data.email') ? 'true' : 'false' }}"
                aria-describedby="staff-reset-email-error"
                class="w-full rounded-sm border border-slate-300 bg-white px-4 py-3 text-sm text-ink placeholder:text-slate-400 focus:border-iwima-blue focus:outline-none focus:ring-2 focus:ring-iwima-blue/20"
                placeholder="nama@iwima.ac.id"
            >
            @error('data.email')
                <p id="staff-reset-email-error" class="mt-2 text-sm text-red-700">{{ $message }}</p>
            @enderror
        </div>

        <button
            type="submit"
            wire:loading.attr="disabled"
            wire:target="request"
            class="flex min-h-11 w-full items-center justify-center rounded-sm bg-iwima-blue px-5 py-3 text-sm font-semibold text-white transition-colors hover:bg-sky-900 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-iwima-blue disabled:cursor-wait disabled:opacity-70"
        >
            <span wire:loading.remove wire:target="request">Kirim tautan pemulihan</span>
            <span wire:loading wire:target="request">Mengirim tautan…</span>
        </button>
    </form>
</x-staff-auth-shell>
