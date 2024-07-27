<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reservation extends Model
{
    use HasFactory;

    protected $fillable = [
        'reserved_datetime',
        'number_of_people',
        'shop_id',
        'member_id',
    ];

     //リレーション設定（予約機能作成の為）
    public function shop()
    {
        return $this->belongsTo(Shop::class);
    }

    public function member()
    {
        return $this->belongsTo(Member::class);
    }
}
