<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Review>
 */
class ReviewFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
                'score' => 1,  // スコアを1に設定
                'content' => 'テスト',  // コンテンツを'テスト'に設定
                'shop_id' => \App\Models\Shop::factory(),  // 関連するショップを生成
                'member_id' => \App\Models\Member::factory(),  // 関連するユーザーを生成
        ];
    }
}
