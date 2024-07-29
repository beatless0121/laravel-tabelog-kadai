<?php

namespace Tests\Feature;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Company;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CompanyTest extends TestCase
{
    use RefreshDatabase;

    // 未ログインのユーザーは会員側の会社概要ページにアクセスできる
    public function test_guest_can_access_company_index()
    {
        $company = Company::factory()->create();

        $response = $this->get(route('company.index'));

        $response->assertStatus(200);
    }

    // ログイン済みの一般ユーザーは会員側の会社概要ページにアクセスできる
    public function test_member_can_access_company_index()
    {
        $member = Member::factory()->create();

        $company = Company::factory()->create();

        $response = $this->actingAs($member)->get(route('company.index'));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の会社概要ページにアクセスできない
    public function test_admin_cannot_access_company_index()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $company = Company::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('company.index'));

        $response->assertRedirect(route('admin.home'));
    }
}
