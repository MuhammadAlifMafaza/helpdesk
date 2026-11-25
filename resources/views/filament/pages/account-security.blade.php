<x-filament-panels::page>
    @include('filament.pages.partials.account-navigation', ['activePage' => 'security'])
    <div class="w-full rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-800 dark:bg-gray-900 sm:p-8 lg:p-10">
        <div class="flex items-start justify-between gap-4">
            <div>
                <h2 class="text-base font-semibold text-gray-950 dark:text-white">Kata sandi</h2>
                <p class="mt-1 text-sm text-gray-500">Perbarui kata sandi untuk menjaga keamanan akun Anda.</p>
            </div>
            @if (! $isEditing)
                <x-filament::button icon="heroicon-m-pencil-square" wire:click="edit">Ubah kata sandi</x-filament::button>
            @endif
        </div>

        @if ($isEditing)
            <form wire:submit="save" class="mt-8 space-y-8">
                <div class="grid gap-6 lg:grid-cols-2">
                <label class="block space-y-3 text-sm font-semibold text-gray-800 dark:text-gray-200">Kata sandi saat ini
                    <input type="password" wire:model="currentPassword" autocomplete="current-password" required class="block min-h-14 w-full rounded-xl border border-gray-300 bg-gray-50 px-4 py-3 text-base text-gray-950 shadow-sm outline-none transition placeholder:text-gray-400 focus:border-primary-500 focus:bg-white focus:ring-4 focus:ring-primary-500/15 dark:border-gray-700 dark:bg-gray-950 dark:text-white dark:focus:bg-gray-900">
                    @error('currentPassword') <span class="text-sm text-danger-600">{{ $message }}</span> @enderror
                </label>
                <label class="block space-y-3 text-sm font-semibold text-gray-800 dark:text-gray-200">Kata sandi baru
                    <input type="password" wire:model="password" autocomplete="new-password" required class="block min-h-14 w-full rounded-xl border border-gray-300 bg-gray-50 px-4 py-3 text-base text-gray-950 shadow-sm outline-none transition placeholder:text-gray-400 focus:border-primary-500 focus:bg-white focus:ring-4 focus:ring-primary-500/15 dark:border-gray-700 dark:bg-gray-950 dark:text-white dark:focus:bg-gray-900">
                    @error('password') <span class="text-sm text-danger-600">{{ $message }}</span> @enderror
                </label>
                <label class="block space-y-3 text-sm font-semibold text-gray-800 dark:text-gray-200">Konfirmasi kata sandi baru
                    <input type="password" wire:model="passwordConfirmation" autocomplete="new-password" required class="block min-h-14 w-full rounded-xl border border-gray-300 bg-gray-50 px-4 py-3 text-base text-gray-950 shadow-sm outline-none transition placeholder:text-gray-400 focus:border-primary-500 focus:bg-white focus:ring-4 focus:ring-primary-500/15 dark:border-gray-700 dark:bg-gray-950 dark:text-white dark:focus:bg-gray-900">
                </label>
                </div>
                <div class="flex justify-end gap-2 border-t border-gray-100 pt-5 dark:border-gray-800">
                    <x-filament::button color="gray" wire:click="cancelEditing">Batal</x-filament::button>
                    <x-filament::button type="submit" icon="heroicon-m-check">Simpan kata sandi</x-filament::button>
                </div>
            </form>
        @else
            <p class="mt-6 rounded-lg bg-gray-50 p-4 text-sm text-gray-600 dark:bg-gray-950 dark:text-gray-300">Kata sandi hanya dapat diubah melalui menu Keamanan.</p>
        @endif
    </div>
</x-filament-panels::page>
