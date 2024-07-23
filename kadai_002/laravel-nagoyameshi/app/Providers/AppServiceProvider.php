<?php

namespace App\Providers;

use App\Models\Member;
use Illuminate\Support\ServiceProvider;
use Illuminate\Pagination\Paginator;                       //ページネーションをBootstrap対応に変更する為、追加
use Laravel\Cashier\Cashier;

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
         //ページネーションをBootstrap対応に変更する為、追加
         Paginator::useBootstrap();
         Cashier::useCustomerModel(Member::class);
    }
}
