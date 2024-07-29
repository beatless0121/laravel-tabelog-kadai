<?php

namespace Tests\Feature;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Term;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class TermTest extends TestCase
{
    use RefreshDatabase;

    // 未ログインのユーザーは会員側の利用規約ページにアクセスできる
    public function test_guest_can_access_terms_index()
    {
        $term = Term::factory()->create();

        $response = $this->get(route('terms.index'));

        $response->assertStatus(200);
    }

    // ログイン済みの一般ユーザーは会員側の利用規約ページにアクセスできる
    public function test_member_can_access_terms_index()
    {
        $member = Member::factory()->create();

        $term = Term::factory()->create();

        $response = $this->actingAs($member)->get(route('terms.index'));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の利用規約ページにアクセスできない
    public function test_admin_cannot_access_terms_index()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $term = Term::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('terms.index'));

        $response->assertRedirect(route('admin.home'));
    }
}
