<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Member;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;


class SubscriptionController extends Controller
{
     //createアクション

     public function create()
     {
         $intent = Auth::user()->createSetupIntent();
 
         return view('subscription.create', [
             'intent' => $intent,
         ]);
     }
 
     //storeアクション
     //APPID:price_1PeSSXLjZq1DMeKQW2RciScN
 
     public function store(Request $request)
     {
        $request->user()->newSubscription('premium_plan', 'price_1PeSSXLjZq1DMeKQW2RciScN')->create($request->paymentMethodId);
 
        return redirect()->route('home')->with('flash_message', '有料プランへの登録が完了しました。');
     }
 
     //editアクション
     public function edit()
     {
         $member = Auth::user();
         $intent = $member->createSetupIntent();
 
         return view('subscription.edit', [
             'member' => $member,
             'intent' => $intent,
         ]);
 }
     //updateアクション
      public function update(Request $request)
     {
         $member = $request->user();
         $paymentMethodId = $request->input('paymentMethodId');
 
         $member->updateDefaultPaymentMethod($paymentMethodId);
 
         return redirect()->route('home')->with('flash_message', 'お支払い方法を変更しました。');
     }
 
     //cancelアクション
     public function cancel()
     {
         return view('subscription.cancel');
     }
 
     //destroyアクション
     public function destroy(Request $request)
     {
         $member = $request->user();
 
         if ($member->subscription('premium_plan')->canceled()) {
             return redirect()->route('home')->with('flash_message', '既に有料プランを解約しています。');
         }
 
         $member->subscription('premium_plan')->cancelNow();
 
         return redirect()->route('home')->with('flash_message', '有料プランを解約しました。');
     }
}
