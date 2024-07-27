<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop;
use App\Models\Review;
use Illuminate\Support\Facades\Auth;

class ReviewController extends Controller
{
     //indexアクション
     public function index(Shop $shop)
     {
         if (auth()->user()->subscribed('premium_plan')) {
             // 有料プランに登録済みの場合
             $reviews = $shop->reviews()->orderBy('created_at', 'desc')->paginate(5);
         } else {
             // 有料プランに未登録の場合
             $reviews = $shop->reviews()->orderBy('created_at', 'desc')->take(3)->get();
             $reviews = collect($reviews); // コレクションに変換
         }
     
     
         return view('reviews.index', compact('shop', 'reviews'));
     }
     
     //createアクション
     public function create(Shop $shop)
     {
         return view('reviews.create', compact('shop'));
     }
     
     //storeアクション
     public function store(Request $request, Shop $shop)
     {
         // バリデーション
         $request->validate([
             'score' => 'required|integer|between:1,5',
             'content' => 'required|string',
         ]);
     
         // レビューの作成
         Review::create([
             'content' => $request->content,
             'score' => $request->score,
             'shop_id' => $shop->id,
             'member_id' => auth()->id(),
         ]);
     
         // フラッシュメッセージを設定してリダイレクト
         return redirect()->route('shops.reviews.index', $shop)->with('flash_message', 'レビューを投稿しました。');
     }
     
     //editアクション
     public function edit(Shop $shop, Review $review)
     {
         // 他人のレビューを編集できないようにする
         if ($review->member_id !== auth()->id()) {
            return redirect()->route('shops.reviews.index', $shop)->with('error_message', '不正なアクセスです。');
        }
        
         return view('reviews.edit', compact('shop', 'review'));
     }
     
     //updateアクション
     public function update(Request $request, Shop $shop, Review $review)
     {
         // 他人のレビューを編集できないようにする
         if ($review->member_id !== auth()->id()) {
             return redirect()->route('shops.reviews.index', $shop)->with('error_message', '不正なアクセスです。');
         }
     
         // バリデーション
         $request->validate([
             'score' => 'required|integer|between:1,5',
             'content' => 'required|string',
         ]);
     
         // レビューの更新
         $review->update([
             'content' => $request->content,
             'score' => $request->score,
         ]);
     
         // フラッシュメッセージを設定してリダイレクト
         return redirect()->route('shops.reviews.index', $shop)->with('flash_message', 'レビューを編集しました。');
     }
     
     //destroyアクション
     public function destroy(shop $shop, Review $review)
     {
        // 他人のレビューを編集できないようにする
        if ($review->member_id !== Auth::id()) {
            return redirect()->route('shops.reviews.index', $shop)->with('error_message', '不正なアクセスです。');
        } else {
            $review->delete();

            return redirect()->route('shops.reviews.index', $shop)->with('flash_message', 'レビューを削除しました。');
        }
    }
}
