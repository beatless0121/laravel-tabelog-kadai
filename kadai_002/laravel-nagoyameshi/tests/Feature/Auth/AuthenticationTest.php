<?php

namespace Tests\Feature\Auth;

use App\Models\Member;                                                                        //usersテーブルからmembersテーブルへ変更の為、変更
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthenticationTest extends TestCase
{
    use RefreshDatabase;

    public function test_login_screen_can_be_rendered(): void
    {
        $response = $this->get('/login');

        $response->assertStatus(200);
    }

    public function test_users_can_authenticate_using_the_login_screen(): void
    {
        $member = Member::factory()->create();                                               //usersテーブルからmembersテーブルへ変更の為、変更（テスト時）

        $response = $this->post('/login', [                                                  //usersテーブルからmembersテーブルへ変更の為、変更（テスト時）
            'email' => $member->email,                                                       //usersテーブルからmembersテーブルへ変更の為、変更（テスト時）
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        $response->assertRedirect(RouteServiceProvider::HOME);
    }

    public function test_users_can_not_authenticate_with_invalid_password(): void
    {
        $member = Member::factory()->create();                                              //usersテーブルからmembersテーブルへ変更の為、変更 （テスト時）                                     

        $this->post('/login', [
            'email' => $member->email,                                                     //usersテーブルからmembersテーブルへ変更の為、変更 （テスト時）
            'password' => 'wrong-password',
        ]);

        $this->assertGuest();
    }

    public function test_users_can_logout(): void
    {
        $member = Member::factory()->create();                                            //usersテーブルからmembersテーブルへ変更の為、変更（テスト時）

        $response = $this->actingAs($member)->post('/logout');                            //usersテーブルからmembersテーブルへ変更の為、変更（テスト時）

        $this->assertGuest();
        $response->assertRedirect('/');
    }
}
