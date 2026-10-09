Q: Secara logis untuk workflow atau sistem kerja pengajuan/permintaan barang tidak ada yang namanya reopen/pembukaan permintaan kembali kan?

Benar, **secara workflow pengajuan/permintaan barang pada umumnya tidak perlu ada****`Reopen`** jika `Close` memang berarti proses pengajuan sudah benar-benar selesai.

Workflow yang lebih sederhana dan masuk akal adalah:

```
OPEN
  │
  ├─── Tolak ──────> CLOSE / REJECTED
  │
  └─── Ambil ──────> IN PROGRESS
                         │
                         └─── Selesaikan ──> CLOSE / COMPLETED
```

### Kenapa `Reopen` sebaiknya dihilangkan?

Karena ada perbedaan antara **status proses** dan **koreksi data**.

Misalnya:

- **Open** → pengajuan baru masuk dan belum diproses.
- **In Progress** → pengajuan sedang ditangani.
- **Close + Completed** → barang sudah diproses/diserahkan.
- **Close + Rejected** → pengajuan ditolak.

Ketika sudah `Close`, secara bisnis pengajuan tersebut sudah menghasilkan keputusan. Membuka kembali berarti membuat proses yang sudah selesai menjadi aktif lagi, dan ini bisa menimbulkan masalah seperti:

- siapa yang berhak membuka kembali?
- alasan apa yang diperbolehkan?
- apakah timestamp `waktu_selesai` dihapus?
- apakah log sebelumnya tetap dianggap valid?
- apakah barang yang sudah diserahkan dianggap belum diserahkan?
- apakah SLA/durasi pengerjaan dihitung ulang?
- bagaimana audit trail-nya?

Untuk sistem administrasi, ini bisa membuat histori menjadi ambigu.

### Kalau ada kesalahan setelah Close?

Saya lebih menyarankan **jangan menggunakan****`Reopen`****sebagai mekanisme koreksi**.

Misalnya pengajuan sudah:

```
Open
→ In Progress
→ Close / Completed
```

tetapi ternyata ada kesalahan data. Sebaiknya:

- data tertentu bisa **diedit** dengan permission khusus, dan perubahan dicatat di log; atau
- dibuat **pengajuan baru** jika memang membutuhkan proses baru; atau
- administrator melakukan **koreksi administratif** yang tercatat di audit log.

Jadi `Close` tetap menjadi terminal state.

### Struktur yang saya rekomendasikan

Di kode Anda, saya akan sederhanakan menjadi:

```
status
├── Open
├── In Progress
└── Close

status_outcome
├── Completed
└── Rejected
```

Dengan aturan:

| Status      | Outcome   | Makna           |
| ----------- | --------- | --------------- |
| Open        | NULL      | Pengajuan baru  |
| In Progress | NULL      | Sedang diproses |
| Close       | Completed | Selesai         |
| Close       | Rejected  | Ditolak         |

Tidak perlu:

```
status_outcome = Reopen
```

dan tidak perlu:

```
Action::make('reopen')
```

### Bahkan ada satu hal yang saya sarankan diperbaiki

Di kode Anda sekarang, `status_outcome` sebenarnya **sudah cukup baik jika dianggap sebagai hasil akhir**, karena filter-nya hanya:

```
'Completed' => 'Selesai',
'Rejected' => 'Ditolak',
```

Jadi saya justru akan mempertahankan konsep itu dan membuat aturan bisnisnya tegas:

```
Open
    ↓
In Progress
    ↓
Close
    ├── Completed
    └── Rejected
```

Dengan demikian, **`Close`****adalah terminal state dan tidak bisa kembali ke****`Open`****atau****`In Progress`****.**

Kalau sistem Anda memang untuk **permintaan/pengajuan barang internal perusahaan**, menurut saya model ini jauh lebih bersih, mudah diaudit, dan lebih mudah dipahami user dibanding menambahkan `Reopen`.

Q: Dan apabila ada permintaan dari mitra ingin tambahan fitur reopen permintaan/tiket.

Ya. Kalau **mitra memang meminta fitur****`Reopen`**, saya tidak akan langsung menambah `Reopen` ke workflow utama seperti sekarang.

Lebih tepat membedakan antara **status tiket** dan **permintaan pembukaan kembali**.

### Model yang lebih aman

Workflow utama tetap:

```
OPEN
  ↓
IN PROGRESS
  ↓
CLOSED
  ├── COMPLETED
  └── REJECTED
```

Kemudian jika setelah `CLOSED` mitra merasa masalah belum selesai, mereka melakukan **permintaan reopen**:

```
CLOSED / COMPLETED
        │
        ▼
   Request Reopen
        │
        ▼
 Menunggu Persetujuan
        │
    ┌───┴────┐
    ▼        ▼
 Disetujui  Ditolak
    │
    ▼
IN PROGRESS
```

Ini jauh lebih baik daripada langsung:

```
CLOSED → REOPEN → IN PROGRESS
```

karena **mitra tidak boleh mengubah lifecycle tiket yang sudah ditutup secara langsung**.

### Kenapa saya menyarankan approval?

Misalnya tiket:

> `PB-2026-00123` — Permintaan Laptop — **Completed**

Kemudian mitra mengatakan:

> "Laptop yang diterima tidak sesuai spesifikasi."

Kalau ada tombol `Reopen` langsung, tiket tiba-tiba berubah:

```
Completed → Reopen → In Progress
```

Padahal dari sisi sistem, admin mungkin menganggap pekerjaan sudah selesai.

Dengan mekanisme request:

```
Completed
   ↓
Mitra: "Ajukan Reopen"
   ↓
REOPEN REQUESTED
   ↓
Admin memeriksa alasan
   ↓
Approve
   ↓
In Progress
```

Audit trail-nya menjadi jauh lebih jelas.

### Saya bahkan menyarankan jangan menjadikan `Reopen` sebagai `status_outcome`

Saat ini Anda punya:

```
status:
- Open
- In Progress
- Close

status_outcome:
- Completed
- Rejected
```

Saya akan **tetap mempertahankan struktur tersebut**.

Tambahkan konsep baru, misalnya:

```
reopen_requested_at
reopen_requested_by
reopen_reason
reopen_approved_at
reopen_approved_by
reopen_rejection_reason
```

Atau, kalau ingin lebih proper dan scalable, buat tabel khusus:

```
pengajuan_barang_reopen_requests
```

Contohnya:

```
id
pengajuan_barang_id
requested_by
reason
status
approved_by
approved_at
rejected_by
rejected_at
rejection_reason
created_at
updated_at
```

dengan:

```
status:
- Pending
- Approved
- Rejected
```

### Keuntungan model ini

Anda mendapatkan dua hal sekaligus:

**Workflow utama tetap bersih:**

```
Open → In Progress → Close
```

**Tetapi kebutuhan mitra tetap terpenuhi:**

```
Close
  ↓
Request Reopen
  ↓
Pending
  ↓
Approved
  ↓
In Progress
```

Dan yang paling penting: **histori tidak hilang**.

Misalnya log bisa menunjukkan:

```
08 Okt 09:00  → Pengajuan dibuat
08 Okt 10:15  → Diambil admin
08 Okt 14:30  → Completed
09 Okt 08:20  → Mitra meminta reopen
09 Okt 09:00  → Reopen disetujui oleh Admin
09 Okt 09:01  → Kembali In Progress
09 Okt 13:45  → Completed kembali
```

Ini jauh lebih bagus untuk **audit, SLA, laporan, dan troubleshooting**.

Jadi kalau mitra meminta fitur reopen, menurut saya **permintaannya valid**, tetapi implementasinya sebaiknya bukan sekadar menambahkan:

```
Action::make('reopen')
```

ke tabel Anda.

**`Reopen`****sebaiknya menjadi proses pengajuan/approval tersendiri, bukan status biasa.**

Kalau Anda mau, saya bisa bantu desain **workflow lengkap + perubahan Model****`PengajuanBarang`****\+ migration + Filament Action** untuk mekanisme `Request Reopen → Approve/Reject`, disesuaikan dengan kode yang Anda kirim tadi.

Q: permasalah nya, sistem aproval mungkin kurang cocok dengan sistem saya ini. Karena yang dapat memproses atau menangani permintaan tersebut hanya Admin.

Nah, kalau begitu saya setuju: **approval terpisah kemungkinan justru membuat sistem Anda terlalu rumit**.

Kalau hanya **Admin/Super Admin** yang memang berwenang menangani pengajuan, maka `Reopen` bisa dibuat sebagai **aksi administratif oleh Admin**, tanpa approval layer tambahan.

Yang penting adalah membedakan **siapa yang meminta reopen** dan **siapa yang melakukan reopen**.

### Workflow yang lebih cocok untuk sistem Anda

```
OPEN
  │
  │ Admin ambil
  ▼
IN PROGRESS
  │
  ├── Admin tolak ──────► CLOSE / REJECTED
  │
  └── Admin selesaikan ─► CLOSE / COMPLETED
                              │
                              │ Mitra meminta dibuka kembali
                              ▼
                         REOPEN REQUEST
                              │
                              │ Admin memeriksa
                              ▼
                         IN PROGRESS
                              │
                              ▼
                         CLOSE / COMPLETED
```

Tetapi `REOPEN REQUEST` **tidak harus menjadi status database**.

### Saya lebih menyarankan seperti ini

Status utama tetap hanya:

```
'Open'
'In Progress'
'Close'
```

Outcome:

```
'Completed'
'Rejected'
```

Kemudian Admin mendapatkan tombol:

```
🔄 Buka Kembali
```

**hanya pada tiket yang sudah****`Close`****.**

Saat Admin menekan tombol tersebut:

1. Admin wajib memberikan alasan.
2. Sistem mencatat siapa yang melakukan reopen.
3. Sistem mencatat kapan dilakukan.
4. Sistem mencatat alasan.
5. Status berubah dari `Close` → `In Progress`.
6. `status_outcome` bisa dikosongkan kembali karena tiket sedang diproses ulang.
7. `waktu_selesai` sebaiknya **jangan dihapus**, karena itu merupakan histori penyelesaian sebelumnya.
8. Sistem mencatat log bahwa tiket dibuka kembali.

Jadi:

```
Close / Completed
       ↓
    [Reopen]
       ↓
In Progress / NULL
```

### Ini berbeda dengan `Reopen` yang sekarang

Di kode Anda sekarang:

```
Action::make('reopen')
    ->visible(
        fn(PengajuanBarang $record): bool =>
            auth()->user()->hasAnyRole(['admin', 'super_admin'])
            && $record->isClosed()
    )
```

Sebenarnya **secara permission sudah cocok** dengan kondisi sistem Anda.

Yang perlu kita pikirkan lebih serius justru **business logic****`reopen()`****di Model**.

Saya akan membuat konsepnya kira-kira:

```
$record->reopen(
    $data['catatan']
);
```

dan di dalam Model:

```
public function reopen(string $alasan): void
{
    // validasi harus Close

    // simpan histori

    // status kembali In Progress

    // outcome dikosongkan

    // catat log reopen
}
```

### Tapi ada satu hal penting

Saya **tidak menyarankan menghapus****`waktu_selesai`**.

Misalnya:

```
10 Okt 2026 15:00
Completed
```

Kemudian:

```
12 Okt 2026 09:00
Reopen
```

Kalau `waktu_selesai` diubah menjadi `NULL`, histori bahwa tiket **pernah selesai pada 10 Oktober** hilang.

Lebih bagus:

```
waktu_mulai       = 10 Okt 09:00
waktu_selesai     = 10 Okt 15:00
status            = In Progress
status_outcome    = NULL
```

Kemudian histori/log mengatakan:

```
10 Okt 09:00  → In Progress
10 Okt 15:00  → Completed
12 Okt 09:00  → Reopened oleh Admin
12 Okt 09:00  → In Progress
```

Kalau nanti selesai lagi:

```
12 Okt 14:00 → Completed
```

Dengan begitu Anda mempunyai **siklus pengerjaan kedua**, tanpa menghancurkan histori siklus pertama.

### Jadi menurut saya arsitektur yang paling cocok untuk sistem Anda:

```
                    ┌──────────────────┐
                    │       OPEN       │
                    └────────┬─────────┘
                             │
                        Admin ambil
                             │
                             ▼
                    ┌──────────────────┐
                    │   IN PROGRESS    │
                    └───────┬──────────┘
                            / \
                           /   \
                     Tolak /     \ Selesaikan
                         /         \
                        ▼           ▼
                  ┌─────────┐ ┌─────────────┐
                  │ REJECTED│ │  COMPLETED  │
                  └─────────┘ └──────┬──────┘
                                     │
                              Mitra minta reopen
                                     │
                                     ▼
                              Admin buka kembali
                                     │
                                     ▼
                              IN PROGRESS
                                     │
                                     ▼
                                  COMPLETED
```

**Tidak perlu approval system. Tidak perlu role baru. Tidak perlu status****`Reopen`****.**

`Reopen` cukup menjadi **administrative action yang hanya dapat dilakukan Admin/Super Admin terhadap tiket yang sudah Close**, dengan **alasan wajib dan audit log**.

Menurut saya ini paling pas dengan sistem yang sudah Anda bangun sekarang karena perubahan dari kode Anda juga relatif kecil.

Q: nah, kalau semisal nya Reopen menggunakan sistem aproval maka pihak yang mengajukan atau melakukan reopen adalah si pemohon bukan Admin, dan admin akan meninjau ulang permintaan tersebut dan memproses nya kembali apa yang salah dengan pengerjaan nya.

Ya — **kalau definisi bisnisnya seperti itu, saya justru setuju bahwa sistem approval untuk Reopen menjadi masuk akal.** Dan ini berbeda dengan sekadar Admin membuka kembali tiket secara manual.

Kuncinya adalah: **Reopen bukan perubahan status yang dilakukan Admin, tetapi permintaan dari Pemohon untuk meminta Admin melakukan penanganan ulang.**

### Workflow yang lebih tepat

Saya akan memodelkannya seperti ini:

```
                    PEMOHON
                       │
                       ▼
                    OPEN
                       │
                 Admin ambil
                       │
                       ▼
                 IN PROGRESS
                    /       \
                   /         \
              Ditolak       Selesai
                 │             │
                 ▼             ▼
          CLOSE / REJECTED  CLOSE / COMPLETED
                               │
                               │
                         Pemohon menemukan
                         masalah/kekurangan
                               │
                               ▼
                        AJUKAN REOPEN
                               │
                               ▼
                     REOPEN REQUESTED
                               │
                         Admin meninjau
                         /            \
                        /              \
                  Ditolak           Disetujui
                     │                 │
                     ▼                 ▼
               Tetap CLOSED       IN PROGRESS
                                       │
                                  Admin proses
                                       │
                                       ▼
                                   COMPLETED
```

Ini menurut saya **lebih kuat secara bisnis** daripada Admin langsung mempunyai tombol `Reopen`.

## Kenapa approval justru cocok di sini?

Karena ada dua aktor yang berbeda:

**Pemohon:**

> "Permintaan saya memang sudah ditutup, tetapi hasilnya belum sesuai."

**Admin:**

> "Saya menerima permintaan tersebut, memeriksa permasalahannya, kemudian memutuskan apakah memang perlu dikerjakan kembali."

Jadi `Reopen` sebenarnya bukan:

> **"Admin membuka tiket."**

Tetapi:

> **"Pemohon meminta agar tiket yang sudah selesai ditinjau dan dikerjakan kembali."**

Itu adalah proses bisnis yang berbeda.

---

## Saya sarankan jangan mengubah `status` menjadi `Reopen`

Tetap pertahankan:

```
status:
- Open
- In Progress
- Close
```

dan:

```
status_outcome:
- Completed
- Rejected
```

Kemudian buat entitas/proses terpisah:

```
reopen_request
```

Misalnya:

```
pengajuan_barang_reopen_requests
```

Dengan data:

```
id
pengajuan_barang_id
requested_by
reason
status
reviewed_by
reviewed_at
admin_note
created_at
updated_at
```

`status` pada request:

```
Pending
Approved
Rejected
```

### Contoh nyata

Tiket:

```
PB-2026-00125
Status: Close
Outcome: Completed
```

Pemohon menerima barang, tetapi ternyata:

> "Jumlah barang yang diterima hanya 4, sedangkan pengajuan saya 5."

Pemohon menekan:

```
[ Ajukan Reopen ]
```

dan mengisi:

```
Alasan:
Barang yang diterima kurang 1 unit.
```

Database utama **belum berubah**:

```
status = Close
status_outcome = Completed
```

Yang dibuat adalah:

```
Reopen Request
------------------------------
Pengajuan : PB-2026-00125
Pemohon   : Budi
Alasan    : Barang kurang 1 unit
Status    : Pending
```

Admin kemudian melihat:

> ⚠️ **Ada permintaan pembukaan kembali**

Admin memeriksa histori/log dan barang yang diberikan.

Jika memang benar:

```
[ Setujui Reopen ]
```

Barulah sistem:

```
status = In Progress
status_outcome = NULL
```

dan membuat log:

```
Pengajuan dibuka kembali berdasarkan permintaan pemohon.
Alasan: Barang yang diterima kurang 1 unit.
Disetujui oleh: Admin A
```

Setelah itu Admin kembali mengerjakan permintaan tersebut.

---

## Ini juga menyelesaikan masalah audit

Misalnya suatu saat manajemen bertanya:

> "Kenapa tiket yang sudah Completed sekarang In Progress?"

Kalau hanya menggunakan `Reopen` langsung, jawabannya kurang jelas.

Tetapi dengan model ini:

```
10 Okt 09:00
Pengajuan dibuat

10 Okt 10:00
Admin mengambil pengajuan

10 Okt 15:00
Pengajuan Completed

12 Okt 08:30
Pemohon mengajukan Reopen
Alasan: Barang kurang 1 unit

12 Okt 09:15
Admin menyetujui Reopen

12 Okt 09:15
Pengajuan kembali In Progress

12 Okt 14:00
Pengajuan Completed
```

**Seluruh siklusnya terdokumentasi.**

Ini sangat bagus untuk audit.

---

## Bahkan saya akan membedakan 3 hal

Ini penting supaya sistem Anda tidak rancu:

### 1\. `status`

Kondisi pengerjaan saat ini:

```
Open
In Progress
Close
```

### 2\. `status_outcome`

Hasil ketika ditutup:

```
Completed
Rejected
```

### 3\. `reopen_request.status`

Status permintaan untuk mengerjakan ulang:

```
Pending
Approved
Rejected
```

Jadi jangan melakukan:

```
status = Reopen
```

Karena `Reopen` **bukan kondisi pengerjaan**.

Ia adalah **permintaan perubahan lifecycle**.

---

## Dan tombolnya berdasarkan role

### Pemohon

Kalau:

```
status = Close
status_outcome = Completed
```

maka pemohon bisa melihat:

```
[ Ajukan Reopen ]
```

Dengan form:

```
Alasan Pembukaan Kembali *
```

Setelah dikirim:

```
[ Menunggu Peninjauan Admin ]
```

dan pemohon **tidak bisa mengajukan reopen kedua** selama request pertama masih `Pending`.

### Admin

Admin mendapatkan daftar:

```
Permintaan Reopen
```

Misalnya:

| Pengajuan | Pemohon | Alasan            | Status  |
| --------- | ------- | ----------------- | ------- |
| PB-00125  | Budi    | Barang kurang 1   | Pending |
| PB-00120  | Andi    | Spesifikasi salah | Pending |

Admin bisa:

```
[ Lihat ]
[ Setujui ]
[ Tolak ]
```

Kalau ditolak, **tiket tetap Closed/Completed**.

Kalau disetujui:

```
Close / Completed
       ↓
Reopen Approved
       ↓
In Progress
       ↓
diproses kembali
       ↓
Close / Completed
```

---

## Jadi setelah memahami requirement Anda, saya akan mengubah rekomendasi saya

Awalnya `Reopen` sebagai action Admin memang cukup.

**Tetapi dengan requirement yang baru Anda jelaskan, approval Reopen justru merupakan desain yang lebih tepat.**

Karena:

> **Pemohon mengajukan masalah → Admin meninjau → Admin menyetujui/menolak → jika disetujui, tiket kembali diproses.**

Dan yang paling penting, **Anda tidak perlu mengubah workflow utama yang sudah ada.**

Anda hanya menambahkan **sub-workflow Reopen Request** di atas workflow existing.

Kalau diterapkan ke kode Filament yang Anda kirim sebelumnya, saya sarankan kita desain dari database/model dulu, baru kemudian `Action` Filament-nya. Dengan begitu kita tidak sekadar menambahkan tombol `Reopen`, tetapi lifecycle dan audit trail-nya benar sejak awal.
