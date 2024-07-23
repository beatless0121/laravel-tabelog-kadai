<?php

namespace Tests\Feature;

use App\Models\Member;
use App\Models\Administrator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class SubscriptionTest extends TestCase
{
    use RefreshDatabase;

    // ---
    //create
    // ---
      //APPID:price_1PeSSXLjZq1DMeKQW2RciScN
        // 未ログインのユーザーは有料プラン登録ページにアクセスできない
        public function test_guest_cannot_access_subscription_create()
        {
            $response = $this->get(route('subscription.create'));
    
            $response->assertRedirect(route('login'));
        }
    
        // ログイン済みの無料会員は有料プラン登録ページにアクセスできる
        public function test_free_member_can_access_subscription_create()
        {
            // 会員データ作成
            $member = Member::factory()->create();
    
            $response = $this->actingAs($member,'web')->get(route('subscription.create'));
    
            $response->assertStatus(200);
        }
    
        // ログイン済みの有料会員は有料プラン登録ページにアクセスできない
        public function test_premium_member_cannot_access_subscription_create()
        {
            // 会員データ作成
            $member = Member::factory()->create();
            $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
    
            $response = $this->actingAs($member)->get(route('subscription.create'));
    
            $response->assertRedirect(route('subscription.edit'));
        }
    
        // ログイン済みの管理者は有料プラン登録ページにアクセスできない
        public function test_admin_cannot_access_subscription_create()
        {
            // 管理者データ作成
            $admin = Administrator::factory()->create();
    
            $response = $this->actingAs($admin, 'admin')->get(route('subscription.create'));
    
            $response->assertRedirect(route('admin.home'));
        }

    // ---
    //store
    // ---
     // 未ログインのユーザーは有料プランに登録できない
     public function test_guest_cannot_access_subscription_store()
     {
         $request_parameter = [
             'paymentMethodId' => 'pm_card_visa'
         ];

         $response = $this->post(route('subscription.store'), $request_parameter);
 
         $response->assertRedirect(route('login'));
     }
 
     // ログイン済みの無料会員は有料プランに登録できる
     public function test_free_member_can_access_subscription_store()
     {
        // 会員データ作成
         $member = Member::factory()->create();
 
         $request_parameter = [
             'paymentMethodId' => 'pm_card_visa'
         ];
 
         $response = $this->actingAs($member,'web')->post(route('subscription.store'), $request_parameter);
 
         $response->assertRedirect(route('home'));
 
         $member->refresh();
         $this->assertTrue($member->subscribed('premium_plan'));
     }
 
     // ログイン済みの有料会員は有料プランに登録できない
     public function test_premium_member_cannot_access_subscription_store()
     {
        // 会員データ作成
         $member = Member::factory()->create();
         $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
 
         $request_parameter = [
             'paymentMethodId' => 'pm_card_visa'
         ];
 
         $response = $this->actingAs($member,'web')->post(route('subscription.store'), $request_parameter);
 
         $response->assertRedirect(route('subscription.edit'));
     }
 
     // ログイン済みの管理者は有料プランに登録できない
     public function test_admin_cannot_access_subscription_store()
     {
         // 管理者データ作成
         $admin = Administrator::factory()->create();
 
         $request_parameter = [
             'paymentMethodId' => 'pm_card_visa'
         ];
 
         $response = $this->actingAs($admin, 'admin')->post(route('subscription.store'), $request_parameter);
 
         $response->assertRedirect(route('admin.home'));
     }
    // ---
    //edit
    // ---
    // 未ログインのユーザーはお支払い方法編集ページにアクセスできない
    public function test_guest_cannot_access_subscription_edit()
    {
        $response = $this->get(route('subscription.edit'));

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員はお支払い方法編集ページにアクセスできない
    public function test_free_member_cannot_access_subscription_edit()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member,'web')->get(route('subscription.edit'));

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員はお支払い方法編集ページにアクセスできる
    public function test_premium_member_can_access_subscription_edit()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $response = $this->actingAs($member,'web')->get(route('subscription.edit'));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者はお支払い方法編集ページにアクセスできない
    public function test_admin_cannot_access_subscription_edit()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('subscription.edit'));

        $response->assertRedirect(route('admin.home'));
    }

    // ---
    //update
    // ---
   // 未ログインのユーザーはお支払い方法を更新できない
    public function test_guest_cannot_access_subscription_update()
    {
        $request_parameter = [
            'paymentMethodId' => 'pm_card_mastercard'
        ];

        $response = $this->patch(route('subscription.update'), $request_parameter);

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員はお支払い方法を更新できない
    public function test_free_member_cannot_access_subscription_update()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $request_parameter = [
            'paymentMethodId' => 'pm_card_mastercard'
        ];

        $response = $this->actingAs($member,'web')->patch(route('subscription.update'), $request_parameter);

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員はお支払い方法を更新できる
    public function test_premium_member_can_access_subscription_update()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $original_payment_method_id = $member->defaultPaymentMethod()->id;

        $request_parameter = [
            'paymentMethodId' => 'pm_card_mastercard'
        ];

        $response = $this->actingAs($member,'web')->patch(route('subscription.update'), $request_parameter);

        $response->assertRedirect(route('home'));

        $member->refresh();
        $this->assertNotEquals($original_payment_method_id, $member->defaultPaymentMethod()->id);
    }

    // ログイン済みの管理者はお支払い方法を更新できない
    public function test_admin_cannot_access_subscription_update()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $request_parameter = [
            'paymentMethodId' => 'pm_card_mastercard'
        ];

        $response = $this->actingAs($admin, 'admin')->patch(route('subscription.update'), $request_parameter);

        $response->assertRedirect(route('admin.home'));
    }

    // ---
    //cancel
    // ---
    // 未ログインのユーザーは有料プラン解約ページにアクセスできない
    public function test_guest_cannot_access_subscription_cancel()
    {
        $response = $this->get(route('subscription.cancel'));

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は有料プラン解約ページにアクセスできない
    public function test_free_member_cannot_access_subscription_cancel()
    {
        // 会員データ作成
        $member = member::factory()->create();

        $response = $this->actingAs($member,'web')->get(route('subscription.cancel'));

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は有料プラン解約ページにアクセスできる
    public function test_premium_member_can_access_subscription_cancel()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $response = $this->actingAs($member,'web')->get(route('subscription.cancel'));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者は有料プラン解約ページにアクセスできない
    public function test_admin_cannot_access_subscription_cancel()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('subscription.cancel'));

        $response->assertRedirect(route('admin.home'));
    }

    // ---
    //destroy
    // ---
      // 未ログインのユーザーは有料プランを解約できない
   public function test_guest_cannot_access_subscription_destroy()
    {
        $response = $this->delete(route('subscription.destroy'));

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は有料プランを解約できない
    public function test_free_member_cannot_access_subscription_destroy()
    {
        // 会員データ作成
        $member = Member::factory()->create();

        $response = $this->actingAs($member,'web')->delete(route('subscription.destroy'));

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は有料プランを解約できる
    public function test_premium_member_can_access_subscription_destroy()
    {
        // 会員データ作成
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $response = $this->actingAs($member,'web')->delete(route('subscription.destroy'));

        $response->assertRedirect(route('home'));

        $member->refresh();
        $this->assertFalse($member->subscribed('premium_plan'));
    }

    // ログイン済みの管理者は有料プランを解約できない
    public function test_admin_cannot_access_subscription_destroy()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->delete(route('subscription.destroy'));

        $response->assertRedirect(route('admin.home'));
    }

}
