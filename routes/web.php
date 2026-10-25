<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Laporan\PrintLaporanController;
use Illuminate\Support\Facades\Route;

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

/*
|----------------------------------------------------------------------
| Halaman cetak laporan (dialog print browser, bukan export file)
|----------------------------------------------------------------------
| Payload disimpan ke session oleh LaporanExportService::print() saat
| tombol "Print Preview" ditekan di halaman List laporan.
*/
Route::get('/laporan/cetak', PrintLaporanController::class)
    ->middleware(['auth', 'staff'])
    ->name('laporan.cetak');

/*
|----------------------------------------------------------------------
| Landing: langsung ke halaman panel sesuai peran user
|----------------------------------------------------------------------
| Route lama memakai guard `pemohon`, sehingga user staff yang membuka "/"
| justru menerima 403. Sekarang "/" menjadi pengarah peran: pemohon ke
| /pemohon, staff ke /admin, tamu ke halaman login.
*/
Route::get('/', function () {
    $homeUrl = auth()->user()?->homeUrl();

    abort_if($homeUrl === null, 403, 'Akun Anda tidak memiliki akses.');

    return redirect()->to($homeUrl);
})->middleware('auth');
