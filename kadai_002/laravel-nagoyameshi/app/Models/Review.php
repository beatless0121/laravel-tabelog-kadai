<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
    use HasFactory;

    protected $fillable = [
        'content',
        'score',
        'shop_id',
        'member_id',
        'release_flg',
    ];

    public function shop()                                                //リレーションシップ設定（レビュー機能追加の為）
    {
        return $this->belongsTo(Shop::class);
    }

    public function member()                                             //リレーションシップ設定（レビュー機能追加の為）
    {
        return $this->belongsTo(Member::class);
    }
}
