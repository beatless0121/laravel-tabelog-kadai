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

        // メンバー member01 ～
        $member = Member::factory()->create();
        $member->email = 'beatless0121+member01@gmail.com';
        $member->password = Hash::make('nagoyameshi');
        $member->name = 'beatless0121+member01';
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
        $member->save();

        $member = Member::factory()->create();
        $member->email = 'beatless0121+member02@gmail.com';
        $member->password = Hash::make('nagoyameshi');
        $member->name = 'beatless0121+member02';
        $member->save();

        // 他メンバー member11～
        $member = Member::factory()->create();
        $member->email = 'beatless0121+member11@gmail.com';
        $member->password = Hash::make('nagoyameshi');
        $member->name = 'beatless0121+member02';
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
        $member->save();
    }
}
