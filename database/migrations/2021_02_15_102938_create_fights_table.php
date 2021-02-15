<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFightsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('fights', function (Blueprint $table) {
            $table->id()->unsigned();
            $table->foreignId('striker_id')->constrained('users', 'id')->onDelete('cascade');
            $table->foreignId('defender_id')->constrained('users', 'id')->onDelete('cascade');
            $table->foreignId('words_id')->constrained('words')->onDelete('cascade');
            $table->string('status', 100)->default('started');
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
        Schema::dropIfExists('fights');
    }
}
