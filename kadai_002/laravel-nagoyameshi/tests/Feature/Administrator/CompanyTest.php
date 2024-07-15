<?php

namespace Tests\Feature\Administrator;

use App\Models\Member; 
use App\Models\Administrator;
use App\Models\Company;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CompanyTest extends TestCase
{
    use RefreshDatabase;

    /**
     * indexアクション (会社概要ページ)
     * 未ログインのユーザーは管理者側の会社概要ページにアクセスできない
     */
    public function test_non_login_users_cannot_access_the_company_profile_page_on_the_admin(): void
    {
        $response = $this->get(route('admin.company.index'));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * indexアクション (会社概要ページ)
     * ログイン済みの一般ユーザーは管理者側の会社概要ページにアクセスできない
     */
    public function test_gereral_user_login_cannot_access_the_company_profile_page_on_the_admin(): void
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('admin.company.index'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * indexアクション (会社概要ページ)
     * ログイン済みの管理者は管理者側の会社概要ページにアクセスできる
     */

    public function test_admins_can_access_the_company_profile_page(): void
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        // ログイン
        $response = $this->post('/admin/login', [
            'email' => $admin->email,
            'password' => 'password',
        ]);

        $company = Company::factory()->create();

        $response = $this->get(route('admin.company.index'));
        $response->assertStatus(200);
    }

    /**
     * editアクション (会社概要編集ページ)
     * 未ログインのユーザーは管理者側の会社概要編集ページにアクセスできない
     */
    public function test_non_login_users_cannot_access_the_company_profile_edit_page_on_the_admin(): void
    {
        $company = Company::factory()->create();
        $response = $this->get(route('admin.company.edit',[$company->id]));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * editアクション (会社概要編集ページ)
     * ログイン済みの一般ユーザーは管理者側の会社概要編集ページにアクセスできない
     */
    public function test_gereral_user_login_cannot_access_the_company_profile_edit_page_on_the_admin(): void
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $company = Company::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('admin.company.edit', [$company->id]));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * editアクション (会社概要編集ページ)
     * ログイン済みの管理者は管理者側の会社概要編集ページにアクセスできる
     */

    public function test_admins_can_access_the_company_profile_edit_page(): void
    {
       // 管理者データ作成
       $admin = Administrator::factory()->create();
       
        $company = Company::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('admin.company.edit', [$company->id]));
        $response->assertStatus(200);
    }

    /**
     * updateアクション (会社概要更新機能)
     * 未ログインのユーザーは管理者側の会社概要更新できない
     */
    public function test_non_login_users_cannot_access_the_company_profile_update_on_the_admin(): void
    {
        $company = Company::factory()->create();
        $response = $this->patch(route('admin.company.update', [$company->id]));

        $response->assertRedirect(route('admin.login'));
    }

    /**
     * updateアクション (会社概要更新機能)
     * ログイン済みの一般ユーザーは管理者側の会社概要更新できない
     */
    public function test_gereral_user_login_cannot_access_the_company_profile_update_on_the_admin(): void
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $company = Company::factory()->create();

        $response = $this->actingAs($member, 'web')->patch(route('admin.company.update',[$company->id]));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * updateアクション (会社概要更新機能)
     * ログイン済みの管理者は管理者側の会社概要更新できる
     */

    public function test_admins_can_access_the_company_profile_update(): void
    {
        // 管理者データ作成
       $admin = Administrator::factory()->create();

        // 店舗データ作成
        $old_company = Company::factory()->create();

        $new_company = [
            'name' => 'テスト2',
            'postal_code' => '1000000',
            'address' => 'テスト2',
            'representative' => 'テスト2',
            'establishment_date' => 'テスト2',
            'capital' => 'テスト2',
            'business' => 'テスト2',
            'number_of_employees' => 'テスト2',
        ];

        $response = $this->actingAs($admin, 'admin')->patch(route('admin.company.update',$old_company),$new_company);

        // レスポンスがリダイレクトであることを確認（リダイレクト先の店舗詳細画面を表示する際、何の店舗詳細なのかをパラメータで表示）
        $response->assertRedirect(route('admin.company.index', $old_company));
    }
}
