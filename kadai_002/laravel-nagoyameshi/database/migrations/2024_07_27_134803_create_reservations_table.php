<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('reservations', function (Blueprint $table) {
            $table->id();
            $table->datetime('reserved_datetime');  // 予約日時
            $table->integer('number_of_people');  // 予約人数
            $table->foreignId('shop_id')->constrained()->cascadeOnDelete();  // 店舗のID
            $table->foreignId('member_id')->constrained()->cascadeOnDelete();  // 会員のID
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reservations');
    }
};
