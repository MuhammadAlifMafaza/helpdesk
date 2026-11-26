<?php

namespace Tests\Feature;

use App\Filament\Resources\KegiatanTeknisi\KegiatanTeknisiResource;
use App\Filament\Resources\KegiatanTeknisi\Pages\CreateKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\EditKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ListKegiatanTeknisi;
use App\Filament\Resources\KegiatanTeknisi\Pages\ViewKegiatanTeknisi;
use App\Filament\Resources\TicketServices\Pages\ListTicketServices;
use App\Models\Modules\Master\Ruangan\Models\MasterRuangan;
use App\Models\Modules\Perbaikan\Models\TiketPerbaikan;
use App\Models\Modules\Teknisi\Models\KegiatanTeknisi;
use App\Models\User;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Livewire\Livewire;
use ReflectionMethod;
use Spatie\Permission\Models\Role;
use Tests\TestCase;

class KegiatanTeknisiTest extends TestCase
{
    use RefreshDatabase;

    private User $teknisiSatu;

    private User $teknisiDua;

    private User $admin;

    private User $pemohon;

    private MasterRuangan $ruangan;

    private string $waktuMulaiUji;

    protected function setUp(): void
    {
        parent::setUp();

        config(['queue.default' => 'sync']);

        $this->waktuMulaiUji = now()->toDateTimeString();

        foreach (['super_admin', 'admin', 'teknisi', 'pemohon'] as $role) {
            Role::findOrCreate($role, 'web');
        }

        $this->teknisiSatu = User::create([
            'name' => 'Teknisi Uji Kegiatan Satu',
            'email' => 'teknisi-satu@uji-kegiatan.test',
            'password' => bcrypt('password'),
        ]);
        $this->teknisiSatu->syncRoles(['teknisi']);

        $this->teknisiDua = User::create([
            'name' => 'Teknisi Uji Kegiatan Dua',
            'email' => 'teknisi-dua@uji-kegiatan.test',
            'password' => bcrypt('password'),
        ]);
        $this->teknisiDua->syncRoles(['teknisi']);

        $this->admin = User::create([
            'name' => 'Admin Uji Kegiatan',
            'email' => 'admin@uji-kegiatan.test',
            'password' => bcrypt('password'),
        ]);
        $this->admin->syncRoles(['admin']);

        $this->pemohon = User::create([
            'name' => 'Pemohon Uji Kegiatan',
            'email' => 'pemohon@uji-kegiatan.test',
            'password' => bcrypt('password'),
        ]);
        $this->pemohon->syncRoles(['pemohon']);

        $this->ruangan = MasterRuangan::create([
            'nama_ruangan' => 'RUANG UJI KEGIATAN',
            'nama_gedung' => 'GEDUNG UJI KEGIATAN',
        ]);
    }

    protected function tearDown(): void
    {
        $this->hapusRekamanUji();

        parent::tearDown();
    }

    private function hapusRekamanUji(): void
    {
        $kegiatanIds = KegiatanTeknisi::withTrashed()
            ->whereHas('teknisi', fn ($query) => $query->where('email', 'like', '%@uji-kegiatan.test'))
            ->pluck('id');

        DB::table('kegiatan_petugas')->whereIn('kegiatan_id', $kegiatanIds)->delete();

        KegiatanTeknisi::withTrashed()
            ->whereIn('id', $kegiatanIds)
            ->forceDelete();

        $userIds = User::where('email', 'like', '%@uji-kegiatan.test')->pluck('id');

        DB::table('model_has_roles')
            ->whereIn('model_id', $userIds)
            ->where('model_type', User::class)
            ->delete();

        $ticketIds = TiketPerbaikan::withTrashed()
            ->whereIn('user_id', $userIds)
            ->pluck('id');

        DB::table('log_data_tiket_perbaikan')->whereIn('tiket_id', $ticketIds)->delete();
        TiketPerbaikan::withTrashed()->whereIn('id', $ticketIds)->forceDelete();

        User::whereIn('id', $userIds)->forceDelete();

        MasterRuangan::where('nama_ruangan', 'RUANG UJI KEGIATAN')->delete();
    }

    private function buatKegiatan(User $teknisi): KegiatanTeknisi
    {
        return KegiatanTeknisi::create([
            'teknisi_id' => $teknisi->id,
            'ruangan_id' => $this->ruangan->id,
            'tanggal' => now()->toDateString(),
            'deskripsi_kegiatan' => 'KEGIATAN UJI '.$this->waktuMulaiUji,
        ]);
    }

    private function buatTiketDenganHasil(string $hasil): TiketPerbaikan
    {
        $tiket = TiketPerbaikan::create([
            'user_id' => $this->pemohon->id,
            'ruangan_id' => $this->ruangan->id,
            'keluhan' => 'Tiket uji filter '.$hasil,
            'kepemilikan' => 'Inventaris Kantor',
            'deskripsi' => 'Tiket uji filter hasil penanganan.',
            'status' => 'Close',
        ]);

        $tiket->logs()->create([
            'user_id' => $this->admin->id,
            'kategori_log' => 'Status',
            'data_lama' => 'In Progress',
            'data_baru' => 'Close',
            'keterangan' => $hasil === 'Rejected'
                ? '[DITOLAK] Tiket tidak dapat diperbaiki.'
                : '[SELESAI] Perbaikan tiket telah selesai.',
            'created_at' => now(),
        ]);

        return $tiket;
    }

    public function test_petugas_tersimpan_ke_pivot_table(): void
    {
        $kegiatan = $this->buatKegiatan($this->teknisiSatu);
        $kegiatan->petugas()->attach([
            $this->teknisiDua->id,
            $this->admin->id,
        ]);

        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->teknisiDua->id,
        ]);

        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->admin->id,
        ]);

        $this->assertEqualsCanonicalizing(
            [$this->teknisiDua->id, $this->admin->id],
            $kegiatan->fresh()->petugas->pluck('id')->all()
        );
    }

    public function test_petugas_bisa_diperbarui_pada_edit(): void
    {
        $kegiatan = $this->buatKegiatan($this->teknisiSatu);
        $kegiatan->petugas()->attach($this->teknisiDua->id);

        $kegiatan->petugas()->sync([$this->admin->id]);

        $this->assertEqualsCanonicalizing(
            [$this->admin->id],
            $kegiatan->fresh()->petugas->pluck('id')->all()
        );
    }

    public function test_create_page_persists_selected_petugas_to_pivot(): void
    {
        $this->actingAs($this->teknisiSatu);

        Livewire::test(CreateKegiatanTeknisi::class)
            ->fillForm([
                'tanggal' => now()->toDateString(),
                'ruangan_id' => $this->ruangan->id,
                'petugas' => [$this->teknisiDua->id, $this->admin->id],
                'deskripsi_kegiatan' => 'Pemeriksaan perangkat jaringan di ruang uji.',
            ])
            ->call('create')
            ->assertHasNoFormErrors();

        $kegiatan = KegiatanTeknisi::query()
            ->where('deskripsi_kegiatan', 'Pemeriksaan perangkat jaringan di ruang uji.')
            ->firstOrFail();

        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->teknisiDua->id,
        ]);
        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->admin->id,
        ]);
    }

    public function test_edit_page_replaces_selected_petugas_in_pivot(): void
    {
        $kegiatan = $this->buatKegiatan($this->teknisiSatu);
        $kegiatan->petugas()->attach($this->teknisiDua->id);
        $this->actingAs($this->admin);

        Livewire::test(EditKegiatanTeknisi::class, ['record' => $kegiatan->getRouteKey()])
            ->fillForm([
                'tanggal' => now()->toDateString(),
                'ruangan_id' => $this->ruangan->id,
                'petugas' => [$this->admin->id, $this->teknisiSatu->id],
                'deskripsi_kegiatan' => 'KEGIATAN UJI diperbarui',
            ])
            ->call('save')
            ->assertHasNoFormErrors();

        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->admin->id,
        ]);
        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->teknisiSatu->id,
        ]);

        $this->assertDatabaseMissing('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->teknisiDua->id,
        ]);
    }

    public function test_create_page_requires_at_least_one_petugas(): void
    {
        $this->actingAs($this->teknisiSatu);

        Livewire::test(CreateKegiatanTeknisi::class)
            ->fillForm([
                'tanggal' => now()->toDateString(),
                'ruangan_id' => $this->ruangan->id,
                'petugas' => [],
                'deskripsi_kegiatan' => 'Pemeriksaan perangkat tanpa petugas.',
            ])
            ->call('create')
            ->assertHasFormErrors(['petugas' => 'required']);

        $this->assertDatabaseMissing('log_harian_teknisi', [
            'deskripsi_kegiatan' => 'Pemeriksaan perangkat tanpa petugas.',
        ]);
    }

    public function test_activity_list_shows_data_filters_and_column_toggle_controls(): void
    {
        $this->actingAs($this->admin);

        Livewire::test(ListKegiatanTeknisi::class)
            ->assertTableFilterVisible('teknisi_id')
            ->assertTableFilterVisible('tanggal')
            ->toggleAllTableColumns();
    }

    public function test_repair_ticket_list_exposes_domain_filters_and_column_controls(): void
    {
        $this->actingAs($this->admin);

        Livewire::test(ListTicketServices::class)
            ->assertTableFilterVisible('status')
            ->assertTableFilterVisible('status_outcome')
            ->assertTableFilterVisible('kepemilikan')
            ->assertTableFilterVisible('ruangan_id')
            ->assertTableFilterVisible('created_at')
            ->toggleAllTableColumns();
    }

    public function test_outcome_query_matches_close_logs_and_rejects_unsupported_outcomes(): void
    {
        $rejectedTicket = $this->buatTiketDenganHasil('Rejected');
        $completedTicket = $this->buatTiketDenganHasil('Completed');

        DB::flushQueryLog();
        DB::enableQueryLog();

        $tickets = TiketPerbaikan::query()
            ->with('latestCloseLog')
            ->whereIn('id', [$rejectedTicket->id, $completedTicket->id])
            ->get();
        $outcomes = $tickets->mapWithKeys(fn (TiketPerbaikan $ticket): array => [
            $ticket->id => $ticket->status_outcome,
        ]);
        $queryCount = count(DB::getQueryLog());

        DB::disableQueryLog();

        $this->assertLessThan(5, $queryCount);
        $this->assertSame([
            $rejectedTicket->id => 'Rejected',
            $completedTicket->id => 'Completed',
        ], $outcomes->all());
        $this->assertSame(
            [$rejectedTicket->id],
            TiketPerbaikan::query()->whereOutcome('Rejected')->pluck('id')->all()
        );
        $this->assertSame(
            [$completedTicket->id],
            TiketPerbaikan::query()->whereOutcome('Completed')->pluck('id')->all()
        );
        $this->assertSame([], TiketPerbaikan::query()->whereOutcome('Reopen')->pluck('id')->all());
    }

    public function test_soft_delete_mempertahankan_baris_petugas(): void
    {
        $kegiatan = $this->buatKegiatan($this->teknisiSatu);
        $kegiatan->petugas()->attach($this->teknisiDua->id);

        $kegiatan->delete();
        $this->assertTrue($kegiatan->trashed());

        $this->assertDatabaseHas('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
            'petugas_id' => $this->teknisiDua->id,
        ]);

        $kegiatan->restore();
        $this->assertEqualsCanonicalizing(
            [$this->teknisiDua->id],
            $kegiatan->fresh()->petugas->pluck('id')->all()
        );
    }

    public function test_force_delete_menghapus_baris_petugas(): void
    {
        $kegiatan = $this->buatKegiatan($this->teknisiSatu);
        $kegiatan->petugas()->attach($this->teknisiDua->id);

        $kegiatan->forceDelete();

        $this->assertDatabaseMissing('kegiatan_petugas', [
            'kegiatan_id' => $kegiatan->id,
        ]);
    }

    public function test_can_view_any_dibatasi_role_panel(): void
    {
        $this->actingAs($this->admin);
        $this->assertTrue(KegiatanTeknisiResource::canViewAny());

        $this->actingAs($this->teknisiSatu);
        $this->assertTrue(KegiatanTeknisiResource::canViewAny());

        $this->actingAs($this->pemohon);
        $this->assertFalse(KegiatanTeknisiResource::canViewAny());
    }

    public function test_can_view_mengikuti_role_panel(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);

        $this->actingAs($this->admin);
        $this->assertTrue(KegiatanTeknisiResource::canView($record));

        $this->actingAs($this->teknisiDua);
        $this->assertTrue(KegiatanTeknisiResource::canView($record));

        $this->actingAs($this->pemohon);
        $this->assertFalse(KegiatanTeknisiResource::canView($record));
    }

    public function test_teknisi_hanya_bisa_mengedit_catatan_sendiri(): void
    {
        $recordMilikOrangLain = $this->buatKegiatan($this->teknisiSatu);
        $recordMilikSendiri = $this->buatKegiatan($this->teknisiDua);

        $this->actingAs($this->teknisiDua);
        $this->assertTrue(KegiatanTeknisiResource::canEdit($recordMilikSendiri));
        $this->assertFalse(KegiatanTeknisiResource::canEdit($recordMilikOrangLain));

        $this->actingAs($this->admin);
        $this->assertTrue(KegiatanTeknisiResource::canEdit($recordMilikOrangLain));
    }

    public function test_record_terhapus_tidak_bisa_diedit(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);
        $record->delete();

        $this->actingAs($this->admin);
        $this->assertFalse(KegiatanTeknisiResource::canEdit($record));
    }

    public function test_restore_hanya_untuk_admin(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);

        $this->actingAs($this->admin);
        $this->assertTrue(KegiatanTeknisiResource::canRestore($record));

        $this->actingAs($this->teknisiSatu);
        $this->assertFalse(KegiatanTeknisiResource::canRestore($record));
    }

    public function test_force_delete_dilarang_untuk_semua_role(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);

        $this->actingAs($this->admin);
        $this->assertFalse(KegiatanTeknisiResource::canForceDelete($record));

        $this->actingAs($this->teknisiSatu);
        $this->assertFalse(KegiatanTeknisiResource::canForceDelete($record));
    }

    public function test_create_memaksa_teknisi_id_ke_user_yang_login(): void
    {
        $this->actingAs($this->teknisiSatu);

        $halaman = new CreateKegiatanTeknisi;

        $metode = new ReflectionMethod($halaman, 'mutateFormDataBeforeCreate');
        $metode->setAccessible(true);

        $hasil = $metode->invoke($halaman, [
            'teknisi_id' => $this->teknisiDua->id,
            'tanggal' => now()->toDateString(),
            'deskripsi_kegiatan' => 'KEGIATAN UJI',
        ]);

        $this->assertSame($this->teknisiSatu->id, $hasil['teknisi_id']);
    }

    public function test_edit_mempertahankan_teknisi_id_asli_record(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);

        $this->actingAs($this->teknisiSatu);

        $halaman = new EditKegiatanTeknisi;
        $halaman->record = $record;

        $metode = new ReflectionMethod($halaman, 'mutateFormDataBeforeSave');
        $metode->setAccessible(true);

        $hasil = $metode->invoke($halaman, [
            'teknisi_id' => $this->teknisiDua->id,
            'tanggal' => now()->toDateString(),
            'deskripsi_kegiatan' => 'KEGIATAN UJI UBAH',
        ]);

        $this->assertSame($this->teknisiSatu->id, $hasil['teknisi_id']);
    }

    public function test_soft_delete_lalu_restore_bekerja(): void
    {
        $record = $this->buatKegiatan($this->teknisiSatu);

        $record->delete();
        $this->assertTrue($record->trashed());

        $record->restore();
        $this->assertFalse($record->fresh()->trashed());
    }

    public function test_record_title_attribute_merujuk_kolom_ada(): void
    {
        $this->assertTrue(
            (new KegiatanTeknisi)->isFillable('deskripsi_kegiatan')
        );

        $reflection = new \ReflectionClass(KegiatanTeknisiResource::class);
        $properti = $reflection->getProperty('recordTitleAttribute');
        $properti->setAccessible(true);

        $this->assertSame('deskripsi_kegiatan', $properti->getValue());
    }

    public function test_record_title_menggunakan_nama_kreator_dan_tanggal(): void
    {
        $record = KegiatanTeknisi::create([
            'teknisi_id' => $this->teknisiSatu->id,
            'ruangan_id' => $this->ruangan->id,
            'tanggal' => '2026-10-24',
            'deskripsi_kegiatan' => 'KEGIATAN UJI '.$this->waktuMulaiUji,
        ]);

        // Literal: "Okt" membuktikan format ter-locale Indonesia, bukan "Oct".
        $judulDiharapkan = 'Kegiatan Teknisi Uji Kegiatan Satu 24 Okt 2026';

        $halamanLihat = new ViewKegiatanTeknisi;
        $halamanLihat->record = $record;

        $this->assertSame($judulDiharapkan, $halamanLihat->getRecordTitle());

        $halamanUbah = new EditKegiatanTeknisi;
        $halamanUbah->record = $record;

        $this->assertSame($judulDiharapkan, $halamanUbah->getRecordTitle());
    }

    public function test_database_mendukung_modul(): void
    {
        $this->assertTrue(Schema::hasTable('log_harian_teknisi'));
        $this->assertTrue(Schema::hasTable('kegiatan_petugas'));
        $this->assertFalse(Schema::hasColumn('log_harian_teknisi', 'nama_petugas'));
    }
}
