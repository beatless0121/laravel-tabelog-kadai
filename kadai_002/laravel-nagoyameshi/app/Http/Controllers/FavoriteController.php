<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop;
use App\Models\Member;

class FavoriteController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth');
    }
     //indexアクション
     public function index()
     {
         $member = auth()->user();
         $favorite_shops = $member->favorite_shops()
             ->paginate(15);
 
         return view('favorites.index', compact('favorite_shops'));
     }
 
     //storeアクション
     public function store(Request $request, $shopId)
     {
         $member = auth()->user();
         $shop = Shop::findOrFail($shopId);
 
         if (!$member->favorite_shops()->where('shop_id', $shopId)->exists()) {
             $member->favorite_shops()->attach($shopId);
         }
 
         return redirect()->back()->with('flash_message', 'お気に入りに追加しました。');
     }
 
     //destroyアクション
     public function destroy($shopId)
     {
         $member = auth()->user();
         $shop = Shop::findOrFail($shopId);
 
         if ($member->favorite_shops()->where('shop_id', $shopId)->exists()) {
             $member->favorite_shops()->detach($shopId);
         }
 
         return redirect()->back()->with('flash_message', 'お気に入りを解除しました。');
     }
}
