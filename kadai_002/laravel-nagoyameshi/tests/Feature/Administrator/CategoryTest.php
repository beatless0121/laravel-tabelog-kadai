<?php

namespace Tests\Feature\Administrator;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Category;
use Illuminate\Support\Facades\Hash;                                     //ハッシュ値エラー発生の為 
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class CategoryTest extends TestCase
{
    use RefreshDatabase;                                                 //データベースをリセットしてくれるトレイト

     // 未ログインのユーザーは管理者側のカテゴリ一覧ページにアクセスできない
     public function test_guest_cannot_access_admin_categories_index()
     {
         $response = $this->get(route('admin.categories.index'));
 
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの一般ユーザーは管理者側のカテゴリ一覧ページにアクセスできない
     public function test_member_cannot_access_admin_categories_index()
     {
         // 会員データを作成
         $member = Member::factory()->create();
 
         $response = $this->actingAs($member)->get(route('admin.categories.index'));
 
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの管理者は管理者側のカテゴリ一覧ページにアクセスできる
     public function test_admin_can_access_admin_categories_index()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $response = $this->actingAs($admin, 'admin')->get(route('admin.categories.index'));
 
         $response->assertStatus(200);
     }
 
     // 未ログインのユーザーはカテゴリを登録できない
     public function test_guest_cannot_access_admin_categories_store()
     {
         $response = $this->post('/admin/categories', []);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの一般ユーザーはカテゴリを登録できない
     public function test_member_cannot_access_admin_categories_store()
     {
        // 会員データを作成
         $member = Member::factory()->create();
 
         $response = $this->post('/admin/categories', []);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの管理者はカテゴリを登録できる
     public function test_admin_can_access_admin_categories_store()
     {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
         
          $response = $this->actingAs($admin, 'admin')->withoutMiddleware()->post('/admin/categories', [
            'name' => 'テスト',
          ]);
 
         $response->assertRedirect(route('admin.categories.index'));

          // データベースにショップが存在しないことを確認
            $this->assertDatabaseHas('categories', [
            'name' => 'テスト',
        ]);
     }
 
     // 未ログインのユーザーはカテゴリを更新できない
     public function test_guest_cannot_access_admin_categories_update()
     {
         $old_category = Category::factory()->create();
 
         $new_category = [
             'name' => 'テスト更新',
         ];
 
         $response = $this->patch(route('admin.categories.update', $old_category), $new_category);
 
         $this->assertDatabaseMissing('categories', $new_category);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの一般ユーザーはカテゴリを更新できない
     public function test_member_cannot_access_admin_categories_update()
     {
        // 会員データを作成
         $member = Member::factory()->create();
 
         $old_category = Category::factory()->create();
 
         $new_category = [
             'name' => 'テスト更新',
         ];
 
         $response = $this->actingAs($member,'web')->patch(route('admin.categories.update', $old_category), $new_category);

        // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
         $response->assertStatus(302);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの管理者はカテゴリを更新できる
     public function test_admin_can_access_admin_categories_update()
     {
        // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $old_category = Category::factory()->create();
 
         $new_category = [
             'name' => 'テスト更新',
         ];
 
         $response = $this->actingAs($admin, 'admin')->patch(route('admin.categories.update', $old_category), $new_category);
 
         //更新を評価
        $this->assertDatabaseHas('categories', $new_category);
       
        // レスポンスがリダイレクトであることを確認（$old_category不要）
        $response->assertRedirect(route('admin.categories.index'));
     }
 
     // 未ログインのユーザーはカテゴリを削除できない
     public function test_guest_cannot_access_admin_categories_destroy()
     {
        // カテゴリーデータ作成 
        $category = Category::factory()->create();
 
         $response = $this->delete(route('admin.categories.destroy', $category));
 
         $this->assertDatabaseHas('categories', ['id' => $category->id]);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの一般ユーザーはカテゴリを削除できない
     public function test_member_cannot_access_admin_categories_destroy()
     {
        // 会員データを作成
         $member = member::factory()->create();
         // カテゴリーデータ作成
         $category = Category::factory()->create();
 
         $response = $this->actingAs($member)->delete(route('admin.categories.destroy', $category));
 
         $this->assertDatabaseHas('categories', ['id' => $category->id]);
         $response->assertRedirect(route('admin.login'));
     }
 
     // ログイン済みの管理者はカテゴリを削除できる
     public function test_admin_can_access_admin_categories_destroy()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
          // カテゴリーデータ作成
         $category = Category::factory()->create();
 
         $response = $this->actingAs($admin, 'admin')->delete(route('admin.categories.destroy', $category));
 
         $this->assertDatabaseMissing('categories', ['id' => $category->id]);
         $response->assertRedirect(route('admin.categories.index'));
     }
}
