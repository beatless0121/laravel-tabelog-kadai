<?php

namespace Tests\Feature;

use App\Models\Member;
use App\Models\Administrator;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class MemberTest extends TestCase
{
    use RefreshDatabase;
  
    // 1.indexアクション（会員情報ページ）
    // 未ログインのユーザーは会員側の会員情報ページにアクセスできない
    public function test_guest_cannot_access_member_index()
   {
       $response = $this->get(route('member.index'));
       $response->assertRedirect(route('login'));
   }
  
    
    // ログイン済みの一般ユーザーは会員側の会員情報ページにアクセスできる
    public function test_member_can_access_member_index()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('member.index'));
        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の会員情報ページにアクセスできない
    
    public function test_admin_cannot_access_admin_member_index()
    {   
        // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $response = $this->actingAs($admin, 'admin')->get(route('member.index'));
 
         $response->assertRedirect(route('admin.home'));
    }

    // 2.editアクション（会員情報編集ページ）
    // 未ログインのユーザーは会員側の会員情報編集ページにアクセスできない
    public function test_guest_cannot_access_member_edit()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->get(route('member.edit', $member));
        $response->assertRedirect(route('login'));
    }
    
    
    // ログイン済みの一般ユーザーは会員側の他人の会員情報編集ページにアクセスできない
    public function test_member_cannot_access_other_member_edit()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        $this->actingAs($member);

        //他人の会員データ作成
        $other_member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('member.edit', $other_member));
        $response->assertRedirect(route('member.index'));
    }

    // ログイン済みの一般ユーザーは会員側の自身の会員情報編集ページにアクセスできる
    public function test_member_can_access_member_edit()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        
        $response = $this->actingAs($member, 'web')->get(route('member.edit', $member));
        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の会員情報編集ページにアクセスできない
    public function test_admin_cannot_access_admin_member_edit()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
        $this->actingAs($admin, 'admin');
    
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('member.edit', $member));
        $response->assertRedirect(route('admin.home'));
    }
    
    // 3.updateアクション（会員情報更新機能）
    // 未ログインのユーザーは会員情報を更新できない
    public function test_guest_cannot_update_member()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->put(route('member.update', $member), [
            'name' => '更新テスト',
        ]);

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの一般ユーザーは他人の会員情報を更新できない
    public function test_member_cannot_update_other_member()
    {
         // 会員データ作成
        $member = Member::factory()->create();
        $this->actingAs($member,'web');

        //他人の会員データ作成
        $other_member = Member::factory()->create();

        $response = $this->put(route('member.update', $other_member), $member->toArray());
        $response->assertRedirect(route('member.index'));
    }

    // ログイン済みの一般ユーザーは自身の会員情報を更新できる
    public function test_member_can_update_member()
    {
         // 会員データ作成
        $old_member = Member::factory()->create();
        
        $new_member = [
            'name' => 'テスト更新',
            'kana' => 'テストコウシン',
            'email' => 'test.update@example.com',
            'postal_code' => '1234567',
            'address' => 'テスト更新',
            'phone_number' => '0123456789',
            'birthday' => '20150319',
            'occupation' => 'テスト更新'
        ];

        $response = $this->actingAs($old_member)->patch(route('member.update', $old_member), $new_member);

        $this->assertDatabaseHas('members', $new_member);
        $response->assertRedirect(route('member.index'));
    }

    // ログイン済みの管理者は会員情報を更新できない
    public function test_admin_cannot_update_member()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
        $this->actingAs($admin, 'admin');

        // 会員データ作成
        $member = member::factory()->create();
        $this->actingAs($member, 'web');
        $member->name = '更新テスト';
        
        $response = $this->actingAs($member, 'web')->put(route('member.update', $member), $member->toArray());
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.home'));
    }
}
