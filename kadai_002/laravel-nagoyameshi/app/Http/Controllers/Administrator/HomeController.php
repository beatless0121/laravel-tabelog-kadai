<?php

namespace App\Http\Controllers\Administrator;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Member;
use App\Models\Shop;
use App\Models\Reservation;
use App\Models\Company;
use App\Models\Term;

class HomeController extends Controller
{
    public function index() 
    {
        $total_members = Member::count();
        $total_premium_members = DB::table('subscriptions')
            ->where('stripe_status', 'active')
            ->count();
        $total_free_members = $total_members - $total_premium_members;
        $total_shops = Shop::count();
        $total_reservations = Reservation::count();
        $sales_for_this_month = $total_premium_members * 300;

        return view('admin.home', compact(
            'total_members',
            'total_premium_members',
            'total_free_members',
            'total_shops',
            'total_reservations',
            'sales_for_this_month'
        ));
    }
}
