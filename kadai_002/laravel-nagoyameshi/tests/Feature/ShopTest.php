<?php

namespace Tests\Feature;

use App\Models\Member;
use App\Models\Administrator;
use App\Models\Shop;
use App\Models\Category;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ShopTest extends TestCase
{
    use RefreshDatabase;
     /**
     * 未ログインのユーザーは会員側の店舗一覧ページにアクセスできる
     */
    public function test_guest_can_access_shop_index_page()
    {
        $response = $this->get(route('shops.index'));

        $response->assertStatus(200);
    }

    /**
     * ログイン済みの一般ユーザーは会員側の店舗一覧ページにアクセスできる
     */
    public function test_authenticated_member_can_access_shop_index_page()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member, 'web')->get(route('shops.index'));

        $response->assertStatus(200);
    }


//      * ログイン済みの管理者は会員側の店舗一覧ページにアクセスできない

    public function test_authenticated_admin_cannot_access_shop_index_page()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('shops.index'));

        $response->assertRedirect(route('admin.home'));
    }

    // ・未ログインのユーザーは会員側の店舗詳細ページにアクセスできる
   public function test_guest_can_access_restaurant_show_page()
   {
       $shop = Shop::factory()->create();

       $response = $this->get(route('shops.show', $shop));

       $response->assertStatus(200);
   }

//   ・ログイン済みの一般ユーザーは会員側の店舗詳細ページにアクセスできる
    public function test_authenticated_user_can_access_restaurant_show_page()
    {
        // 会員データ作成
        $member = Member::factory()->create();
       
        $shop = Shop::factory()->create();

       $response = $this->actingAs($member)->get(route('shops.show', $shop));

       $response->assertStatus(200);
     }

   // ・ログイン済みの管理者は会員側の店舗詳細ページにアクセスできない
    public function test_admin_cannot_access_restaurant_show_page()
   {
       // 管理者データ作成
       $admin = Administrator::factory()->create();
       
       $response = $this->actingAs($admin, 'admin')->get('/shops'); 

       $response->assertRedirect(route('admin.home'));
   }
}
