<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Administrator;
use App\Models\Member;                                                  //管理者側会員管理機能作成の為


class MemberController extends Controller
{
    public function index(Request $request)                            //一覧ページ
    {
        $keyword = $request->input('keyword');

        /* キーワードから検索処理 */
        if ($keyword !== null) {
            $members = Member::where('name', 'LIKE', "%{$keyword}%")
                          ->orWhere('kana', 'LIKE', "%{$keyword}%")
                          ->orWhere('email', 'LIKE', "%{$keyword}%")     //メールアドレスによる検索（要件定義書必須項目）
                          ->paginate(15);
            $total = $members->total();                                  // 取得したデータの総数
        } else {
            $members = Member::paginate(15);                             //ページネーション（15件ずつ表示）
            $total = $members->total();                                  // 取得したデータの総数
            $keyword = null;
        }

        return view('admin.members.index', compact('members', 'total', 'keyword'));
    }

    public function show(Member $member)                           //詳細ページ
    {
        return view('admin.members.show', compact('member'));
    }
}
