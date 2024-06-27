<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Member;

class HomeController extends Controller
{
  public function index ()
  {
     //暫定処理
     $total_users = Member::count(); // 総会員数
     $total_free_users = 0;          // 無料会員数
     $total_premium_users = 0;       // 有料会員数
     $total_restaurants = 0;         // 店舗数
     $total_reservations = 0;        // 総予約数
     $sales_for_this_month = 0;      // 月間売上数

     return view('admin.home', compact('total_users', 'total_free_users', 'total_premium_users', 'total_restaurants', 'total_reservations', 'sales_for_this_month'));
  }
}
