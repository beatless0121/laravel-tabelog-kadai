<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\User>
 */
class MemberFactory extends Factory                                              //usersテーブルからmembersテーブルへ変更の為、名称（UserFactory.php）とともに変更（テスト時）
{
    /**
     * The current password being used by the factory.
     */
    protected static ?string $password;                                         //テスト時passswordエラー発生の為

    public function definition(): array
    {
        return [
            'name' => fake()->name(),
            'kana' => fake()->kanaName(),
            'email' => fake()->unique()->safeEmail(),
            'email_verified_at' => now(),
            'password' => static::$password ??= Hash::make('password'),
            'remember_token' => Str::random(10),
            'postal_code' => fake()->postcode(),
            'address' => fake()->address(),
            'phone_number' => fake()->phoneNumber(),
        ];
    }

   /**
     * Indicate that the model's email address should be unverified.
     */
    public function unverified(): static
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}
