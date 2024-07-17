<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Member;
use App\Models\Administrator;

class HomeTest extends TestCase
{
    use RefreshDatabase;
    /**
     * 未ログインのユーザーは会員側のトップページにアクセスできる
     */
    public function test_user_who_are_logged_in_can_access_the_member_top_page(): void
    {
        $response = $this->get(route('home'));

        $response->assertStatus(200);
    }

    /**
     * ログイン済みの一般ユーザーは会員側のトップページにアクセスできる
     */
    public function test_logged_in_general_users_can_access_the_member_top_page()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('home'));
        $response->assertStatus(200);
    }

    /**
     * ログイン済みの管理者は会員側のトップページにアクセスできない
     */
    public function test_logged_in_admin_cannot_access_the_member_top_page()
    {
        // 管理者データ作成
       $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('home'));
        $response->assertRedirect('admin/home');
    }
}
