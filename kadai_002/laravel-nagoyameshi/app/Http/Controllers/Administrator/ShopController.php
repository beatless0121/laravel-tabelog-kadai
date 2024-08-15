<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop;                                                  //店舗管理機能（管理者側）追加の為
use App\Models\Category;                                              //カテゴリ設定の為
use App\Models\RegularHoliday;                                       //定休日設定の為

class ShopController extends Controller
{
    public function index(Request $request)
    {
        // 検索キーワードを取得
        $keyword = $request->input('keyword');

        /* キーワードから検索処理 */
        if ($keyword !== null) {
            $shops = Shop::where('name', 'LIKE', "%{$keyword}%")
                           ->paginate(15);
            $total = $shops->total();                                // 取得したデータの総数
        } else {
            $shops = Shop::paginate(15);                             //ページネーション（15件ずつ表示）
            $total = $shops->total();                                // 取得したデータの総数
        }

        // ビューに渡す変数
        return view('admin.shops.index', compact('shops','total', 'keyword'));
    }

    public function show(Shop $shop)
    {
        return view('admin.shops.show', compact('shop'));
    }

    public function edit(Shop $shop)
    {
        //カテゴリ設定の為、修正
        $categories = Category::all();
        
        // 設定されたカテゴリのIDを配列化する
        $category_ids = $shop->categories->pluck('id')->toArray();

        //定休日設定の為、追加
        $regular_holidays = RegularHoliday::all();

        return view('admin.shops.edit', compact('shop','categories', 'category_ids','regular_holidays'));
    }

    public function create(Shop $shop)
    {
        //カテゴリ設定の為、修正
        $categories = Category::all();

        //定休日設定の為、追加
        $regular_holidays = RegularHoliday::all();

        return view('admin.shops.create', compact('shop','categories','regular_holidays'));
    }

    public function store(Request $request)
    {
        //バリデーションの設定
        $request->validate([
           'name' => 'required|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,bmp,gif,svg,webp|max:2048',
            'description' => 'required|string',
            'lowest_price' => 'required|integer|min:0|lte:highest_price',
            'highest_price' => 'required|integer|min:0|gte:lowest_price',
            'postal_code' => 'required|numeric|digits:7',
            'address' => 'required|string',
            'opening_time' => 'required|date_format:H:i|before:closing_time',
            'closing_time' => 'required|date_format:H:i|after:opening_time',
            'seating_capacity' => 'required|integer',
        ]);

         //$request内($request->all())にはShopテーブルとは無関係のパラメータが含まれている可能性があるので値を一つずつ代入
         $shop = new Shop();                                                       //登録する為
         $shop->name = $request->input('name');
         $shop->image = $request->input('image');
         $shop->description = $request->input('description');
         $shop->lowest_price = $request->input('lowest_price');
         $shop->highest_price = $request->input('highest_price');
         $shop->postal_code = $request->input('postal_code');
         $shop->address = $request->input('address');
         $shop->opening_time = $request->input('opening_time');
         $shop->closing_time = $request->input('closing_time');
         $shop->seating_capacity = $request->input('seating_capacity');

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('shops', 'public');
            $shop->image = $path;
        } else {
            $shop->image = "";
        }
        $shop->save();                 //データベースへ保存する       
        //カテゴリ設定の為、追加
        $category_ids = array_filter($request->input('category_ids') ?? []);
        $shop->categories()->sync($category_ids);
         //定休日設定の為、追加
         $regular_holiday_ids = array_filter($request->input('regular_holiday_ids') ?? []);
         $shop->regular_holidays()->sync($regular_holiday_ids);
 
        return redirect()->route('admin.shops.index')->with('flash_message', '店舗情報を登録しました。');
    }

    public function update(Request $request, Shop $shop)
    {
        //バリデーションの設定
        $request->validate([
            'name' => 'required|string',
            'image' => 'nullable|image|mimes:jpg,jpeg,png,bmp,gif,svg,webp|max:2048',
            'description' => 'required|string',
            'lowest_price' => 'required|integer|min:0|lte:highest_price',
            'highest_price' => 'required|integer|min:0|gte:lowest_price',
            'postal_code' => 'required|numeric|digits:7',
            'address' => 'required|string',
            'opening_time' => 'required|date_format:H:i|before:closing_time',
            'closing_time' => 'required|date_format:H:i|after:opening_time',
            'seating_capacity' => 'required|integer',
        ]);

        //$request内($request->all())にはShopテーブルとは無関係のパラメータが含まれている可能性があるので値を一つずつ代入
        $shop->name = $request->input('name');
        $shop->image = $request->input('image');
        $shop->description = $request->input('description');
        $shop->lowest_price = $request->input('lowest_price');
        $shop->highest_price = $request->input('highest_price');
        $shop->postal_code = $request->input('postal_code');
        $shop->address = $request->input('address');
        $shop->opening_time = $request->input('opening_time');
        $shop->closing_time = $request->input('closing_time');
        $shop->seating_capacity = $request->input('seating_capacity');

        if ($request->hasFile('image')) {
            $image_path = $request->file('image')->store('public/shops');
            $shop->image = basename($image_path);
        } else {
            $shop->image = basename('');
        }

        $shop->update();                                //データベースを更新する為

        //カテゴリ設定の為、追加
        $category_ids = array_filter($request->input('category_ids') ?? []);
        $shop->categories()->sync($category_ids);

        //定休日設定の為、追加      
        $regular_holiday_ids = array_filter($request->input('regular_holiday_ids') ?? []);
        $shop->regular_holidays()->sync($regular_holiday_ids);

        return redirect()->route('admin.shops.show',$shop)->with('flash_message', '店舗を編集しました。');
    }

    public function destroy(Shop $shop)                                             
    {
        $shop->delete();
        return redirect()->route('admin.shops.index')->with('flash_message', '店舗を削除しました。');
    }


}
