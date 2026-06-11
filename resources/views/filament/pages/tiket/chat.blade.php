{{-- Page content | Filament pages chat --}}
@php

    $record = $getRecord();

    $messages = $record->chatLogs()->with('user')->oldest()->get();

@endphp

<div class="space-y-4">

    <div class="
            max-h-[500px]
            overflow-y-auto
            space-y-3
        ">

        @forelse ($messages as $message)
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

                    <span
                        class="
                            text-xs
                            text-gray-500
                        ">

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
                    border-gray-300
                    dark:border-gray-700
                    p-6
                    text-center
                    text-sm
                    text-gray-500
                ">

                Belum ada diskusi.

            </div>
        @endforelse

    </div>

    <form method="POST" action="{{ route('ticket.chat.send', $record->id) }}" class="space-y-3">

        @csrf

        <textarea name="message" rows="3" required
            class="
                block
                w-full
                rounded-xl
                border-gray-300
                dark:border-gray-700
                dark:bg-gray-900
                shadow-sm
            "
            placeholder="Tulis pesan..."></textarea>

        <div class="flex justify-end">

            <button type="submit"
                class="
                    fi-btn
                    fi-btn-color-primary
                ">

                Kirim Pesan

            </button>

        </div>

    </form>

</div>
