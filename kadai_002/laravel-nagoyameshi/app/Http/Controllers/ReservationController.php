<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Reservation;
use App\Models\Shop;
use Illuminate\Support\Facades\Auth;

class ReservationController extends Controller
{
   //index
   public function index()
   {
       $reservations = Auth::user()->reservations()
           ->orderBy('reserved_datetime', 'desc')
           ->paginate(15);

       return view('reservations.index', compact('reservations'));
   }

   //create
   public function create(Shop $shop)
   {
       return view('reservations.create', compact('shop'));
   }

   //store
   public function store(Request $request, Shop $shop)
   {
       // バリデーション
       $request->validate([
           'reservation_date' => 'required|date_format:Y-m-d',
           'reservation_time' => 'required|date_format:H:i',
           'number_of_people' => 'required|integer|min:1|max:50',
       ]);

       $reserved_datetime = $request->reservation_date . ' ' . $request->reservation_time;

       Reservation::create([
           'reserved_datetime' => $reserved_datetime,
           'number_of_people' => $request->number_of_people,
           'shop_id' => $shop->id,
           'member_id' => Auth::id(),
       ]);

       // フラッシュメッセージ
       return redirect()->route('reservations.index')->with('flash_message', '予約が完了しました。');
   }

   //destroy
   public function destroy(Reservation $reservation)
   {
    // 他人の予約を編集できないようにする
    if ($reservation->member_id !== Auth::id()) {
        return redirect()->route('reservations.index')->with('error_message', '不正なアクセスです。');
    }
       $reservation->delete();
       return redirect()->route('reservations.index')->with('flash_message', '予約を削除しました。');
   }
}
