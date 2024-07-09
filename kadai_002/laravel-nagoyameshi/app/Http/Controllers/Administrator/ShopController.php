<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop;                                                  //店舗管理機能（管理者側）追加の為

class ShopController extends Controller
{
    public function index(Request $request)
    {
        // 検索キーワードを取得
        $keyword = $request->input('keyword');

        /* キーワードから検索処理 */
        if ($keyword !== null) {
            $shops = Shop::where('name', 'LIKE', "%{$keyword}%")
                           >paginate(15);
            $total = $shops->total();                                // 取得したデータの総数
        } else {
            $shops = Shop::paginate(15);                             //ページネーション（15件ずつ表示）
            $total = $shops->total();                                // 取得したデータの総数
            $keyword = null;
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
        return view('admin.shops.edit', compact('shop'));
    }

    public function create()
    {
        return view('admin.shops.create', compact('categories', 'regular_holidays'));
    }

    public function store(Request $request)
    {
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

        $shop = new Shop($request->all());

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('shops', 'public');
            $shop->image = $path;
        }

        $shop->save();

        return redirect()->route('admin.shops.index')->with('flash_message', '店舗情報を登録しました。');
    }

    public function update(Request $request, shop $shop)
    {
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

        $shop->update($request->all());

        if ($request->hasFile('image')) {
            $path = $request->file('image')->store('shops', 'public');
            $shop->update(['image' => $path]);
        }

        return redirect()->route('admin.shops.index')->with('flash_message', '店舗を編集しました。');
    }

    public function destroy(shop $shop)
    {
        $shop->delete();
        return redirect()->route('admin.shops.index')->with('flash_message', '店舗を削除しました。');
    }


}
