<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Member;
use Illuminate\Support\Facades\Auth;
use Illuminate\Validation\Rule;

class MemberController extends Controller
{
     /**
     * 会員情報ページを表示
     *
     * @return \Illuminate\View\View
     */
    public function index()
    {
        // 現在ログイン中のユーザー情報を取得
        $member = Auth::user();

        // ビューにデータを渡す
        return view('member.index', compact('member'));
    }

    public function edit(Member $member)
    {
        // 他人の会員情報を編集できない
        if ($member->id !== Auth::id()) {
            return redirect()->route('member.index')->with('error_message', '不正なアクセスです。');
        }

        // ビューにデータを渡す
        return view('member.edit', compact('member'));
    }


    public function update(Request $request, Member $member)
    {
         // 他人の会員情報を更新できないようにする
            if ($member->id !== Auth::id()) {
            return redirect()->route('member.index')->with('error_message', '不正なアクセスです。');
            }
    
            // バリデーション
            $validated = $request->validate([
                'name' => 'required|string|max:255',
                'kana' => ['required', 'string', 'max:255', 'regex:/\A[ァ-ヴー\s]+\z/u'],
                'email' => ['required', 'string', 'email', 'max:255', Rule::unique('members')->ignore($member->id)],
                'postal_code' => 'required|digits:7',
                'address' => 'required|string|max:255',
                'phone_number' => 'required|digits_between:10,11',
                'birthday' => 'nullable|digits:8',
                'occupation' => 'nullable|string|max:255',
            ]);
    
            // 会員情報を更新
            $member->update($validated);
            // フラッシュメッセージをセッションに保存
        return redirect()->route('member.index')->with('flash_message', '会員情報を編集しました。');
    }
}
