{{-- Page content | Filament pages timeline --}}

@php
    $logs = $getRecord()
        ->timeline()
        ->with('user')
        ->get();
@endphp

<style>
    /* =========================================================
       TICKET TIMELINE
       CSS dibuat khusus agar tidak bergantung pada Tailwind
       ========================================================= */

    .ticket-timeline {
        width: 100%;
        padding: 28px 24px 32px;
        box-sizing: border-box;
    }

    .ticket-timeline-list {
        width: 100%;
        margin: 0;
        padding: 0;
    }

    /* ---------------------------------------------------------
       ITEM
       --------------------------------------------------------- */

    .ticket-timeline-item {
        position: relative;
        display: grid;
        grid-template-columns: 28px minmax(0, 1fr);
        column-gap: 14px;
        width: 100%;
        box-sizing: border-box;
    }

    /* ---------------------------------------------------------
       TIMELINE LEFT COLUMN
       --------------------------------------------------------- */

    .ticket-timeline-marker {
        position: relative;
        width: 28px;
        min-height: 100%;
        display: flex;
        justify-content: center;
        align-items: flex-start;
    }

    /* garis vertikal */

    .ticket-timeline-line {
        position: absolute;
        top: 13px;
        bottom: -10px;
        left: 50%;
        width: 2px;
        transform: translateX(-50%);
        background: #d1d5db;
        z-index: 1;
    }

    /* titik */

    .ticket-timeline-dot {
        position: relative;
        z-index: 3;
        width: 13px;
        height: 13px;
        margin-top: 3px;
        border-radius: 50%;
        background: #6b7280;
        border: 3px solid #ffffff;
        box-sizing: content-box;
        box-shadow: 0 0 0 1px #d1d5db;
    }

    /* ---------------------------------------------------------
       CONTENT
       --------------------------------------------------------- */

    .ticket-timeline-content {
        min-width: 0;
        padding: 0 0 34px;
    }

    .ticket-timeline-date {
        margin: 0;
        padding: 0;
        font-size: 13px;
        line-height: 20px;
        font-weight: 500;
        color: #6b7280;
    }

    .ticket-timeline-user {
        margin-top: 2px;
        font-size: 14px;
        line-height: 21px;
        font-weight: 600;
        color: #111827;
    }

    .ticket-timeline-category {
        display: inline-flex;
        align-items: center;
        width: fit-content;
        margin-top: 5px;
        padding: 2px 8px;
        border-radius: 5px;
        border: 1px solid #d1d5db;
        background: #f9fafb;
        color: #4b5563;
        font-size: 11px;
        line-height: 16px;
        font-weight: 500;
    }

    /* ---------------------------------------------------------
       TITLE / CHAT MESSAGE
       --------------------------------------------------------- */

    .ticket-timeline-message {
        width: min(100%, 600px);
        margin-top: 9px;
        padding: 10px 13px;
        box-sizing: border-box;

        border: 1px solid #e5e7eb;
        border-radius: 8px;

        background: #f9fafb;

        color: #374151;
        font-size: 13px;
        line-height: 20px;

        word-break: break-word;
        white-space: pre-wrap;
    }

    /* ---------------------------------------------------------
       STATUS
       --------------------------------------------------------- */

    .ticket-timeline-status {
        display: inline-flex;
        align-items: center;
        margin-top: 8px;
        padding: 3px 9px;

        border-radius: 999px;

        font-size: 11px;
        line-height: 16px;
        font-weight: 600;
        text-transform: uppercase;
        letter-spacing: .02em;
    }

    .ticket-timeline-status-open {
        background: #ecfdf3;
        color: #047857;
        border: 1px solid #a7f3d0;
    }

    .ticket-timeline-status-deleted {
        background: #fef2f2;
        color: #b91c1c;
        border: 1px solid #fecaca;
    }

    .ticket-timeline-status-default {
        background: #eff6ff;
        color: #1d4ed8;
        border: 1px solid #bfdbfe;
    }

    /* ---------------------------------------------------------
       DATA CHANGE
       --------------------------------------------------------- */

    .ticket-timeline-change {
        display: flex;
        align-items: center;
        flex-wrap: wrap;
        gap: 8px;

        width: min(100%, 600px);
        margin-top: 9px;
        padding: 10px 13px;
        box-sizing: border-box;

        border: 1px solid #e5e7eb;
        border-radius: 8px;

        background: #f9fafb;

        font-size: 13px;
    }

    .ticket-timeline-old {
        padding: 3px 7px;
        border-radius: 5px;

        background: #fef2f2;
        color: #dc2626;

        text-decoration: line-through;
        text-decoration-color: #fca5a5;
    }

    .ticket-timeline-new {
        padding: 3px 7px;
        border-radius: 5px;

        background: #ecfdf5;
        color: #047857;

        font-weight: 600;
    }

    .ticket-timeline-arrow {
        color: #9ca3af;
        font-size: 16px;
        line-height: 16px;
    }

    /* ---------------------------------------------------------
       DESCRIPTION
       --------------------------------------------------------- */

    .ticket-timeline-description {
        margin-top: 8px;

        color: #6b7280;
        font-size: 13px;
        line-height: 20px;

        max-width: 600px;
    }

    /* ---------------------------------------------------------
       CREATE EVENT
       --------------------------------------------------------- */

    .ticket-timeline-create .ticket-timeline-dot {
        background: #10b981;
        box-shadow: 0 0 0 1px #6ee7b7;
    }

    /* ---------------------------------------------------------
       DELETE EVENT
       --------------------------------------------------------- */

    .ticket-timeline-delete .ticket-timeline-dot {
        background: #ef4444;
        box-shadow: 0 0 0 1px #fca5a5;
    }

    /* ---------------------------------------------------------
       STATUS EVENT
       --------------------------------------------------------- */

    .ticket-timeline-status-event .ticket-timeline-dot {
        background: #3b82f6;
        box-shadow: 0 0 0 1px #93c5fd;
    }

    /* ---------------------------------------------------------
       CHAT EVENT
       --------------------------------------------------------- */

    .ticket-timeline-chat .ticket-timeline-dot {
        background: #6b7280;
        box-shadow: 0 0 0 1px #d1d5db;
    }

    /* ---------------------------------------------------------
       DARK MODE
       --------------------------------------------------------- */

    .dark .ticket-timeline-line {
        background: #374151;
    }

    .dark .ticket-timeline-dot {
        border-color: #111827;
        box-shadow: 0 0 0 1px #4b5563;
    }

    .dark .ticket-timeline-date {
        color: #9ca3af;
    }

    .dark .ticket-timeline-user {
        color: #f9fafb;
    }

    .dark .ticket-timeline-category {
        background: #1f2937;
        border-color: #374151;
        color: #d1d5db;
    }

    .dark .ticket-timeline-message,
    .dark .ticket-timeline-change {
        background: #1f2937;
        border-color: #374151;
        color: #d1d5db;
    }

    .dark .ticket-timeline-description {
        color: #9ca3af;
    }

    .dark .ticket-timeline-dot {
        background-color: #9ca3af;
    }

    .dark .ticket-timeline-create .ticket-timeline-dot {
        background: #34d399;
    }

    .dark .ticket-timeline-delete .ticket-timeline-dot {
        background: #f87171;
    }

    .dark .ticket-timeline-status-event .ticket-timeline-dot {
        background: #60a5fa;
    }

    /* ---------------------------------------------------------
       EMPTY
       --------------------------------------------------------- */

    .ticket-timeline-empty {
        padding: 40px 20px;
        text-align: center;
        color: #6b7280;
        font-size: 14px;
    }
</style>


<div class="ticket-timeline">

    @if ($logs->count())

        <div class="ticket-timeline-list">

            @foreach ($logs as $log)

                @php
                    $category = strtolower(trim($log->kategori_log ?? ''));

                    /*
                     * Tentukan tipe visual berdasarkan kategori.
                     */
                    $eventClass = match ($category) {
                        'create' => 'ticket-timeline-create',
                        'delete' => 'ticket-timeline-delete',
                        'status' => 'ticket-timeline-status-event',
                        'chat' => 'ticket-timeline-chat',
                        default => '',
                    };

                    /*
                     * Bersihkan value status.
                     */
                    $oldValue = $log->data_lama
                        ? trim(str_replace('_', ' ', $log->data_lama))
                        : null;

                    $newValue = $log->data_baru
                        ? trim(str_replace('_', ' ', $log->data_baru))
                        : null;

                    /*
                     * Tentukan class status.
                     */
                    $statusClass = match (strtolower($newValue ?? '')) {
                        'open' => 'ticket-timeline-status-open',
                        'deleted', 'delete', 'cancelled', 'canceled' => 'ticket-timeline-status-deleted',
                        default => 'ticket-timeline-status-default',
                    };
                @endphp


                <div class="ticket-timeline-item {{ $eventClass }}">


                    {{-- =========================================
                         MARKER
                    ========================================== --}}
                    <div class="ticket-timeline-marker">

                        <div class="ticket-timeline-dot"></div>

                        @if (!$loop->last)
                            <div class="ticket-timeline-line"></div>
                        @endif

                    </div>


                    {{-- =========================================
                         CONTENT
                    ========================================== --}}
                    <div class="ticket-timeline-content">


                        {{-- DATE --}}
                        <div class="ticket-timeline-date">
                            {{ $log->created_at->format('d M Y, H:i') }}
                        </div>


                        {{-- USER --}}
                        <div class="ticket-timeline-user">
                            {{ $log->user?->name ?? 'System' }}
                        </div>


                        {{-- CATEGORY --}}
                        @if ($log->kategori_log)

                            <div class="ticket-timeline-category">
                                {{ $log->kategori_log }}
                            </div>

                        @endif


                        {{-- =====================================
                             CHAT / NORMAL ACTIVITY
                        ====================================== --}}
                        @if (
                            $log->timeline_title &&
                            $category !== 'status' &&
                            $category !== 'delete'
                        )

                            <div class="ticket-timeline-message">
                                {{ $log->timeline_title }}
                            </div>

                        @endif


                        {{-- =====================================
                             STATUS
                        ====================================== --}}
                        @if ($category === 'status')

                            @if ($newValue)

                                <div class="ticket-timeline-status {{ $statusClass }}">
                                    {{ strtoupper($newValue) }}
                                </div>

                            @endif

                            @if ($oldValue && $newValue)

                                <div class="ticket-timeline-change">

                                    <span class="ticket-timeline-old">
                                        {{ $oldValue }}
                                    </span>

                                    <span class="ticket-timeline-arrow">
                                        →
                                    </span>

                                    <span class="ticket-timeline-new">
                                        {{ $newValue }}
                                    </span>

                                </div>

                            @endif


                            @if ($log->timeline_title)

                                <div class="ticket-timeline-description">
                                    {{ $log->timeline_title }}
                                </div>

                            @endif

                        @endif


                        {{-- =====================================
                             DELETE
                        ====================================== --}}
                        @if ($category === 'delete')

                            @if ($oldValue || $newValue)

                                <div class="ticket-timeline-change">

                                    @if ($oldValue)

                                        <span class="ticket-timeline-old">
                                            {{ $oldValue }}
                                        </span>

                                    @endif

                                    @if ($oldValue && $newValue)

                                        <span class="ticket-timeline-arrow">
                                            →
                                        </span>

                                    @endif

                                    @if ($newValue)

                                        <span class="ticket-timeline-new">
                                            {{ $newValue }}
                                        </span>

                                    @endif

                                </div>

                            @endif


                            @if ($log->timeline_title)

                                <div class="ticket-timeline-description">
                                    {{ $log->timeline_title }}
                                </div>

                            @endif


                            @if ($log->keterangan)

                                <div class="ticket-timeline-description">
                                    {{ $log->keterangan }}
                                </div>

                            @endif

                        @endif


                        {{-- =====================================
                             UPDATE
                        ====================================== --}}
                        @if ($category === 'update')

                            @if ($oldValue || $newValue)

                                <div class="ticket-timeline-change">

                                    @if ($oldValue)

                                        <span class="ticket-timeline-old">
                                            {{ $oldValue }}
                                        </span>

                                    @endif

                                    @if ($oldValue && $newValue)

                                        <span class="ticket-timeline-arrow">
                                            →
                                        </span>

                                    @endif

                                    @if ($newValue)

                                        <span class="ticket-timeline-new">
                                            {{ $newValue }}
                                        </span>

                                    @endif

                                </div>

                            @endif


                            @if ($log->timeline_title)

                                <div class="ticket-timeline-message">
                                    {{ $log->timeline_title }}
                                </div>

                            @endif


                            @if ($log->keterangan)

                                <div class="ticket-timeline-description">
                                    {{ $log->keterangan }}
                                </div>

                            @endif

                        @endif


                        {{-- =====================================
                             KETERANGAN UMUM
                        ====================================== --}}
                        @if (
                            $log->keterangan &&
                            $category !== 'delete' &&
                            $category !== 'update'
                        )

                            <div class="ticket-timeline-message">
                                {{ $log->keterangan }}
                            </div>

                        @endif


                    </div>

                </div>

            @endforeach

        </div>

    @else

        <div class="ticket-timeline-empty">
            Belum ada aktivitas.
        </div>

    @endif

</div>
