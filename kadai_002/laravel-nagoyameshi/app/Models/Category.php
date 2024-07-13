<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
    ];

    //カテゴリ設定の為、追加
    public function shops() {
        return $this->belongsToMany(Shop::class)->withTimestamps();
    }
}
