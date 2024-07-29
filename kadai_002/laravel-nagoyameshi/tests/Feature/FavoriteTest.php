<?php

namespace Tests\Feature;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Shop;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class FavoriteTest extends TestCase
{
    //APPID:price_1PeSSXLjZq1DMeKQW2RciScN
    use RefreshDatabase;

    // -----
    // index アクション
    // -----
      // 未ログインのユーザーは会員側のお気に入り一覧ページにアクセスできない
     public function test_guest_cannot_access_favorites_index()
     {
         $response = $this->get(route('favorites.index'));
 
         $response->assertRedirect(route('login'));
     }
 
     // ログイン済みの無料会員は会員側のお気に入り一覧ページにアクセスできない
     public function test_free_member_cannot_access_favorites_index()
     {
         $member = Member::factory()->create();
 
         $response = $this->actingAs($member)->get(route('favorites.index'));
 
         $response->assertRedirect(route('subscription.create'));
     }
 
     // ログイン済みの有料会員は会員側のお気に入り一覧ページにアクセスできる
     public function test_premium_member_can_access_favorites_index()
     {
         $member = Member::factory()->create();
         $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
 
         $response = $this->actingAs($member)->get(route('favorites.index'));
 
         $response->assertStatus(200);
     }
 
     // ログイン済みの管理者は会員側のお気に入り一覧ページにアクセスできない
     public function test_admin_cannot_access_favorites_index()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $response = $this->actingAs($admin, 'admin')->get(route('favorites.index'));
 
         $response->assertRedirect(route('admin.home'));
     }
 
    // -----
    // store アクション
    // -----
    // 未ログインのユーザーはお気に入りに追加できない
    public function test_guest_cannot_access_favorites_store()
     {
         $shop = Shop::factory()->create();
 
         $response = $this->post(route('favorites.store', $shop->id));
 
         $this->assertDatabaseMissing('shop_member', ['shop_id' => $shop->id]);
         $response->assertRedirect(route('login'));
     }
 
     // ログイン済みの無料会員はお気に入りに追加できない
     public function test_free_member_cannot_access_favorites_store()
     {
         $member = Member::factory()->create();
 
         $shop = Shop::factory()->create();
 
         $response = $this->actingAs($member)->post(route('favorites.store', $shop->id));
 
         $this->assertDatabaseMissing('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertRedirect(route('subscription.create'));
     }
 
     // ログイン済みの有料会員はお気に入りに追加できる
     public function test_premium_member_can_access_favorites_store()
     {
         $member = Member::factory()->create();
         $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
 
         $shop = Shop::factory()->create();
 
         $response = $this->actingAs($member)->post(route('favorites.store', $shop->id));
 
         $this->assertDatabaseHas('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertStatus(302);
     }
 
     // ログイン済みの管理者はお気に入りに追加できない
     public function test_admin_cannot_access_favorites_store()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $shop = Shop::factory()->create();
 
         $response = $this->actingAs($admin, 'admin')->post(route('favorites.store', $shop->id));
 
         $this->assertDatabaseMissing('shop_member', ['shop_id' => $shop->id]);
         $response->assertRedirect(route('admin.home'));
     }
    // -----
    // destroy アクション
    // -----
    // 未ログインのユーザーはお気に入りを解除できない
     public function test_guest_cannot_access_favorites_destroy()
     {
         $shop = Shop::factory()->create();
 
         $member = Member::factory()->create();
 
         $member->favorite_shops()->attach($shop->id);
 
         $response = $this->delete(route('favorites.destroy', $shop->id));
 
         $this->assertDatabaseHas('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertRedirect(route('login'));
     }
 
     // ログイン済みの無料会員はお気に入りを解除できない
     public function test_free_member_cannot_access_favorites_destroy()
     {
         $member = Member::factory()->create();
 
         $shop = Shop::factory()->create();
 
         $member->favorite_shops()->attach($shop->id);
 
         $response = $this->actingAs($member)->delete(route('favorites.destroy', $shop->id));
 
         $this->assertDatabaseHas('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertRedirect(route('subscription.create'));
     }
 
     // ログイン済みの有料会員はお気に入りを解除できる
     public function test_premium_member_can_access_favorites_destroy()
     {
         $member = Member::factory()->create();
         $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
 
         $shop = Shop::factory()->create();
 
         $member->favorite_shops()->attach($shop->id);
 
         $response = $this->actingAs($member)->delete(route('favorites.destroy', $shop->id));
 
         $this->assertDatabaseMissing('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertStatus(302);
     }
 
     // ログイン済みの管理者はお気に入りを解除できない
     public function test_admin_cannot_access_favorites_destroy()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $shop = Shop::factory()->create();
 
         $member = Member::factory()->create();
 
         $member->favorite_shops()->attach($shop->id);
 
         $response = $this->actingAs($admin, 'admin')->delete(route('favorites.destroy', $shop->id));
 
         $this->assertDatabaseHas('shop_member', ['shop_id' => $shop->id, 'member_id' => $member->id]);
         $response->assertRedirect(route('admin.home'));
     }
}
