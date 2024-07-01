<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Admin\HomeController;                              //管理者認証機能作成の為、変更（名人）

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index']);
Route::get('/admin/home', [App\Http\Controllers\Admin\HomeController::class, 'index']);

require __DIR__.'/auth.php';
//管理者認証機能作成の為、変更（名人）
Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'auth:admin'], function () {
    Route::get('home', [Admin\HomeController::class, 'index'])->name('home');
});

