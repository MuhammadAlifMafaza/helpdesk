{{-- Page content | Filament pages timeline --}}
@php
    $logs = $getRecord()->timeline()->with('user')->latest()->get();
@endphp

<div class="space-y-4">

    @forelse ($logs as $log)
        <div
            class="
                fi-section-content
                rounded-xl
                border
                border-gray-200
                dark:border-gray-800
                p-4
            ">

            <div class="flex items-center justify-between">

                <div>

                    <p class="font-medium">
                        {{ $log->user?->name ?? 'System' }}
                    </p>

                    <p class="text-xs text-gray-500">
                        {{ $log->created_at->format('d M Y H:i') }}
                    </p>

                </div>

                <span
                    class="
                        inline-flex
                        items-center
                        rounded-md
                        px-2
                        py-1
                        text-xs
                        font-medium
                        ring-1
                        ring-inset
                    ">
                    {{ $log->kategori_log }}
                </span>

            </div>

            @if ($log->data_lama || $log->data_baru)
                <div class="mt-3 text-sm">

                    <span class="font-medium">
                        {{ $log->data_lama }}
                    </span>

                    <span class="mx-2">
                        →
                    </span>

                    <span class="font-medium">
                        {{ $log->data_baru }}
                    </span>

                </div>
            @endif

            @if ($log->keterangan)
                <div class="mt-3 text-sm">

                    {{ $log->keterangan }}

                </div>
            @endif

        </div>

    @empty

        <div
            class="
                rounded-xl
                border
                border-dashed
                border-gray-300
                dark:border-gray-700
                p-6
                text-center
                text-sm
                text-gray-500
            ">

            Belum ada aktivitas.

        </div>
    @endforelse

</div>
