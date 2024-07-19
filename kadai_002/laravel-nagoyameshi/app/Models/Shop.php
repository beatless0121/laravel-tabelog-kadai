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

    //カテゴリ設定の為、追加
    public function categories() {
        return $this->belongsToMany(Category::class)->withTimestamps();
    }

     //定休日設定の為、追加
     public function regular_holidays() {
        return $this->belongsToMany(RegularHoliday::class)->withTimestamps();
    }
}
