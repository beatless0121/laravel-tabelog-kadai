<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Administrator;                                     //管理者認証機能（管理者側）追加の為（Administratorでクラスパスを定義しているため）
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\ShopController;

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

Route::group(['middleware' => 'guest:admin'], function () {
    Route::get('/', [HomeController::class, 'index'])->name('home');                                         //会員側のトップページ追加の為
    Route::resource('shops', ShopController::class)->only(['index','show']);                                 //会員側の店舗一覧ページ追加の為

     Route::group(['middleware' => ['auth', 'verified']], function () {                                      //会員側の会員管理機能追加の為
         Route::resource('member', MemberController::class)->only(['index', 'edit', 'update']);
     });
});

Route::group(['prefix' => 'admin', 'as' => 'admin.', 'middleware' => 'auth:admin'], function () {          //管理者認証機能（管理者側）追加の為
    Route::get('home', [Administrator\HomeController::class, 'index'])->name('home');
    Route::get('members', [Administrator\MemberController::class, 'index'])->name('members.index');                   //会員管理機能（管理者側）追加の為      
    Route::get('members/{member}', [Administrator\MemberController::class, 'show'])->name('members.show'); 
    Route::resource('shops', Administrator\ShopController::class);                                                         //店舗管理機能（管理者側）追加の為
    Route::resource('categories', Administrator\CategoryController::class)->only(['index', 'store', 'update', 'destroy']);    //カテゴリ管理機能（管理者側）追加の為
    Route::resource('company', Administrator\CompanyController::class)->only(['index', 'edit', 'update']);                    //管理者側の基本情報設定機能追加の為
    Route::resource('terms',  Administrator\TermController::class)->only(['index', 'edit', 'update']);                        //管理者側の基本情報設定機能追加の為
 });

