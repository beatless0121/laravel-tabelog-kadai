<?php

namespace Tests\Feature\Administrator;

use App\Models\Member; 
use App\Models\Administrator;
use App\Models\Shop;
use App\Models\Category;                                             //カテゴリー設定の為、追加
use App\Models\RegularHoliday;                                      //定休日設定の為
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;                                 //ハッシュ値エラー発生の為                            
use Tests\TestCase;

class ShopTest extends TestCase
{
    use RefreshDatabase;                                            //データベースをリセットしてくれるトレイト

    /**
     * indexアクション（店舗一覧ページ）
     */
    // 未ログインのユーザーは管理者側の店舗一覧ページにアクセスできない
    public function test_guest_cannot_access_admin_shop_index()
    {
        $response = $this->get(route('admin.shops.index'));
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは管理者側の店舗一覧ページにアクセスできない
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

    // ログイン済みの管理者は管理者側の店舗一覧ページにアクセスできる
    public function test_admin_can_access_admin_shop_index()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        // 店舗一覧ページにアクセス
        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.index'));

        $response->assertStatus(200);
    }

    /**
     * showアクション（店舗詳細ページ）
     */
    // 未ログインのユーザーは管理者側の店舗詳細ページにアクセスできない
    public function test_guest_cannot_access_admin_shop_show()
    {
        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->get(route('admin.shops.show', $shop));
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは管理者側の店舗詳細ページにアクセスできない
    public function test_member_cannot_access_admin_shop_show()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        // 店舗データ作成
        $shop = Shop::factory()->create();

        // 会員詳細ページにアクセス
        $response = $this->actingAs($member, 'web')->get(route('admin.shops.show', $shop));

        // 管理者でログインしていないため、管理者ログインページにリダイレクトされる;
        $response->assertStatus(302);
        $response->assertRedirect('admin/login');
    }

    // ログイン済みの管理者は管理者側の店舗詳細ページにアクセスできる
    public function test_admin_can_access_admin_shop_show()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        // 店舗データ作成
        $shop = Shop::factory()->create();

        // 会員詳細ページにアクセス
        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.show', $shop));

        $response->assertStatus(200);
    }

    /**
     * createアクション（店舗登録ページ）
     */
    // 未ログインのユーザーは管理者側の店舗登録ページにアクセスできない
    public function test_guest_cannot_access_admin_shop_create()
    {
        $response = $this->get(route('admin.shops.create'));
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは管理者側の店舗登録ページにアクセスできない
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

    // ログイン済みの管理者は管理者側の店舗登録ページにアクセスできる
    public function test_admin_can_access_admin_shop_create()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
        
        // 店舗登録ページにアクセス
        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.create'));

        $response->assertStatus(200);
    }

    /**
     * storeアクション（店舗登録機能）
     */
    // 未ログインのユーザーは店舗を登録できない
    public function test_guest_cannot_store_shop()
    {      
        $response = $this->post('/admin/shops', []);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは店舗を登録できない
    public function test_member_cannot_store_shop()
    {
        // アクセス先の会員データを作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->post('/admin/shops', []);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの管理者は店舗を登録できる
    public function test_admin_can_store_shop()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
       //カテゴリー設定の為、追加
        $categories = Category::factory()->count(3)->create();
        $category_Ids = $categories->pluck('id')->toArray();
        //定休日設定の為、追加
        $regular_holidays = RegularHoliday::factory()->count(3)->create();
        $regular_holiday_Ids = $regular_holidays->pluck('id')->toArray();

        $shop = [
            'name' => 'テスト',
            'description' => 'テスト',
            'lowest_price' => 1000,
            'highest_price' => 5000,
            'postal_code' => '0000000',
            'address' => 'テスト',
            'opening_time' => '10:00',
            'closing_time' => '20:00',
            'seating_capacity' => 50,
            'category_ids' => $category_Ids,
            'regular_holiday_ids'=>$regular_holiday_Ids,
        ];

         // リクエストを送信
         $response = $this->actingAs($admin, 'admin')->post(route('admin.shops.store'), $shop);
         //カラムがないとエラーが出る為、追加
         unset($shop['category_ids'], $shop['regular_holiday_ids']);
         // データベースにレストランが存在しないことを確認
         $this->assertDatabaseHas('shops', [
            'name' => 'テスト',
            'description' => 'テスト',
        ]);
         // category_shopテーブルでの検証
         foreach ($category_Ids as $categoryId) {
            $this->assertDatabaseHas('category_shop', [
                'category_id' => $categoryId,
            ]);
        }
         // regular_holiday_shopテーブルでの検証
         foreach ($regular_holiday_Ids as $regularHolidayId) {
            $this->assertDatabaseHas('regular_holiday_shop', [
                'regular_holiday_id' => $regularHolidayId,
            ]);
    } 
}

    /**
     * editアクション（店舗編集ページ）
     */
     // 未ログインのユーザーは管理者側の店舗編集ページにアクセスできない
    public function test_guest_cannot_access_admin_shop_edit()
    {
        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->get(route('admin.shops.edit', $shop));
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは管理者側の店舗編集ページにアクセスできない
    public function test_member_cannot_access_admin_shop_edit()
    {
       // アクセス先の会員データを作成
       $member = Member::factory()->create();

        // 店舗データ作成
        $shop = Shop::factory()->create();

       // 店舗登録ページにアクセス
        $response = $this->actingAs($member, 'web')->get(route('admin.shops.edit', $shop));

       // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの管理者は管理者側の店舗編集ページにアクセスできる
    public function test_admin_can_access_admin_shop_edit()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('admin.shops.edit', $shop));

        $response->assertStatus(200);
    }

    /**
     * updateアクション（店舗更新機能）
     */
    // 未ログインのユーザーは店舗を更新できない
    public function test_guest_cannot_update_shop()
    {
        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->put('/admin/shops/' . $shop, []);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは店舗を更新できない
    public function test_member_cannot_update_shop()
    {
       // 会員データを作成
       $member = Member::factory()->create();

        // 店舗データ作成
        $old_shop = Shop::factory()->create();

        //カテゴリー設定の為、追加
        $categories = Category::factory()->count(3)->create();
        $category_Ids = $categories->pluck('id')->toArray();

       //定休日設定の為、追加
       $regular_holidays= RegularHoliday::factory()->create();
       $regular_holiday_Ids = $regular_holidays->pluck('id')->toArray();

       $new_shop = [
           'name' => 'テスト',
           'description' => 'テスト',
           'lowest_price' => 1000,
           'highest_price' => 5000,
           'postal_code' => '0000000',
           'address' => 'テスト',
           'opening_time' => '10:00',
           'closing_time' => '20:00',
           'seating_capacity' => 60,
           'category_ids' => $category_Ids,
           'regular_holiday_ids'=>$regular_holiday_Ids,
       ];

        $response = $this->actingAs($member, 'web')->patch(route('admin.shops.update', $old_shop), $new_shop);

        // 管理者でログインしていないため、管理者ログインページにリダイレクトされる
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの管理者は店舗を更新できる
    public function test_admin_can_update_shop()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
        // 店舗データ作成
        $old_shop = Shop::factory()->create();

        //カテゴリー設定の為、追加
        $categories = Category::factory()->count(3)->create();
        $category_Ids = $categories->pluck('id')->toArray();

        //定休日設定の為、追加
        $regular_holidays = RegularHoliday::factory()->count(3)->create();
        $regular_holiday_Ids = $regular_holidays->pluck('id')->toArray();

        $new_shop = [
            'name' => 'テスト',
            'description' => 'テスト',
            'lowest_price' => 1000,
            'highest_price' => 5000,
            'postal_code' => '0000000',
            'address' => 'テスト',
            'opening_time' => '10:00',
            'closing_time' => '20:00',
            'seating_capacity' => 60,
            'category_ids' => $category_Ids,
            'regular_holiday_ids'=>$regular_holiday_Ids,
        ];
        $response = $this->actingAs($admin, 'admin')->patch(route('admin.shops.update', $old_shop), $new_shop);

        //カラムがないとエラーが出る為、追加
        unset($new_shop['category_ids'], $new_shop['regular_holiday_ids']);

         // データベースcategory_shopにcategory_idsが存在しないことを確認
        foreach ($category_Ids as $category_id) {
            $this->assertDatabaseHas('category_shop', [
                'category_id' => $category_id,
            ]);
        }
        // データベースregular_holiday_shopにregular_holiday_idsが存在しないことを確認
        foreach ($regular_holiday_Ids as $regular_holiday_id) {
            $this->assertDatabaseHas('regular_holiday_shop', [
                'regular_holiday_id' => $regular_holiday_id,
            ]);
        }    
        // レスポンスがリダイレクトであることを確認（リダイレクト先の店舗詳細画面を表示する際、何の店舗詳細なのかをパラメータで表示）
         $response->assertRedirect(route('admin.shops.show', $old_shop));
    }

    /**
     * destroyアクション（店舗削除機能）
     */
    // 未ログインのユーザーは店舗を削除できない
    public function test_guest_cannot_delete_shop()
    {
        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->delete(route('admin.shops.destroy', $shop));

        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの一般ユーザーは店舗を削除できない
    public function test_member_cannot_delete_shop()
    {
        // 会員データを作成
        $member = Member::factory()->create();

        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->actingAs($member, 'web')->delete(route('admin.shops.destroy', $shop));
        $response->assertStatus(302);
        $response->assertRedirect(route('admin.login'));
    }

    // ログイン済みの管理者は店舗を削除できる
    public function test_admin_can_delete_shop()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
  
        // 店舗データ作成
        $shop = Shop::factory()->create();

        $response = $this->actingAs($admin, 'admin')->delete(route('admin.shops.destroy', $shop));

        $response->assertRedirect(route('admin.shops.index'));

        $this->assertDatabaseMissing('shops', [
            'id' => $shop->id,
        ]);
    }
}