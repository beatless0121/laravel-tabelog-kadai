<?php

namespace Tests\Feature\Administrator;

use App\Models\Administrator;
use App\Models\Member;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class HomeTest extends TestCase
{
    use RefreshDatabase;
     
     // ---
     //index
     // ---
     // 未ログインのユーザーは管理者側のトップページにアクセスできない
    public function test_guest_cannot_access_admin_home()
    {
        $response = $this->get(route('admin.home'));

        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは管理者側のトップページにアクセスできない
    public function test_member_cannot_access_admin_home()
    {
        $member = Member::factory()->create();

        $response = $this->actingAs($member)->get(route('admin.home'));

        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの管理者は管理者側のトップページにアクセスできる
    public function test_admin_can_access_admin_home()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('admin.home'));

        $response->assertStatus(200);
    }
}
