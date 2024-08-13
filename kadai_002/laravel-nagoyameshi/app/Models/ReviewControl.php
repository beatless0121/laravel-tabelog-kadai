<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class ReviewControl extends Model
{
    use HasFactory;

    public function getReviewListById()
    {
        return DB::table('reviews');
    }
}
