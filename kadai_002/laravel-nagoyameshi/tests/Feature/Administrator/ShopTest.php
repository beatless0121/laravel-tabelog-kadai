<?php

namespace Tests\Feature\Administrator;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;                                        //ハッシュ値エラー発生の為
use App\Models\Member; 
use App\Models\Shop;
use App\Models\Administrator;

class ShopTest extends TestCase
{
    use RefreshDatabase;                                                  //データベースをリセットしてくれるトレイト
    // indexアクション（店舗一覧ページ）
    /**
     * 未ログインのユーザーは管理者側の店舗一覧ページにアクセスできない
     */
    public function test_guest_cannot_access_admin_shop_index()
    {
        $response = $this->get(route('admin.shops.index'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは管理者側の店舗一覧ページにアクセスできない
     */
    public function test_member_cannot_access_admin_shop_index()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        // 店舗一覧ページにアクセス
        $response = $this->actingAs($member, 'web')->get(route('admin.shops.index'));

        // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect('admin/login');
    }

    /**
     * ログイン済みの管理者は管理者側の店舗一覧ページにアクセスできる
     */
    public function test_admin_can_access_admin_shop_index()
    {
       // 管理者データ作成
       $admin = Administrator::factory()->create();

        // 店舗一覧ページにアクセス
       $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.index'));
       $response->assertStatus(200);
    }

    // showアクション（店舗詳細ページ）
    /**
     * 未ログインのユーザーは管理者側の店舗詳細ページにアクセスできない
     */
    public function test_guest_cannot_access_admin_shop_show()
    {
      // 店舗データ作成
      $shop = Shop::factory()->create();

      $response = $this->get('/admin/shops/' . $shop->id);
      $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは管理者側の店舗詳細ページにアクセスできない
     */
    public function test_member_cannot_access_admin_shop_show()
    {
       // 会員データ作成
       $member = Member::factory()->create();

       // 店舗データ作成
       $shop = Shop::factory()->create();

       // 店舗詳細ページにアクセス
       $response = $this->actingAs($member, 'web')->get('/admin/shops/' . $shop->id);

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる;
       $response->assertStatus(302);
       $response->assertRedirect('admin/login');
    }

    /**
     * ログイン済みの管理者は管理者側の店舗詳細ページにアクセスできる
     */
    public function test_admin_can_access_admin_shop_show()
    {
        // 管理者データ作成
       $admin = Administrator::factory()->create();

        //店舗データ作成
        $shop = Shop::factory()->create();

       // 会員詳細ページにアクセス
       $response = $this->actingAs($admin, 'admin')->get('/admin/shops/' . $shop->id);
       $response->assertStatus(200);
    }

    // createアクション（店舗登録ページ）
   /**
     * 未ログインのユーザーは管理者側の店舗登録ページにアクセスできない
     */
    public function test_guest_cannot_access_admin_shop_create()
    {
        $response = $this->get(route('admin.shops.create'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは管理者側の店舗登録ページにアクセスできない
     */
    public function test_member_cannot_access_admin_shop_create()
    {
        // アクセス先の会員データを作成
        $member = Member::factory()->create();

       // 店舗登録ページにアクセス
       $response = $this->actingAs($member, 'web')->get(route('admin.shops.create'));

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
       $response->assertStatus(302);
       $response->assertRedirect('admin/login');
    }

    /**
     * ログイン済みの管理者は管理者側の店舗登録ページにアクセスできる
     */
    public function test_admin_can_access_admin_shop_create()
    {
         // 管理者データ作成
       $admin = Administrator::factory()->create();

        // 店舗登録ページにアクセス
        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.create'));
        $response->assertStatus(200);
    }

    // storeアクション（店舗登録機能）
    /**
     * 未ログインのユーザーは店舗を登録できない
     */
    public function test_guest_cannot_store_shop()
    {
        $response = $this->post('/admin/shops', []);
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは店舗を登録できない
     */
    public function test_member_cannot_store_shop()
    {
       // アクセス先の会員データを作成
       $member = Member::factory()->create();

       // 店舗登録できないため、管理者ログインページにリダイレクトされる
       $response = $this->actingAs($member, 'web')->post('/admin/shops', []);
       $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの管理者は店舗を登録できる
     */
    public function test_admin_can_store_shop()
    {
       // 管理者データ作成
       $admin = Administrator::factory()->create();

       $response = $this->actingAs($admin, 'admin')->post('/admin/shops', [
            'name' => 'テスト',
            'description' => 'テスト',
            'lowest_price' => 1000,
            'highest_price' => 5000,
            'postal_code' => '0000000',
            'address' => 'テスト',
            'opening_time' => '10:00',
            'closing_time' => '20:00',
            'seating_capacity' => 50,
        ]);
        // レスポンスがリダイレクトであることを確認
        $response->assertRedirect(route('admin.shops.store'));
        // データベースにショップが存在しないことを確認
        $this->assertDatabaseHas('shops', [
            'name' => 'テスト',
            'description' => 'テスト',
        ]);
    }

    // editアクション（店舗編集ページ）
    /**
     * 未ログインのユーザーは管理者側の店舗編集ページにアクセスできない
     */
    public function test_guest_cannot_access_admin_shop_edit()
    {
        $response = $this->get(route('admin.shops.edit'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは管理者側の店舗編集ページにアクセスできない
     */
    public function test_member_cannot_access_admin_shop_edit()
    {
       // アクセス先の会員データを作成
       $member = Member::factory()->create();

       // 店舗編集ページにアクセス
       $response = $this->actingAs($member, 'web')->get(route('admin.shops.edit'));

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの管理者は管理者側の店舗編集ページにアクセスできる
     */
    public function test_admin_can_access_admin_shop_edit()
    {
         // 管理者データ作成
        $admin = Administrator::factory()->create();

        // 店舗編集ページにアクセス
        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.edit'));
        $response->assertStatus(200);
    }

    // updateアクション（店舗更新機能）
    /**
     * 未ログインのユーザーは店舗を更新できない
     */
    public function test_guest_cannot_update_shop()
    {
       // 店舗データ作成
       $shop = Shop::factory()->create();

       //店舗を更新できないため、管理者ログインページにリダイレクトされる
       $response = $this->put('/admin/shops/' . $shop->id, []);
       $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは店舗を更新できない
     */
    public function test_member_cannot_update_shop()
    {
       // アクセス先の会員データを作成
       $member = Member::factory()->create();

    　　// 店舗一覧ページにアクセス

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの管理者は店舗を更新できる
     */
    public function test_admin_can_update_shop()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
 
        // ログイン
        $response = $this->post('/admin/login', [
            'email' => $admin->email,
            'password' => 'password',
        ]);

        $response = $this->put(route('admin.shops.update', $shop), [
            'name' => '更新テスト',
            'description' => '更新テスト',
            'lowest_price' => 1500,
            'highest_price' => 5500,
            'postal_code' => '1111111',
            'address' => '更新テスト',
            'opening_time' => '09:00',
            'closing_time' => '21:00',
            'seating_capacity' => 60,
        ]);

        $response->assertRedirect(route('admin.shops.update'));
        $this->assertDatabaseHas('shops', [
            'name' => '更新テスト',
            'description' => '更新テスト',
        ]);
    }

    // destroyアクション（店舗削除機能）
    /**
     * 未ログインのユーザーは店舗を削除できない
     */
    public function test_guest_cannot_delete_shop()
    {
        $response = $this->get(route('admin.shops.update'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの一般ユーザーは店舗を削除できない
     */
    public function test_member_cannot_delete_shop()
    {
        // アクセス先の会員データを作成
       $member = Member::factory()->create();

       // ログイン
       $response = $this->post('/login', [
          'email' => $member->email,
          'password' => 'password',
      ]);

        $response = $this->delete(route('admin.shops.destroy'));
        $response->assertRedirect(route('admin.login'));
    }

    /**
     * ログイン済みの管理者は店舗を削除できる
     */
    public function test_admin_can_delete_shop()
    {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
  
         // ログイン
         $response = $this->post('/admin/login', [
             'email' => $admin->email,
             'password' => 'password',
         ]);

        $response = $this->delete(route('admin.shops.destroy'));
        $response->assertRedirect(route('admin.shops.destroy'));
        $this->assertDatabaseMissing('shops', [
            'id' => $shop->id,
        ]);
    }
}
