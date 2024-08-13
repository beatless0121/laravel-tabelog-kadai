<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Shop; 
use App\Models\Member;
use App\Models\Review;
use App\Models\ReviewControl;
use Illuminate\Support\Facades\DB;

class ReviewControlController extends Controller
{
    public function index(Request $request)
    {
        //内部結合テーブルの取得
        $this->reviews = new ReviewControl();
        $reviewControls =$this->reviews->getReviewListById();

        // 検索キーワードを取得
        $keyword = $request->input('keyword');

        /* キーワードから検索処理 */
        if ($keyword !== null) {
            $reviewControls = $reviewControls->select('reviews.id','reviews.content','reviews.score','reviews.shop_id','reviews.member_id',DB::raw("case when reviews.release_flg = 0 then '公開' when reviews.release_flg = 1 then '非公開' else '' end as release_flg"),'reviews.created_at','reviews.updated_at','shops.id as shop_id','shops.name as shop_name','members.id as member_id','members.name as member_name','members.email as member_email')
                      ->join('shops', 'reviews.shop_id','=','shops.id')
                      ->join('members','reviews.member_id','=','members.id')
                      ->where('name', 'LIKE', "%{$keyword}%")
                      ->orWhere('email', 'LIKE', "%{$keyword}%")        //メールアドレスによる検索                   
                      ->paginate(15);
            $total = $reviewControls->count();            // 取得したデータの総数           
        } else {
            $reviewControls = $reviewControls->select('reviews.id','reviews.content','reviews.score','reviews.shop_id','reviews.member_id',DB::raw("case when reviews.release_flg = 0 then '公開' when reviews.release_flg = 1 then '非公開' else '' end as release_flg"),'reviews.created_at','reviews.updated_at','shops.id as shop_id','shops.name as shop_name','members.id as member_id','members.name as member_name','members.email as member_email')
                    ->join('shops', 'reviews.shop_id','=','shops.id')
                    ->join('members','reviews.member_id','=','members.id')
                     ->paginate(15);
            $total = $reviewControls->count();            // 取得したデータの総数 
        }

        // ビューに渡す変数
        return view('admin.reviewControl.index', compact('reviewControls','total', 'keyword'));
    }

    public function show($id)                           //idを取得
    {
        //内部結合テーブルの取得
        $this->reviews = new ReviewControl();
        $reviewControls =$this->reviews->getReviewListById();

        $reviewControls = $reviewControls->select('reviews.*','shops.id as shop_id','shops.name as shop_name','members.id as member_id','members.name as member_name','members.email as member_email')
                          ->join('shops', 'reviews.shop_id','=','shops.id')
                          ->join('members','reviews.member_id','=','members.id') 
                          ->where('reviews.id', '=', "{$id}")->first();                                          //レビューIDの絞り込み
  
        return view('admin.reviewControl.show', compact('reviewControls'));
    }

    //updateアクション(レビュー公開、非公開機能)
    public function update(Request $request, $id)
    {
        //idの取得
        $reviewRelease_flg = Review::find($id);
        //公開、非公開の判別($request->input(nputタグのid名)で画面よりボタン入力データ取得)
        if ($request->input('release_flg') === "1") {
            $reviewRelease_flg->update(['release_flg' => 1]);
        } else {
            $reviewRelease_flg->update(['release_flg' => 0]);
        }

         return redirect()->route('admin.reviewControl.index');
    }
}
