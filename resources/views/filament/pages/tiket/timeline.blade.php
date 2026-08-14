{{-- Page content | Filament pages timeline --}}
@php
    $logs = $getRecord()
        ->timeline()
        ->with('user')
        ->get();
@endphp

<div class="space-y-0">

    @forelse ($logs as $log)

        <div class="relative flex gap-4">

            {{-- Timeline line --}}
            <div class="flex flex-col items-center">
                <div class="flex h-10 w-10 shrink-0 items-center justify-center rounded-full bg-white ring-4 ring-gray-50 dark:bg-gray-900 dark:ring-gray-950
                        {{ match ($log->kategori_log) {
            'Status' => 'text-info-500',
            'Update' => 'text-warning-500',
            'Create' => 'text-success-500',
            'Delete' => 'text-danger-500',
            default => 'text-gray-400',
        } }}">
                    <x-filament::icon :icon="$log->timeline_icon" class="h-5 w-5" />
                </div>

                @if (!$loop->last)
                    <div class="w-px flex-1 bg-gray-200 dark:bg-gray-700"></div>
                @endif
            </div>

            {{-- Content --}}
            <div class="flex-1 pb-8">

                <div class="rounded-xl border border-gray-200 bg-white p-4 shadow-sm dark:border-gray-700 dark:bg-gray-900">

                    {{-- Header --}}
                    <div class="flex flex-wrap items-start justify-between gap-2">

                        <div class="min-w-0">
                            <p class="truncate text-sm font-semibold text-gray-900 dark:text-white">
                                {{ $log->user?->name ?? 'System' }}
                            </p>

                            <p class="text-xs text-gray-400 dark:text-gray-500">
                                {{ $log->created_at->format('d M Y, H:i') }}
                                <span class="mx-1">·</span>
                                {{ $log->created_at->diffForHumans() }}
                            </p>
                        </div>

                        <x-filament::badge :color="match ($log->kategori_log) {
                'Status' => 'info',
                'Update' => 'warning',
                'Create' => 'success',
                'Delete' => 'danger',
                default => 'gray',
            }">
                            {{ $log->kategori_log }}
                        </x-filament::badge>

                    </div>

                    {{-- Title --}}
                    <p class="mt-3 text-sm font-medium text-gray-800 dark:text-gray-200">
                        {{ $log->timeline_title }}
                    </p>

                    {{-- Change data --}}
                    @if ($log->data_lama || $log->data_baru)
                        <div
                            class="mt-3 flex flex-wrap items-center gap-2 rounded-lg bg-gray-50 px-3 py-2 text-xs dark:bg-gray-800/60">

                            <span
                                class="rounded-md bg-danger-50 px-2 py-1 font-medium text-danger-600 line-through decoration-danger-300 dark:bg-danger-500/10 dark:text-danger-400">
                                {{ $log->data_lama ?? '-' }}
                            </span>

                            <x-filament::icon icon="heroicon-m-arrow-long-right" class="h-4 w-4 shrink-0 text-gray-400" />

                            <span
                                class="rounded-md bg-success-50 px-2 py-1 font-medium text-success-700 dark:bg-success-500/10 dark:text-success-400">
                                {{ $log->data_baru ?? '-' }}
                            </span>

                        </div>
                    @endif

                    {{-- Description --}}
                    @if ($log->keterangan)
                        <p class="mt-3 text-sm leading-relaxed text-gray-600 dark:text-gray-300">
                            {{ $log->keterangan }}
                        </p>
                    @endif

                </div>

            </div>

        </div>

    @empty

        <div class="rounded-xl border border-dashed border-gray-300 p-8 text-center dark:border-gray-700">
            <x-filament::icon icon="heroicon-o-clock" class="mx-auto h-8 w-8 text-gray-300 dark:text-gray-600" />
            <p class="mt-2 text-sm text-gray-500">
                Belum ada aktivitas.
            </p>
        </div>

    @endforelse

</div>
