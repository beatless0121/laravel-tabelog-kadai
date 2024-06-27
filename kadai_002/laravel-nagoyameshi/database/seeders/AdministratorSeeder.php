<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
//管理者認証機能追加の為、追加（名人）
use App\Models\Administrator;
use Illuminate\Support\Facades\Hash;

class AdministratorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        //管理者認証機能追加の為、追加(名人)
        $admin = new Administrator();
        $admin->email = 'admin@example.com';
        $admin->password = Hash::make('nagoyameshi');
        $admin->name = 'nagoyameshi';                    //コマンド(php artisan db:seed --class=AdministratorSeeder)実行時エラー出たため、追加
        $admin->save();
    }
}
