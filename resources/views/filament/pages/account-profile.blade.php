<x-filament-panels::page>
    @include('filament.pages.partials.account-navigation', ['activePage' => 'profile'])
    <div class="grid w-full min-w-0 gap-6 lg:grid-cols-[minmax(0,1fr)_minmax(0,3fr)]">
        <section
            class="h-fit min-w-0 rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-800 dark:bg-gray-900">
            <div class="flex items-center gap-4">
                <div
                    class="grid size-16 shrink-0 place-items-center rounded-2xl bg-primary-50 text-2xl font-semibold text-primary-700 dark:bg-primary-950 dark:text-primary-300">
                    {{ str($this->getUser()->name)->substr(0, 1)->upper() }}
                </div>
                <div class="min-w-0">
                    <h2 class="break-words text-lg font-semibold text-gray-950 dark:text-white">
                        {{ $this->getUser()->name }}
                    </h2>
                    <p class="break-all text-sm text-gray-500">{{ $this->getUser()->email }}</p>
                </div>
            </div>
            <div class="mt-6 space-y-5 border-t border-gray-100 pt-5 text-sm dark:border-gray-800">
                <div>
                    <p class="text-gray-500">Username / ID</p>
                    <p class="mt-1 break-all font-medium text-gray-950 dark:text-white">
                        {{ $this->getUser()->login_id ?: 'Belum diatur' }}
                    </p>
                </div>
                <div>
                    <p class="text-gray-500">Peran</p>
                    <p class="mt-1 font-medium capitalize text-gray-950 dark:text-white">
                        {{ $this->getUser()->getRoleNames()->join(', ') }}
                    </p>
                </div>
                <div>
                    <p class="text-gray-500">Unit / Bidang</p>
                    <p class="mt-1 font-medium text-gray-950 dark:text-white">
                        {{ $this->getUser()->unit_bidang ?: 'Belum diatur' }}
                    </p>
                </div>
            </div>
        </section>
        <section
            class="w-full min-w-0 rounded-xl border border-gray-200 bg-white p-6 shadow-sm dark:border-gray-800 dark:bg-gray-900 sm:p-8">
            <div class="mb-5">
                <h2 class="text-base font-semibold text-gray-950 dark:text-white">Informasi profil</h2>
                <p class="mt-1 text-sm text-gray-500">Perbarui identitas akun Anda. Penggantian kata sandi tersedia di
                    menu Keamanan.</p>
            </div>
            {{ $this->content }}
            <div class="mt-6 flex justify-end gap-2 border-t border-gray-100 pt-5 dark:border-gray-800">
                @if ($isEditing)
                    <x-filament::button type="button" color="gray" wire:click="cancelEditing">Batal</x-filament::button>
                    <x-filament::button type="button" icon="heroicon-m-check" wire:click="save">Simpan
                        perubahan</x-filament::button>
                @else
                    <x-filament::button type="button" icon="heroicon-m-pencil-square" wire:click="edit">Ubah
                        profil</x-filament::button>
                @endif
            </div>
        </section>
    </div>
</x-filament-panels::page>
