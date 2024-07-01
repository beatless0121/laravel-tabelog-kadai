<?php

namespace Tests\Feature\Auth;

use App\Models\Member;
use App\Models\Administrator;
use App\Providers\RouteServiceProvider;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;

class AuthenticationTest extends TestCase
{
    use RefreshDatabase;

    // ログイン画面が描画できるかテスト
    public function test_login_screen_can_be_rendered(): void
    {
        $response = $this->get('/login');

        $response->assertStatus(200);
    }

    // 会員でログインしてhome画面にリダイレクトされるかテスト
    public function test_members_can_authenticate_using_the_login_screen(): void
    {
        $member = Member::factory()->create();

        $response = $this->post('/login', [
            'email' => $member->email,
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        $response->assertRedirect(RouteServiceProvider::HOME);
    }

    // 会員でログインしようとしてパスワード間違いで認証されないままかテスト
    public function test_members_can_not_authenticate_with_invalid_password(): void
    {
        $member = Member::factory()->create();

        $this->post('/login', [
            'email' => $member->email,
            'password' => 'wrong-password',
        ]);

        $this->assertGuest();
    }

    // 会員でログイン状態の場合は、ログアウトできるかテスト
    public function test_members_can_logout(): void
    {
        $member = Member::factory()->create();

        $response = $this->actingAs($member)->post('/logout');

        $this->assertGuest();
        $response->assertRedirect('/');
    }

    // 管理者でログインしてhome画面にリダイレクトされるかテスト
    public function test_administrators_can_authenticate_using_the_login_screen(): void
    {
        $administrator = Administrator::factory()->create();

        $response = $this->post('/login', [
            'email' => $administrator->email,
            'password' => 'password',
        ]);

        $this->assertAuthenticated();
        $response->assertRedirect(RouteServiceProvider::HOME);
    }

    // 管理者でログインしようとしてパスワード間違いで認証されないままかテスト
    public function test_administrators_not_authenticate_with_invalid_password(): void
    {
        $administrator = Administrator::factory()->create();

        $this->post('/login', [
            'email' => $administrator->email,
            'password' => 'wrong-password',
        ]);

        $this->assertGuest();
    }

    // 管理者でログイン状態の場合は、ログアウトできるかテスト
    public function test_administrators_can_logout(): void
    {
        $administrator = Administrator::factory()->create();

        $response = $this->actingAs($administrator)->post('/logout');

        $this->assertGuest();
        $response->assertRedirect('/');                                           
    }
}
