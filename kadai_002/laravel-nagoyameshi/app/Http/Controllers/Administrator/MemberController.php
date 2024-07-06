<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Administrator;
use Illuminate\Support\Facades\DB;                                     //クエリビルダ追加の為

class MemberController extends Controller
{
    public function index(Request $request)                            //一覧ページ
    {
        $members=DB::table('members')->get();                          //クエリビルダ
        $keyword = $request->input('keyword');

        /* キーワードから検索処理 */
        if ($keyword !== null) {
            $members = Member::where('name', 'LIKE', "%{$keyword}%")
                          ->orWhere('kana', 'LIKE', "%{$keyword}%")
                          ->paginate(15);
            $total = $members->total();
        } else {
            $members = member::paginate(15);                             //ページネーション（15件ずつ表示）
            $total = "";
        }

        return view('admin.members.index', compact('members', 'total', 'keyword'));
    }

    public function show(Member $member)                           //詳細ページ
    {
        return view('admin.members.show', compact('members'));
    }
}
