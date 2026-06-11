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

// Route::post(
//     '/ticket/{ticket}/chat',
//     function (Request $request, TiketPerbaikan $ticket) {

//         $request->validate([
//             'message' => ['required']
//         ]);

//         $ticket->sendMessage(
//             $request->message
//         );

//         return back();
//     }
// )
//     ->name('ticket.chat.send');
// Route::middlewareGroup(['auth', 'staff'])->prefix('admin')->group(function () {
//     Route::get('/admin-dashboard', \App\Filament\Pages\IsStaff\AdminDashboard::class)->name('admin-dashboard');
//     Route::get('/teknisi-dashboard', \App\Filament\Pages\IsStaff\TeknisiDashboard::class)->name('teknisi-dashboard');
// });
