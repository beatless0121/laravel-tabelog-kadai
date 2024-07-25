<?php

namespace App\Providers;

use App\Models\Member;                                     //usersテーブルからmembersテーブルに変更の為、追加（決済システム）
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;                       //ページネーションをBootstrap対応に変更する為、追加
use Laravel\Cashier\Cashier;                               //usersテーブルからmembersテーブルに変更の為、追加（決済システム）

class AppServiceProvider extends ServiceProvider
{
   /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
         
         Paginator::useBootstrap();                             //ページネーションをBootstrap対応に変更する為、追加
         Cashier::useCustomerModel(Member::class);              //usersテーブルからmembersテーブルに変更の為、追加（決済システム）
    }
}
