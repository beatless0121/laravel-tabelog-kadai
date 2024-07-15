<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Company;                                                             //会社概要設定の為

class CompanyController extends Controller
{
     /**
     * indexアクション
     * 会社概要ページ
     */

     public function index()
     {
         $company = Company::latest()->first();
 
         return view('admin.company.index', compact('company'));
     }
 
     /**
      * editアクション
      * 会社概要編集ページ
      */
     public function edit()
     {
         $company = Company::latest()->first();
 
         return view('admin.company.edit', compact('company'));
     }
 
     public function update(Request $request, Company $company) {

        //バリデーションの設定
         $request->validate([
             'name' => 'required',
             'postal_code' => 'required|integer|digits:7',
             'address' => 'required',
             'representative' => 'required',
             'establishment_date' => 'required',
             'capital' => 'required',
             'business' => 'required',
             'number_of_employees' => 'required',
         ]);
 
         //$request内($request->all())にはCompanyテーブルとは無関係のパラメータが含まれている可能性があるので値を一つずつ代入
         $company->name = $request->input('name');
         $company->postal_code = $request->input('postal_code');
         $company->address = $request->input('address');
         $company->representative = $request->input('representative');
         $company->establishment_date = $request->input('establishment_date');
         $company->capital = $request->input('capital');
         $company->business = $request->input('business');
         $company->number_of_employees = $request->input('number_of_employees');
         $company->update();
 
         return redirect()->route('admin.company.index', $company)->with('flash_message','会社概要を編集しました。');
        }
}
