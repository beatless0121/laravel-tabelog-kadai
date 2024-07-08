<?php

namespace Tests\Feature\Administrator;

use App\Models\Administrator;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\Member;  
                                                  
class MemberTest extends TestCase
{
        use RefreshDatabase;
        

    /** テスト: 未ログインのユーザーは管理者側の会員一覧ページにアクセスできない */
    public function test_guest_member_cannot_access_admin_members_index()
    {
        $response = $this->get('/admin/members');
        $response->assertRedirect('admin/login');
    }

    /** テスト: ログイン済みの一般ユーザーは管理者側の会員一覧ページにアクセスできない */
    public function test_non_admin_user_cannot_access_admin_users_index()
    {
        $member = Member::factory()->create();
        $this->actingAs($member);
        $response = $this->actingAs($member)->get('/admin/members');                            //actingAs（ログイン状態）
        $response->assertStatus(403);
    }

    // 管理者の認証・認可ロジックが正しく設定されているか確認
    /** テスト: ログイン済みの管理者は管理者側の会員一覧ページにアクセスできる */
    public function test_admin_member_can_access_admin_members_index()
    {
        $admin = new Administrator();
        $admin->email = 'admin@example.com';
        $admin->password = Hash::make('nagoyameshi');
        $admin->save();
        $response = $this->post('/admin/login', [
            'email' => $admin->email,
            'password' => 'nagoyameshi',
        ]);
        $this->assertTrue(Auth::guard('admin')->check());
        $response = $this->get('/admin/members');
        $response->assertStatus(200);
    }

    /** テスト: 未ログインのユーザーは管理者側の会員詳細ページにアクセスできない */
    public function test_guest_member_cannot_access_admin_member_show()
    {
        // ID 1のユーザー詳細ページにアクセスする想定
        $response = $this->get('/admin/members/1');
        $response->assertRedirect('admin/login');  // URLが正しいことを確認
    }

    /** テスト: ログイン済みの一般ユーザーは管理者側の会員詳細ページにアクセスできない */
    public function test_non_admin_member_cannot_access_admin_member_show()
    {
        $member = Member::factory()->create();
        $this->actingAs($member);
        // ID 1のユーザー詳細ページにアクセスする想定
        $response = $this->actingAs($member)->get('/admin/members/1');
        $response->assertStatus(403);  // ステータスが403 Forbiddenであることを確認
    }

    /** テスト: ログイン済みの管理者は管理者側の会員詳細ページにアクセスできる */
    public function test_admin_member_can_access_admin_member_show()
    {
        $member = Member::factory()->create();
        $admin = new Administrator();
        $admin->email = 'admin@example.com';
        $admin->password = Hash::make('nagoyameshi');
        $admin->save();

        $response = $this->post('/admin/login', [
            'email' => $admin->email,
            'password' => 'nagoyameshi',
        ]);

        $this->assertTrue(Auth::guard('admin')->check());
        $response = $this->get('/admin/members/' . $member->id);
        $response->assertStatus(200);
    }
}
