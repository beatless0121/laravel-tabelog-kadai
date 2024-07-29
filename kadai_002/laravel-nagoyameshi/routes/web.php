<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Administrator;                                     //管理者認証機能（管理者側）追加の為（Administratorでクラスパスを定義しているため）
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\MemberController;
use App\Http\Controllers\ShopController;
use App\Http\Controllers\SubscriptionController;
use App\Http\Middleware\Subscribed;
use App\Http\Middleware\NotSubscribed;
use App\Http\Controllers\ReviewController;
use App\Http\Controllers\ReservationController;
use App\Http\Controllers\FavoriteController;
use App\Http\Controllers\CompanyController as MemberCompanyController;
use App\Http\Controllers\TermController as MemberTermController; 


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
    
     // ショップのレビュー一覧ページのルート
     Route::get('shops/{shop}/reviews', [ReviewController::class, 'index'])->name('shops.reviews.index');
     //一般ユーザとしてログイン済かつメール認証済で有料プラン未登録の場合
    Route::group(['middleware' => [NotSubscribed::class]], function () {
       Route::get('subscription/create', [SubscriptionController::class, 'create'])->name('subscription.create');
       Route::post('subscription', [SubscriptionController::class, 'store'])->name('subscription.store');
    });

    //一般ユーザとしてログイン済かつメール認証済で有料プラン登録済の場合
    Route::group(['middleware' => [Subscribed::class]], function () {
       Route::get('subscription/edit', [SubscriptionController::class, 'edit'])->name('subscription.edit');
       Route::patch('subscription', [SubscriptionController::class, 'update'])->name('subscription.update');
       Route::get('subscription/cancel', [SubscriptionController::class, 'cancel'])->name('subscription.cancel');
       Route::delete('subscription', [SubscriptionController::class, 'destroy'])->name('subscription.destroy');
       // レビュー投稿ページのルート
       Route::get('shops/{shop}/reviews/create', [ReviewController::class, 'create'])->name('shops.reviews.create');
       // レビュー投稿処理のルート
       Route::post('shops/{shop}/reviews', [ReviewController::class, 'store'])->name('shops.reviews.store');
       // レビュー編集ページのルート
       Route::get('shops/{shop}/reviews/{review}/edit', [ReviewController::class, 'edit'])->name('shops.reviews.edit');
       // レビュー更新処理のルート
       Route::patch('shops/{shop}/reviews/{review}', [ReviewController::class, 'update'])->name('shops.reviews.update');
       // レビュー削除処理のルート
       Route::delete('shops/{shop}/reviews/{review}', [ReviewController::class, 'destroy'])->name('shops.reviews.destroy');
       //予約機能作成の為
       Route::get('reservations', [ReservationController::class, 'index'])->name('reservations.index');
       Route::get('shops/{shop}/reservations/create', [ReservationController::class, 'create'])->name('shops.reservations.create');
       Route::post('shops/{shop}/reservations', [ReservationController::class, 'store'])->name('shops.reservations.store');
       Route::delete('reservations/{reservation}', [ReservationController::class, 'destroy'])->name('reservations.destroy');
       //お気に入り機能作成の為
       Route::get('favorites', [FavoriteController::class, 'index'])->name('favorites.index');
       Route::post('favorites/{shop_id}', [FavoriteController::class, 'store'])->name('favorites.store');
       Route::delete('favorites/{shop_id}', [FavoriteController::class, 'destroy'])->name('favorites.destroy');
    });
  }); 
}); 

Route::middleware(['guest:admin'])->group(function () {                                                      //管理者としてログインしていない状態でのみアクセスを許可
    Route::get('/company', [MemberCompanyController::class, 'index'])->name('company.index');
    Route::get('/terms', [MemberTermController::class, 'index'])->name('terms.index');
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

