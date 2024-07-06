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
    protected $model = Member::class;                                           //テスト時エラー発生の為、追加

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

    public function admin()
    {
        return $this->state(function (array $attributes) {
            return [
                'is_admin' => true, // 管理者ユーザーとして生成
            ];
        });
    }
}
