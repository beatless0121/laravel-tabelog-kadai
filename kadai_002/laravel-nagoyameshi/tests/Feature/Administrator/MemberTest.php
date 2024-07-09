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
        

    /**会員一覧ページの検証
     */
    // テスト: 未ログインのユーザーは管理者側の会員一覧ページにアクセスできない
    public function test_guest_member_cannot_access_admin_members_index()
    {
        $response = $this->get('/admin/members');
        $response->assertRedirect('admin/login');
    }

    // テスト: ログイン済みの一般ユーザーは管理者側の会員一覧ページにアクセスできない
    public function test_non_admin_user_cannot_access_admin_users_index()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        // ログイン
        $response = $this->post('/login', [
            'email' => $member->email,
            'password' => 'password',
        ]);

        // 会員一覧ページにアクセス
        $response = $this->get('/admin/members');

        // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect('admin/login');
    }

    // テスト: ログイン済みの管理者は管理者側の会員一覧ページにアクセスできる
    public function test_admin_member_can_access_admin_members_index()
    {
         // 管理者データ作成
         $admin = Member::factory()->create();

         // ログイン
         $response = $this->post('/admin/login', [
             'email' => $admin->email,
             'password' => 'password',
         ]);
 
         // 会員一覧ページにアクセス
         $response = $this->actingAs($admin, 'admin')->get(route('admin.members.index'));           //テスト時エラーが出た為細かく表示
         $response->assertStatus(200);
     }

     /**
     * 会員詳細ページの検証
     */
    // テスト: 未ログインのユーザーは管理者側の会員詳細ページにアクセスできない
    public function test_guest_member_cannot_access_admin_member_show()
    {
       // ログインしていない状態で会員詳細ページにアクセス
       $response = $this->get('/admin/members/1');

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
       $response->assertStatus(302);
       $response->assertRedirect('admin/login');
   }

    /** テスト: ログイン済みの一般ユーザーは管理者側の会員詳細ページにアクセスできない */
    public function test_non_admin_member_cannot_access_admin_member_show()
    {
         // 会員データ作成
         $member = Member::factory()->create();

        // ログイン
        $response = $this->post('/login', [
          'email' => $member->email,
          'password' => 'password',
        ]);

    // 会員一覧ページにアクセス
    $response = $this->get('/admin/members/1');

    // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
    $response->assertStatus(302);
    $response->assertRedirect('admin/login');
    }

    /** テスト: ログイン済みの管理者は管理者側の会員詳細ページにアクセスできる */
    public function test_admin_member_can_access_admin_member_show()
    {
       // アクセス先の会員データを作成
       $member = Member::factory()->create();

       // 管理者データ作成
       $admin = Member::factory()->create();

       // ログイン
       $response = $this->post('/admin/login', [
           'email' => $admin->email,
           'password' => 'password',
       ]);

       // 会員詳細ページにアクセス
       $response = $this->actingAs($admin, 'admin')->get(route('admin.members.show', $member));       //テスト時エラーが出た為細かく表示
       $response->assertStatus(200);
   }
}
