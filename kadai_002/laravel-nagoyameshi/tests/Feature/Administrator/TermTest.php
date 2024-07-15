<?php

namespace Tests\Feature\Administrator;

use App\Models\Member; 
use App\Models\Administrator;
use App\Models\Company;
use App\Models\Term;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TermTest extends TestCase
{
    use RefreshDatabase;

    /**
     * indexアクション (利用規約ページ)
     * 未ログインのユーザーは管理者側の利用規約ページにアクセスできない
     */
    public function test_non_login_users_cannot_access_the_terms_page_on_the_admin(): void
    {
        $response = $this->get(route('admin.terms.index'));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * indexアクション (利用規約ページ)
     * ログイン済みの一般ユーザーは管理者側の利用規約ページにアクセスできない
     */
    public function test_gereral_user_login_cannot_access_the_terms_page_on_the_admin(): void
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('admin.terms.index'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * indexアクション (利用規約ページ)
     * ログイン済みの管理者は管理者側の利用規約ページにアクセスできる
     */

    public function test_admins_can_access_the_terms_page(): void
    {
       // 管理者データ作成
       $admin = Administrator::factory()->create();

       // ログイン
       $response = $this->post('/admin/login', [
           'email' => $admin->email,
           'password' => 'password',
       ]);

        $terms = Term::factory()->create();

        $response = $this->get(route('admin.terms.index'));
        $response->assertStatus(200);
    }

    /**
     * editアクション (利用規約編集ページ)
     * 未ログインのユーザーは管理者側の利用規約編集ページにアクセスできない
     */
    public function test_non_login_users_cannot_access_the_terms_edit_page_on_the_admin(): void
    {
        $terms = Term::factory()->create();
        $response = $this->get(route('admin.terms.edit',[$terms->id]));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * editアクション (利用規約編集ページ)
     * ログイン済みの一般ユーザーは管理者側の利用規約編集ページにアクセスできない
     */
    public function test_gereral_user_login_cannot_access_the_terms_edit_page_on_the_admin(): void
    {
       // 会員データ作成
       $member = Member::factory()->create();

        $terms = Term::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('admin.terms.edit', [$terms->id]));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * editアクション (利用規約編集ページ)
     * ログイン済みの管理者は管理者側の利用規約編集ページにアクセスできる
     */

    public function test_admins_can_access_the_terms_edit_page(): void
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $terms = Term::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('admin.terms.edit', [$terms->id]));
        $response->assertStatus(200);
    }

    /**
     * updateアクション (利用規約更新機能)
     * 未ログインのユーザーは管理者側の利用規約更新できない
     */
    public function test_non_login_users_cannot_access_the_terms_update_on_the_admin(): void
    {
        $terms = Term::factory()->create();
        $response = $this->patch(route('admin.terms.update', [$terms->id]));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * updateアクション (利用規約更新機能)
     * ログイン済みの一般ユーザーは管理者側の利用規約更新できない
     */
    public function test_gereral_user_login_cannot_access_the_terms_update_on_the_admin(): void
    {
       // 会員データ作成
       $member = Member::factory()->create();

        $terms = Term::factory()->create();

        $response = $this->actingAs($member, 'web')->patch(route('admin.terms.update',[$terms->id]));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * updateアクション (利用規約更新機能)
     * ログイン済みの管理者は管理者側の利用規約更新できる
     */

    public function test_admins_can_access_the_terms_update(): void
    {
        // 管理者データ作成
       $admin = Administrator::factory()->create();

        // ログイン
        $response = $this->post('/admin/login', [
            'email' => $admin->email,
            'password' => 'password',
        ]);

        $terms = Term::factory()->create();

        $response = $this->patch(route('admin.terms.update',[$terms->id]),[
            'content' => 'テスト2',
        ]);
        $response->assertStatus(302);
    }
}
