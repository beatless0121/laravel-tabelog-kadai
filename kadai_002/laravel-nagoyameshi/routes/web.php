<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Administrator;                    //Administratorsテーブル追加（Administratorでクラスパスを定義しているため）

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

require __DIR__.'/auth.php';

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'auth:admin'], function () {           //Administratorsテーブル追加
    Route::get('home', [Administrator\HomeController::class, 'index'])->name('home');
});
