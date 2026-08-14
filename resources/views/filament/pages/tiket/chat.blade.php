@php
    $record = $getRecord();

    $messages = $record
        ->chatLogs()
        ->with('user')
        ->oldest('created_at')
        ->get();

    $currentUser = auth()->id();
@endphp

<style>
    .ticket-chat {
        width: 100%;
        font-family: inherit;
    }

    /* ==============================
       HEADER
    ============================== */

    .ticket-chat-header {
        margin-bottom: 16px;
    }

    .ticket-chat-title {
        font-size: 15px;
        font-weight: 600;
        line-height: 1.4;
        color: #111827;
    }

    .ticket-chat-description {
        margin-top: 3px;
        font-size: 13px;
        color: #6b7280;
    }

    /* ==============================
       MESSAGE AREA
    ============================== */

    .ticket-chat-messages {
        display: flex;
        flex-direction: column;
        gap: 12px;

        max-height: 420px;
        overflow-y: auto;

        padding: 4px 4px 8px 4px;
    }

    /* ==============================
       MESSAGE
    ============================== */

    .ticket-message {
        display: flex;
        width: 100%;
    }

    .ticket-message.mine {
        justify-content: flex-end;
    }

    .ticket-message.other {
        justify-content: flex-start;
    }

    .ticket-message-card {
        width: auto;
        max-width: 75%;

        padding: 10px 14px;

        border-radius: 12px;
        border: 1px solid #e5e7eb;

        background: #f9fafb;
    }

    .ticket-message.mine .ticket-message-card {
        background: #eff6ff;
        border-color: #bfdbfe;
    }

    /* ==============================
       USER INFO
    ============================== */

    .ticket-message-header {
        display: flex;
        align-items: center;
        gap: 8px;

        margin-bottom: 5px;
    }

    .ticket-user-badge {
        display: inline-flex;
        align-items: center;
        justify-content: center;

        width: 26px;
        height: 26px;

        flex-shrink: 0;

        border-radius: 50%;

        background: #e5e7eb;
        color: #374151;

        font-size: 11px;
        font-weight: 600;
    }

    .ticket-message.mine .ticket-user-badge {
        background: #2563eb;
        color: white;
    }

    .ticket-user-name {
        font-size: 12px;
        font-weight: 600;

        color: #374151;
    }

    .ticket-user-role {
        font-size: 11px;
        color: #9ca3af;
    }

    .ticket-message-time {
        margin-left: auto;

        font-size: 10px;
        color: #9ca3af;
    }

    /* ==============================
       MESSAGE CONTENT
    ============================== */

    .ticket-message-content {
        font-size: 13px;
        line-height: 1.5;

        color: #374151;

        white-space: pre-wrap;
        word-break: break-word;
    }

    .ticket-message.mine .ticket-message-content {
        color: #1e3a8a;
    }

    /* ==============================
       EMPTY STATE
    ============================== */

    .ticket-chat-empty {
        padding: 28px 20px;

        border: 1px dashed #d1d5db;
        border-radius: 12px;

        text-align: center;

        color: #6b7280;
        background: #fafafa;
    }

    .ticket-chat-empty-title {
        font-size: 13px;
        font-weight: 500;
    }

    .ticket-chat-empty-description {
        margin-top: 3px;

        font-size: 11px;
        color: #9ca3af;
    }

    /* ==============================
       COMPOSER
    ============================== */

    .ticket-chat-composer {
        margin-top: 14px;

        padding-top: 14px;

        border-top: 1px solid #e5e7eb;
    }

    .ticket-chat-form {
        display: flex;
        align-items: flex-end;

        gap: 8px;
    }

    .ticket-chat-input {
        flex: 1;

        min-height: 42px;
        max-height: 110px;

        padding: 10px 12px;

        border: 1px solid #d1d5db;
        border-radius: 10px;

        background: white;

        font-family: inherit;
        font-size: 13px;

        resize: vertical;

        outline: none;

        transition:
            border-color 0.15s ease,
            box-shadow 0.15s ease;
    }

    .ticket-chat-input:focus {
        border-color: #2563eb;

        box-shadow:
            0 0 0 2px rgba(37, 99, 235, 0.12);
    }

    .ticket-chat-send {
        display: inline-flex;

        align-items: center;
        justify-content: center;

        width: 42px;
        height: 42px;

        flex-shrink: 0;

        border: none;
        border-radius: 10px;

        background: #2563eb;
        color: white;

        cursor: pointer;

        transition:
            background-color 0.15s ease,
            transform 0.1s ease;
    }

    .ticket-chat-send:hover {
        background: #1d4ed8;
    }

    .ticket-chat-send:active {
        transform: scale(0.96);
    }

    .ticket-chat-send:disabled {
        opacity: 0.5;
        cursor: not-allowed;
    }

    /* ==============================
       SEND ICON
    ============================== */

    .ticket-chat-send-icon {
        width: 17px;
        height: 17px;

        display: block;
    }

    /* ==============================
       HELPER TEXT
    ============================== */

    .ticket-chat-helper {
        margin-top: 6px;

        font-size: 11px;
        color: #9ca3af;
    }

    /* ==============================
       CLOSED
    ============================== */

    .ticket-chat-closed {
        margin-top: 14px;

        padding: 12px;

        border: 1px dashed #d1d5db;
        border-radius: 10px;

        text-align: center;

        font-size: 12px;

        color: #6b7280;
        background: #fafafa;
    }

    /* ==============================
       SCROLLBAR
    ============================== */

    .ticket-chat-messages::-webkit-scrollbar {
        width: 5px;
    }

    .ticket-chat-messages::-webkit-scrollbar-track {
        background: transparent;
    }

    .ticket-chat-messages::-webkit-scrollbar-thumb {
        background: #d1d5db;
        border-radius: 999px;
    }
</style>


<div class="ticket-chat">

    {{-- ============================================================
         HEADER
    ============================================================= --}}

    {{-- <div class="ticket-chat-header">

        <div class="ticket-chat-title">
            Diskusi Tiket
        </div>

        <div class="ticket-chat-description">
            Komunikasi terkait penanganan tiket
        </div>

    </div> --}}


    {{-- ============================================================
         MESSAGE LIST
    ============================================================= --}}

    <div class="ticket-chat-messages">

        @forelse($messages as $message)

            @php
                $isMine = $message->user_id === $currentUser;

                $userName = $message->user?->name ?? 'Unknown User';

                $initial = strtoupper(
                    mb_substr($userName, 0, 1)
                );
            @endphp


            <div
                class="ticket-message {{ $isMine ? 'mine' : 'other' }}"
            >

                <div class="ticket-message-card">

                    {{-- User --}}
                    <div class="ticket-message-header">

                        <span class="ticket-user-badge">
                            {{ $initial }}
                        </span>

                        <div>

                            <div class="ticket-user-name">
                                {{ $userName }}
                            </div>

                            <div class="ticket-user-role">
                                {{ $message->user?->roles?->first()?->name ?? 'User' }}
                            </div>

                        </div>

                        <span class="ticket-message-time">
                            {{ $message->created_at->format('d M Y H:i') }}
                        </span>

                    </div>


                    {{-- Message --}}
                    <div class="ticket-message-content">
                        {{ $message->keterangan }}
                    </div>

                </div>

            </div>

        @empty

            <div class="ticket-chat-empty">

                <div class="ticket-chat-empty-title">
                    Belum ada diskusi
                </div>

                <div class="ticket-chat-empty-description">
                    Belum ada pesan pada tiket ini.
                </div>

            </div>

        @endforelse

    </div>


    {{-- ============================================================
         COMPOSER
    ============================================================= --}}

    @if($record->status !== 'Close')

        <div class="ticket-chat-composer">

            <form
                wire:submit="sendChatMessage"
                class="ticket-chat-form"
            >

                <textarea
                    wire:model="chatMessage"
                    class="ticket-chat-input"
                    rows="1"
                    placeholder="Tulis komentar atau informasi terkait tiket..."
                    x-on:keydown.enter="
                    if (!$event.shiftKey) {
                        $event.preventDefault();
                        $el.form.requestSubmit();
                    }"

                ></textarea>


                {{-- SEND BUTTON --}}
                <button
                    type="submit"
                    class="ticket-chat-send"
                    wire:loading.attr="disabled"
                    wire:target="sendChatMessage"
                    title="Kirim pesan"
                >

                    {{-- SVG INLINE, BUKAN COMPONENT ICON --}}
                    <svg
                        class="ticket-chat-send-icon"
                        viewBox="0 0 24 24"
                        fill="none"
                        xmlns="http://www.w3.org/2000/svg"
                        aria-hidden="true"
                    >
                        <path
                            d="M22 2L11 13"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        />

                        <path
                            d="M22 2L15 22L11 13L2 9L22 2Z"
                            stroke="currentColor"
                            stroke-width="2"
                            stroke-linecap="round"
                            stroke-linejoin="round"
                        />
                    </svg>

                </button>

            </form>


            <div class="ticket-chat-helper">
                Gunakan diskusi untuk menyampaikan informasi terkait tiket.
            </div>

        </div>

    @else

        <div class="ticket-chat-closed">
            Tiket telah ditutup. Diskusi baru tidak dapat dikirim.
        </div>

    @endif

</div>
