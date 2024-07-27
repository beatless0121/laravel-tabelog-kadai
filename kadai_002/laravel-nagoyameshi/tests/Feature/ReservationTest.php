<?php

namespace Tests\Feature;

use App\Models\Administrator;
use App\Models\Member;
use App\Models\Shop;
use App\Models\Reservation;
use Illuminate\Support\Facades\Hash;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class ReservationTest extends TestCase
{
    //APPID:price_1PeSSXLjZq1DMeKQW2RciScN
    use RefreshDatabase;

    // 未ログインのユーザーは会員側の予約一覧ページにアクセスできない
    public function test_guest_cannot_access_reservations_index()
    {
        $response = $this->get(route('reservations.index'));

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は会員側の予約一覧ページにアクセスできない
    public function test_free_member_cannot_access_reservations_index()
    {
        $member = Member::factory()->create();

        $response = $this->actingAs($member)->get(route('reservations.index'));

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は会員側の予約一覧ページにアクセスできる
    public function test_premium_member_can_access_reservations_index()
    {
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $response = $this->actingAs($member)->get(route('reservations.index'));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の予約一覧ページにアクセスできない
    public function test_admin_cannot_access_reservations_index()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('reservations.index'));

        $response->assertRedirect(route('admin.home'));
    }

    // 未ログインのユーザーは会員側の予約ページにアクセスできない
    public function test_guest_cannot_access_reservations_create()
    {
        $shop = Shop::factory()->create();

        $response = $this->get(route('shops.reservations.create', $shop));

        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は会員側の予約ページにアクセスできない
    public function test_free_member_cannot_access_reservations_create()
    {
        $member = Member::factory()->create();

        $shop = Shop::factory()->create();

        $response = $this->actingAs($member)->get(route('shops.reservations.create', $shop));

        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は会員側の予約ページにアクセスできる
    public function test_premium_member_can_access_reservations_create()
    {
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $shop = Shop::factory()->create();

        $response = $this->actingAs($member)->get(route('shops.reservations.create', $shop));

        $response->assertStatus(200);
    }

    // ログイン済みの管理者は会員側の予約ページにアクセスできない
    public function test_admin_cannot_access_reservations_create()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();
        $shop = shop::factory()->create();

        $response = $this->actingAs($admin, 'admin')->get(route('shops.reservations.create', $shop));

        $response->assertRedirect(route('admin.home'));
    }

    // 未ログインのユーザーは予約できない
    public function test_guest_cannot_access_reservations_store()
    {
        $shop = Shop::factory()->create();

        $reservation_data = [
            'reservation_date' => '2024-01-01',
            'reservation_time' => '00:00',
            'number_of_people' => 10
        ];

        $response = $this->post(route('shops.reservations.store', $shop), $reservation_data);

        $this->assertDatabaseMissing('reservations', ['reserved_datetime' => '2024-01-01 00:00', 'number_of_people' => 10]);
        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は予約できない
    public function test_free_member_cannot_access_reservations_store()
    {
        $member = Member::factory()->create();

        $shop = Shop::factory()->create();

        $reservation_data = [
            'reservation_date' => '2024-01-01',
            'reservation_time' => '00:00',
            'number_of_people' => 10
        ];

        $response = $this->actingAs($member)->post(route('shops.reservations.store', $shop), $reservation_data);

        $this->assertDatabaseMissing('reservations', ['reserved_datetime' => '2024-01-01 00:00', 'number_of_people' => 10]);
        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は予約できる
    public function test_premium_member_can_access_reservations_store()
    {
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $shop = shop::factory()->create();

        $reservation_data = [
            'reservation_date' => '2024-01-01',
            'reservation_time' => '00:00',
            'number_of_people' => 10
        ];

        $response = $this->actingAs($member)->post(route('shops.reservations.store', $shop), $reservation_data);

        $this->assertDatabaseHas('reservations', ['reserved_datetime' => '2024-01-01 00:00', 'number_of_people' => 10]);
        $response->assertRedirect(route('reservations.index'));
    }

    // ログイン済みの管理者は予約できない
    public function test_admin_cannot_access_reservations_store()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $shop = Shop::factory()->create();

        $reservation_data = [
            'reservation_date' => '2024-01-01',
            'reservation_time' => '00:00',
            'number_of_people' => 10
        ];

        $response = $this->actingAs($admin, 'admin')->post(route('shops.reservations.store', $shop), $reservation_data);

        $this->assertDatabaseMissing('reservations', ['reserved_datetime' => '2024-01-01 00:00', 'number_of_people' => 10]);
        $response->assertRedirect(route('admin.home'));
    }

    // 未ログインのユーザーは予約をキャンセルできない
    public function test_guest_cannot_access_reservations_destroy()
   {
        $shop = shop::factory()->create();

        $member = member::factory()->create();

        $reservation = Reservation::factory()->create([
            'shop_id' => $shop->id,
            'member_id' => $member->id
        ]);

        $response = $this->delete(route('reservations.destroy', $reservation));

        $this->assertDatabaseHas('reservations', ['id' => $reservation->id]);
        $response->assertRedirect(route('login'));
    }

    // ログイン済みの無料会員は予約をキャンセルできない
    public function test_free_member_cannot_access_reservations_destroy()
    {
        $member = Member::factory()->create();

        $shop = Shop::factory()->create();

        $reservation = Reservation::factory()->create([
            'shop_id' => $shop->id,
            'member_id' => $member->id
        ]);

        $response = $this->actingAs($member)->delete(route('reservations.destroy', $reservation));

        $this->assertDatabaseHas('reservations', ['id' => $reservation->id]);
        $response->assertRedirect(route('subscription.create'));
    }

    // ログイン済みの有料会員は他人の予約をキャンセルできない
    public function test_premium_member_cannot_access_others_reservations_destroy()
    {
        $member = Member::factory()->create();
        
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');
        $other_member = Member::factory()->create();

        $shop = Shop::factory()->create();

        $reservation = Reservation::factory()->create([
            'shop_id' => $shop->id,
            'member_id' => $other_member->id
        ]);

        $response = $this->actingAs($member)->delete(route('reservations.destroy', $reservation));

        $this->assertDatabaseHas('reservations', ['id' => $reservation->id]);
        $response->assertRedirect(route('reservations.index'));
    }

    // ログイン済みの有料会員は自身の予約をキャンセルできる
    public function test_premium_member_can_access_own_reservations_destroy()
    {
        $member = Member::factory()->create();
        $member->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create('pm_card_visa');

        $shop = Shop::factory()->create();

        $reservation = Reservation::factory()->create([
            'shop_id' => $shop->id,
            'member_id' => $member->id
        ]);

        $response = $this->actingAs($member)->delete(route('reservations.destroy', $reservation));

        $this->assertDatabaseMissing('reservations', ['id' => $reservation->id]);
        $response->assertRedirect(route('reservations.index'));
    }

    // ログイン済みの管理者は予約をキャンセルできない
    public function test_admin_cannot_access_reservations_destroy()
    {
        // 管理者データ作成
        $admin = Administrator::factory()->create();

        $shop = Shop::factory()->create();

        $member = Member::factory()->create();

        $reservation = Reservation::factory()->create([
            'shop_id' => $shop->id,
            'member_id' => $member->id
        ]);

        $response = $this->actingAs($admin, 'admin')->delete(route('reservations.destroy', $reservation));

        $this->assertDatabaseHas('reservations', ['id' => $reservation->id]);
        $response->assertRedirect(route('admin.home'));
    }
}
