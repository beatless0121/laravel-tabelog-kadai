<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Contracts\Auth\MustVerifyEmail;                                    //メール認証機能追加（要件定義書必須項目）
use Laravel\Cashier\Billable;                                                     //決済機能追加の為


class Member extends Authenticatable implements MustVerifyEmail                  //メール認証機能追加（要件定義書必須項目）
{
    use Billable, HasApiTokens, HasFactory, Notifiable;                          //決済機能追加の為、修正

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'kana',
        'email',
        'password',
        'postal_code',
        'address',
        'phone_number',
        'birthday',
        'occupation',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
        'password' => 'hashed',
    ];

     //リレーションシップ設定（レビュー機能設定の為）
     public function reviews()
    {
        return $this->hasMany(Review::class);
    }

      //リレーション設定(予約機能設定の為)
      public function reservations()
      {
          return $this->hasMany(Reservation::class);
      }

       //リレーション設定(お気に入り機能設定の為)
      public function favorite_shops()
      {
          return $this->belongsToMany(Shop::class, 'shop_member')->orderBy('shop_member.created_at', 'desc');
      }
}
