<?php

use App\Http\Controllers\Auth\LoginController;
use Illuminate\Support\Facades\Route;

use app\Models\Modules\Perbaikan\Models\TiketPerbaikan;

Route::get('/login', [LoginController::class, 'showLoginForm'])->name('login');
Route::post('/login', [LoginController::class, 'login']);
Route::post('/logout', [LoginController::class, 'logout'])->name('logout');

Route::middleware(['auth', 'pemohon'])->group(function () {

    Route::get('/', function () {
        return view('welcome');
    });
});
