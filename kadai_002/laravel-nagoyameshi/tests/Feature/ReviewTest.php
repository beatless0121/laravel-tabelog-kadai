<?php

namespace Tests\Feature;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Shop;
use App\Models\Review;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ReviewTest extends TestCase
{
    //APPID:price_1PeSSXLjZq1DMeKQW2RciScN
      use RefreshDatabase;
  
      // 未ログインのユーザーは会員側のレビュー一覧ページにアクセスできない
      public function test_guest_cannot_access_reviews_index()
      {
          $shop = Shop::factory()->create();
  
          $response = $this->get(route('shops.reviews.index', $shop));
  
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員は会員側のレビュー一覧ページにアクセスできる
      public function test_free_member_can_access_reviews_index()
      {
         // 会員データ作成
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($member)->get(route('shops.reviews.index', $shop));
  
          $response->assertStatus(200);
      }
  
      // ログイン済みの有料会員は会員側のレビュー一覧ページにアクセスできる
      public function test_premium_member_can_access_reviews_index()
      {
          // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($member)->get(route('shops.reviews.index', $shop));
  
          $response->assertStatus(200);
      }
  
      // ログイン済みの管理者は会員側のレビュー一覧ページにアクセスできない
      public function test_admin_cannot_access_reviews_index()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($admin, 'admin')->get(route('shops.reviews.index',$shop));
  
          $response->assertRedirect(route('admin.home'));
      }
  
      // 未ログインのユーザーは会員側のレビュー投稿ページにアクセスできない
      public function test_guest_cannot_access_reviews_create()
      {
          $shop = Shop::factory()->create();
  
          $response = $this->get(route('shops.reviews.create', $shop));
  
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員は会員側のレビュー投稿ページにアクセスできない
      public function test_free_member_cannot_access_reviews_create()
      {
          // 会員データ作成
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($member,'web')->get(route('shops.reviews.create',$shop));

          $response->assertRedirect(route('subscription.create'));
      }
  
      // ログイン済みの有料会員は会員側のレビュー投稿ページにアクセスできる
      public function test_premium_member_can_access_reviews_create()
      {
          // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($member)->get(route('shops.reviews.create', $shop));
  
          $response->assertStatus(200);
      }
  
      // ログイン済みの管理者は会員側のレビュー投稿ページにアクセスできない
      public function test_admin_cannot_access_reviews_create()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $response = $this->actingAs($admin, 'admin')->get(route('shops.reviews.create', $shop));

          $response->assertRedirect(route('admin.home'));
      }
  
      // 未ログインのユーザーはレビューを投稿できない
      public function test_guest_cannot_access_reviews_store()
      {
          $shop = Shop::factory()->create();
  
          $review = [
              'score' => 1,
              'content' => 'テスト'
          ];
  
          $response = $this->post(route('shops.reviews.store', $shop), $review);
  
          $this->assertDatabaseMissing('reviews', $review);
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員はレビューを投稿できない
      public function test_free_member_cannot_access_reviews_store()
      {
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = [
              'score' => 1,
              'content' => 'テスト'
          ];
  
          $response = $this->actingAs($member)->post(route('shops.reviews.store', $shop), $review);
  
          $this->assertDatabaseMissing('reviews', $review);
          $response->assertRedirect(route('subscription.create'));
      }
  
      // ログイン済みの有料会員はレビューを投稿できる
      public function test_premium_member_can_access_reviews_store()
      {
          // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $review = [
              'score' => 1,
              'content' => 'テスト'
          ];
  
          $response = $this->actingAs($member)->post(route('shops.reviews.store', $shop), $review);
  
          $this->assertDatabaseHas('reviews', $review);
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの管理者はレビューを投稿できない
      public function test_admin_cannot_access_reviews_store()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = [
              'score' => 1,
              'content' => 'テスト'
          ];
  
          $response = $this->actingAs($admin, 'admin')->post(route('shops.reviews.store', $shop), $review);
  
          $this->assertDatabaseMissing('reviews', $review);
          $response->assertRedirect(route('admin.home'));
      }
  
      // 未ログインのユーザーは会員側のレビュー編集ページにアクセスできない
      public function test_guest_cannot_access_reviews_edit()
      {
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->get(route('shops.reviews.edit', [$shop, $review]));
  
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員は会員側のレビュー編集ページにアクセスできない
      public function test_free_member_cannot_access_reviews_edit()
      {
         // 会員データ作成
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->actingAs($member)->get(route('shops.reviews.edit', [$shop, $review]));
  
          $response->assertRedirect(route('subscription.create'));
      }
  
      // ログイン済みの有料会員は会員側の他人のレビュー編集ページにアクセスできない
      public function test_premium_member_cannot_access_others_reviews_edit()
      {
        // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
          $other_member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $other_member->id
          ]);
  
          $response = $this->actingAs($member)->get(route('shops.reviews.edit', [$shop, $review]));
  
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの有料会員は会員側の自身のレビュー編集ページにアクセスできる
      public function test_premium_member_can_access_own_reviews_edit()
      {
         // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->actingAs($member)->get(route('shops.reviews.edit', [$shop, $review]));
  
          $response->assertStatus(200);
      }
  
      // ログイン済みの管理者は会員側のレビュー編集ページにアクセスできない
      public function test_admin_cannot_access_reviews_edit()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->actingAs($admin, 'admin')->get(route('shops.reviews.edit', [$shop, $review]));
  
          $response->assertRedirect(route('admin.home'));
      }
  
      // 未ログインのユーザーはレビューを更新できない
      public function test_guest_cannot_access_reviews_update()
      {
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $old_review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $new_review = [
              'score' => 5,
              'content' => 'テスト更新'
          ];
  
          $response = $this->patch(route('shops.reviews.update', [$shop, $old_review]), $new_review);
  
          $this->assertDatabaseMissing('reviews', $new_review);
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員はレビューを更新できない
      public function test_free_member_cannot_access_reviews_update()
      {
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $old_review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $new_review = [
              'score' => 5,
              'content' => 'テスト更新'
          ];
  
          $response = $this->actingAs($member)->patch(route('shops.reviews.update', [$shop, $old_review]), $new_review);
  
          $this->assertDatabaseMissing('reviews', $new_review);
          $response->assertRedirect(route('subscription.create'));
      }
  
      // ログイン済みの有料会員は他人のレビューを更新できない
      public function test_premium_member_cannot_access_others_reviews_update()
      {
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
          $other_member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $old_review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $other_member->id
          ]);
  
          $new_review = [
              'score' => 5,
              'content' => 'テスト更新'
          ];
  
          $response = $this->actingAs($member)->patch(route('shops.reviews.update', [$shop, $old_review]), $new_review);
  
          $this->assertDatabaseMissing('reviews', $new_review);
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの有料会員は自身のレビューを更新できる
      public function test_premium_member_can_access_own_reviews_update()
      {
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $old_review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $new_review = [
              'score' => 5,
              'content' => 'テスト更新'
          ];
  
          $response = $this->actingAs($member)->patch(route('shops.reviews.update', [$shop, $old_review]), $new_review);
  
          $this->assertDatabaseHas('reviews', $new_review);
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの管理者はレビューを更新できない
      public function test_admin_cannot_access_reviews_update()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $old_review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $new_review = [
              'score' => 5,
              'content' => 'テスト更新'
          ];
  
          $response = $this->actingAs($admin, 'admin')->patch(route('shops.reviews.update', [$shop, $old_review]), $new_review);
  
          $this->assertDatabaseMissing('reviews', $new_review);
          $response->assertRedirect(route('admin.home'));
      }
  
      // 未ログインのユーザーはレビューを削除できない
      public function test_guest_cannot_access_reviews_destroy()
      {
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->delete(route('shops.reviews.destroy', [$shop, $review]));
  
          $this->assertDatabaseHas('reviews', ['id' => $review->id]);
          $response->assertRedirect(route('login'));
      }
  
      // ログイン済みの無料会員はレビューを削除できない
      public function test_free_member_cannot_access_reviews_destroy()
      {
           // 会員データ作成
          $member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->actingAs($member)->delete(route('shops.reviews.destroy', [$shop, $review]));
  
          $this->assertDatabaseHas('reviews', ['id' => $review->id]);
          $response->assertRedirect(route('subscription.create'));
      }
  
      // ログイン済みの有料会員は他人のレビューを削除できない
      public function test_premium_member_cannot_access_others_reviews_destroy()
      {
          // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
          $other_member = Member::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $other_member->id
          ]);
  
          $response = $this->actingAs($member)->delete(route('shops.reviews.destroy', [$shop, $review]));
  
          $this->assertDatabaseHas('reviews', ['id' => $review->id]);
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの有料会員は自身のレビューを削除できる
      public function test_premium_member_can_access_own_reviews_destroy()
      {
        // 会員データ作成
          $member = Member::factory()->create();
          $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
  
          $shop = Shop::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' =>  $member->id
          ]);
  
          $response = $this->actingAs($member)->delete(route('shops.reviews.destroy', [$shop, $review]));
  
          $this->assertDatabaseMissing('reviews', ['id' => $review->id]);
          $response->assertRedirect(route('shops.reviews.index', $shop));
      }
  
      // ログイン済みの管理者はレビューを削除できない
      public function test_admin_cannot_access_reviews_destroy()
      {
          // 管理者データ作成
          $admin = Administrator::factory()->create();
  
          $shop = Shop::factory()->create();
  
          $member = Member::factory()->create();
  
          $review = Review::factory()->create([
              'shop_id' => $shop->id,
              'member_id' => $member->id
          ]);
  
          $response = $this->actingAs($admin, 'admin')->delete(route('shops.reviews.destroy', [$shop, $review]));
  
          $this->assertDatabaseHas('reviews', ['id' => $review->id]);
          $response->assertRedirect(route('admin.home'));
      }
}
