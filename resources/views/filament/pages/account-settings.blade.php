<x-filament-panels::page>
    @include('filament.pages.partials.account-navigation', ['activePage' => 'settings'])
    <div class="w-full space-y-6">
        <div class="w-full rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-800 dark:bg-gray-900 sm:p-8 lg:p-10">
            <h2 class="text-base font-semibold text-gray-950 dark:text-white">Preferensi tampilan</h2>
            <p class="mt-1 text-sm text-gray-500">Atur pengalaman Helpdesk sesuai kebutuhan Anda.</p>
            <form wire:submit="save" class="mt-6 space-y-6">
                <label class="block space-y-2 text-sm font-medium">Bahasa
                    <select wire:model.live="preferences.locale" @disabled(! $isEditing) class="fi-input w-full rounded-lg border-gray-300 dark:border-gray-700 dark:bg-gray-950">
                        <option value="id">Bahasa Indonesia</option><option value="en">English</option>
                    </select>
                </label>
                <label class="block space-y-2 text-sm font-medium">Zona waktu
                    <select wire:model.live="preferences.timezone" @disabled(! $isEditing) class="fi-input w-full rounded-lg border-gray-300 dark:border-gray-700 dark:bg-gray-950">
                        <option value="Asia/Jakarta">WIB — Asia/Jakarta</option><option value="Asia/Makassar">WITA — Asia/Makassar</option><option value="Asia/Jayapura">WIT — Asia/Jayapura</option>
                    </select>
                </label>
                <label class="block space-y-2 text-sm font-medium">Tema
                    <select wire:model.live="preferences.theme" @disabled(! $isEditing) class="fi-input w-full rounded-lg border-gray-300 dark:border-gray-700 dark:bg-gray-950">
                        <option value="system">Ikuti perangkat</option><option value="light">Terang</option><option value="dark">Gelap</option>
                    </select>
                </label>
                <label class="flex items-center gap-3 rounded-lg bg-gray-50 p-4 text-sm dark:bg-gray-950">
                    <input type="checkbox" wire:model.live="preferences.notifications" @disabled(! $isEditing) class="rounded border-gray-300 text-primary-600">
                    <span><span class="block font-medium">Notifikasi layanan</span><span class="text-gray-500">Terima pemberitahuan di panel saat ada pembaruan layanan.</span></span>
                </label>
                <div class="flex justify-end gap-2 border-t border-gray-100 pt-5 dark:border-gray-800">
                    @if ($isEditing)
                        <x-filament::button type="button" color="gray" wire:click="cancelEditing">Batal</x-filament::button>
                        <x-filament::button type="submit" icon="heroicon-m-check" wire:loading.attr="disabled" wire:target="save">Simpan pengaturan</x-filament::button>
                    @else
                        <x-filament::button type="button" icon="heroicon-m-pencil-square" wire:click="edit">Ubah pengaturan</x-filament::button>
                    @endif
                </div>
            </form>
        </div>
    </div>
</x-filament-panels::page>
