<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop;                                                 
use App\Models\Category; 

class HomeController extends Controller
{
    public function index()
    {
        // categoriesテーブルのすべてのデータを取得
        $categories = Category::all();

        // shopsテーブルから6つのデータを取得
        $highly_rated_shops = Shop::withAvg('reviews', 'score')->orderBy('reviews_avg_score', 'desc')->take(6)->get();

       //shopsテーブルから作成日時が新しい順に6つのデータを取得
       $new_shops = Shop::orderBy('created_at', 'desc')->take(6)->get();

        return view('home', compact('highly_rated_shops', 'categories', 'new_shops'));
    }
}
