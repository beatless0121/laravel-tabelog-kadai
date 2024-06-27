<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;


class HomeController extends Controller
{
   public function index ()
   {
     //暫定処理
     $highly_rated_restaurants = []; // 評価が高いお店
     $categories = [];               // カテゴリ
     $new_restaurants = [];          // 新規掲載店

     return view('home', compact('highly_rated_restaurants', 'categories', 'new_restaurants'));
   }
}
