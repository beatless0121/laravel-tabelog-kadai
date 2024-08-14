<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Administrator;
use Illuminate\Support\Facades\Hash;


class AdministratorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $admin = new Administrator();
        $admin->email = 'admin@example.com';
        $admin->password = Hash::make('nagoyameshi');
        $admin->name = 'nagoyameshi';                                     //コマンド(php artisan db:seed --class=AdministratorSeeder)実行時エラー出たため、追加

        //課題提出用アカウント
        $admin = new Administrator();
        $admin->email = 'Administrator@example.com';
        $admin->password = Hash::make('account');
        $admin->name = 'Administrator';                                     
        $admin->save();
    }
}
