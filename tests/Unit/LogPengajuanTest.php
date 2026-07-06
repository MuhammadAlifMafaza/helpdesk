<?php

namespace Tests\Unit;

use App\Models\Modules\Pengajuan\Models\LogPengajuan;
use Tests\TestCase;

class LogPengajuanTest extends TestCase
{
    public function test_approve_scope_builds_the_expected_status_filter(): void
    {
        $query = LogPengajuan::query()->approve();

        $this->assertStringContainsString('kategori_log', $query->toSql());
        $this->assertStringContainsString('data_lama', $query->toSql());
        $this->assertStringContainsString('data_baru', $query->toSql());
        $this->assertCount(4, $query->getBindings());
    }

    public function test_searchable_events_returns_status_and_chat_event_definitions(): void
    {
        $events = LogPengajuan::searchableEvents();

        $this->assertNotEmpty($events);
        $this->assertContains('Pengajuan Dibuat', array_column($events, 'name'));
        $this->assertContains('Pesan Baru', array_column($events, 'name'));
    }
}
