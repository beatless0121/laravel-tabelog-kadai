<?php

namespace Tests\Feature\Administrator;

use App\Models\Administrator;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class MemberTest extends TestCase
{
        use RefreshDatabase;

    /** テスト: 未ログインのユーザーは管理者側の会員一覧ページにアクセスできない */
    public function test_guest_member_cannot_access_admin_members_index()
    {
        $response = $this->get('/admin/members');
        $response->assertRedirect('/login');  // URLが正しいことを確認
    }

    // 一般ユーザー(非管理者)の認可ロジックが正しく設定されているか確認
    /** テスト: ログイン済みの一般ユーザーは管理者側の会員一覧ページにアクセスできない */
    public function test_non_admin_member_cannot_access_admin_members_index()
    {
        $member = Member::factory()->create();

        $response = $this->actingAs($member)->get('/admin/members');
        $response->assertStatus(403);  // ステータスが403 Forbiddenであることを確認
    }

    // 管理者の認証・認可ロジックが正しく設定されているか確認
    /** テスト: ログイン済みの管理者は管理者側の会員一覧ページにアクセスできる */
    public function test_admin_member_can_access_admin_members_index()
    {
        $admin = Menber::factory()->admin()->create();  // ファクトリーにadmin状態を持たせる

        $response = $this->actingAs($admin)->get('/admin/members');
        $response->assertStatus(200);  // ステータスが200 OKであることを確認
    }

    /** テスト: 未ログインのユーザーは管理者側の会員詳細ページにアクセスできない */
    public function test_guest_member_cannot_access_admin_member_show()
    {
        // ID 1のユーザー詳細ページにアクセスする想定
        $response = $this->get('/admin/members/1');
        $response->assertRedirect('/login');  // URLが正しいことを確認
    }

    /** テスト: ログイン済みの一般ユーザーは管理者側の会員詳細ページにアクセスできない */
    public function test_non_admin_member_cannot_access_admin_member_show()
    {
        $member = Member::factory()->create();

        // ID 1のユーザー詳細ページにアクセスする想定
        $response = $this->actingAs($member)->get('/admin/members/1');
        $response->assertStatus(403);  // ステータスが403 Forbiddenであることを確認
    }

    /** テスト: ログイン済みの管理者は管理者側の会員詳細ページにアクセスできる */
    public function test_admin_member_can_access_admin_member_show()
    {
        $admin = Member::factory()->admin()->create();  // ファクトリーにadmin状態を持たせる

        // ID 1のユーザー詳細ページにアクセスする想定
        $response = $this->actingAs($admin)->get('/admin/members/1');
        $response->assertStatus(200);  // ステータスが200 OKであることを確認
    }
}
