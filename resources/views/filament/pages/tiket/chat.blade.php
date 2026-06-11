{{-- Page content | Filament pages chat --}}
@php

    $record = $getRecord();

    $messages = $record->chatLogs()->with('user')->oldest()->get();

@endphp

<div class="space-y-4">

    @forelse($messages as $message)
        <div
            class="
                rounded-xl
                border
                border-gray-200
                dark:border-gray-800
                p-4
            ">

            <div class="flex justify-between">

                <span class="font-medium">

                    {{ $message->user?->name }}

                </span>

                <span class="text-xs text-gray-500">

                    {{ $message->created_at->format('d M Y H:i') }}

                </span>

            </div>

            <div class="mt-2 text-sm">

                {{ $message->keterangan }}

            </div>

        </div>

    @empty

        <div
            class="
                rounded-xl
                border
                border-dashed
                p-6
                text-center
            ">

            Belum ada diskusi.

        </div>
    @endforelse

</div>
