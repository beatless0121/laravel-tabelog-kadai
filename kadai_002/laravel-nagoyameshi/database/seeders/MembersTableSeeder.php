<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Member;                                    //membersテーブルにダミーデータ追加の為

class MembersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        // MemberFactoryクラスで定義した内容にもとづいてダミーデータを100個生成し、membersテーブルに追加する
        Member::factory()->count(100)->create();

    }
}
