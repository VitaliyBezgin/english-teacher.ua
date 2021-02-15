<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFightsInfoTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fights_info', function (Blueprint $table) {
            $table->id()->unsigned();
            $table->foreignId('fight_id')->constrained('fights')->onDelete('cascade');
            $table->unsignedInteger('correct_strike_answers');
            $table->unsignedInteger('correct_defender_answers');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('fights_info');
    }
}
