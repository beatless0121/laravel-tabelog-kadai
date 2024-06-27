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
        Schema::table('members', function (Blueprint $table) {
            $table->string('kana');                             //フリガナ
            $table->string('postal_code');                      //郵便番号
            $table->string('address');                          //住所
            $table->string('phone_number');                     //電話番号
            $table->date('birthday')->nullable();               //誕生日
            $table->string('occupation')->nullable();           //職業
            $table->integer('membership')->default('0');        //会員状態（0:無料会員、1:有料会員）
            $table->string('credit_name')->nullable();          //名前（アルファベット）（有料会員登録時更新）
            $table->string('credit_number',16)->nullable();       //クレジットカード番号（varcharカラム）（有料会員登録時更新）
            $table->string('expiration')->nullable();             //有効期限（月/年）（有料会員登録時更新）
            $table->string('security_code',3)->nullable();        //3桁のセキュリティコード（varcharカラム）（有料会員登録時更新）
             
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('members', function (Blueprint $table) {
            $table->dropColumn('kana');
            $table->dropColumn('postal_code');
            $table->dropColumn('address');
            $table->dropColumn('phone_number');
            $table->dropColumn('birthday');
            $table->dropColumn('occupation');
            $table->dropColumn('membership');  
            $table->dropColumn('credit_name');
            $table->dropColumn('credit_number'); 
            $table->dropColumn('expiration'); 
            $table->dropColumn('security_code'); 

        });   
    }
};
