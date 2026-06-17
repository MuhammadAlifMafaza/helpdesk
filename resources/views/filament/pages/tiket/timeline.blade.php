{{-- Page content | Filament pages timeline --}}
@php
    $logs = $getRecord()
        ->timeline()
        ->with('user')
        ->get();
@endphp

<div class="space-y-6">

    @forelse ($logs as $log)

        <div class="relative flex gap-4">

            {{-- Timeline line --}}
            <div class="flex flex-col items-center">
                <div class="flex h-10 w-10 items-center justify-center rounded-full bg-gray-100 dark:bg-gray-800">
                    <x-filament::icon
                        :icon="$log->timeline_icon"
                        class="h-5 w-5 text-gray-600 dark:text-gray-300"
                    />
                </div>

                @if (! $loop->last)
                    <div class="mt-1 w-px flex-1 bg-gray-200 dark:bg-gray-700"></div>
                @endif
            </div>

            {{-- Content --}}
            <div class="flex-1 pb-6">

                {{-- Header --}}
                <div class="flex items-start justify-between gap-2">

                    <div>
                        <p class="text-sm font-semibold text-gray-900 dark:text-white">
                            {{ $log->user?->name ?? 'System' }}
                        </p>

                        <p class="text-xs text-gray-500">
                            {{ $log->created_at->format('d M Y H:i') }}
                        </p>
                    </div>

                    <x-filament::badge
                        :color="match($log->kategori_log) {
                            'Status' => 'info',
                            'Update' => 'warning',
                            'Create' => 'success',
                            'Delete' => 'danger',
                            default => 'gray',
                        }"
                    >
                        {{ $log->kategori_log }}
                    </x-filament::badge>

                </div>

                {{-- Title --}}
                <p class="mt-2 text-sm font-medium text-gray-800 dark:text-gray-200">
                    {{ $log->timeline_title }}
                </p>

                {{-- Change data --}}
                @if ($log->data_lama || $log->data_baru)
                    <div class="mt-2 text-sm text-gray-600 dark:text-gray-300">

                        <span class="font-medium">
                            {{ $log->data_lama ?? '-' }}
                        </span>

                        <span class="mx-2 text-gray-400">→</span>

                        <span class="font-medium">
                            {{ $log->data_baru ?? '-' }}
                        </span>

                    </div>
                @endif

                {{-- Description --}}
                @if ($log->keterangan)
                    <p class="mt-2 text-sm text-gray-600 dark:text-gray-300">
                        {{ $log->keterangan }}
                    </p>
                @endif

            </div>

        </div>

    @empty

        <div class="rounded-xl border border-dashed border-gray-300 p-6 text-center text-sm text-gray-500 dark:border-gray-700">
            Belum ada aktivitas.
        </div>

    @endforelse

</div>