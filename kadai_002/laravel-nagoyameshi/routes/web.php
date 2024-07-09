<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Administrator;                                     //管理者認証機能（管理者側）追加の為（Administratorでクラスパスを定義しているため）


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

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'auth:admin'], function () {          //管理者認証機能（管理者側）追加の為
    Route::get('home', [Administrator\HomeController::class, 'index'])->name('home');
    Route::get('members', [Administrator\MemberController::class, 'index'])->name('members.index');                   //会員管理機能（管理者側）追加の為      
    Route::get('members/{member}', [Administrator\MemberController::class, 'show'])->name('members.show'); 
    Route::resource('shops', Administrator\ShopController::class);                                                         //店舗管理機能（管理者側）追加の為
 });




