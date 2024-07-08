<?php

namespace Tests\Feature\Auth;

use App\Models\member;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Verified;
use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Support\Facades\Event;
use Illuminate\Support\Facades\URL;
use Tests\TestCase;

class EmailVerificationTest extends TestCase
{
    use RefreshDatabase;

    public function test_email_verification_screen_can_be_rendered(): void
    {
        $this->withoutExceptionHandling();                           //テスト時エラー発生の為追加
        $member = member::factory()->create([
            'email_verified_at' => null,
        ]);

        $response = $this->actingAs($member)->get('/verify-email');

        $response->assertStatus(200);
    }

    public function test_email_can_be_verified(): void
    {
        $member = member::factory()->create([
            'email_verified_at' => null,
        ]);

        Event::fake();

        $verificationUrl = URL::temporarySignedRoute(
            'verification.verify',
            now()->addMinutes(60),
            ['id' => $member->id, 'hash' => sha1($member->email)]
        );

        $response = $this->actingAs($member)->get($verificationUrl);

        Event::assertDispatched(Verified::class);
        $this->assertTrue($member->fresh()->hasVerifiedEmail());
        $response->assertRedirect(RouteServiceProvider::HOME.'?verified=1');
    }

    public function test_email_is_not_verified_with_invalid_hash(): void
    {
        $member = member::factory()->create([
            'email_verified_at' => null,
        ]);

        $verificationUrl = URL::temporarySignedRoute(
            'verification.verify',
            now()->addMinutes(60),
            ['id' => $member->id, 'hash' => sha1('wrong-email')]
        );

        $this->actingAs($member)->get($verificationUrl);

        $this->assertFalse($member->fresh()->hasVerifiedEmail());
    }
}
