<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Kyslik\ColumnSortable\Sortable;                                          //並び替え機能有効化

class Shop extends Model
{
    use HasFactory, Sortable;                                               //並び替え機能有効化

    protected $fillable = [
        'name',
        'image',
        'description',
        'lowest_price',
        'highest_price',
        'postal_code',
        'address',
        'opening_time',
        'closing_time',
        'seating_capacity',
    ];

    //リレーションシップ設定（カテゴリ設定の為）
    public function categories() {
        return $this->belongsToMany(Category::class)->withTimestamps();
    }

     //リレーションシップ設定（定休日設定の為)
     public function regular_holidays() {
        return $this->belongsToMany(RegularHoliday::class)->withTimestamps();
    }

    //リレーションシップ設定（レビュー機能設定の為)
    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    //リレーションシップ設定(レビュー機能設定の為)
    public function ratingSortable($query, $direction) {
        return $query->withAvg('reviews', 'score')->orderBy('reviews_avg_score', $direction);
    }

    //リレーションシップ設定(予約機能設定の為)
    public function reservations()
    {
        return $this->hasMany(Reservation::class);
    }

    //並び替え(予約機能追加設定の為)
    public function popularSortable()
    {
        return $this->withCount('reservations')->orderBy('reservations_count', 'desc');
    }

     //リレーションシップ設定(お気に入り機能設定の為)
    public function members()
    {
        return $this->belongsToMany(Member::class, 'shop_member')->withTimestamps();
    }
}
