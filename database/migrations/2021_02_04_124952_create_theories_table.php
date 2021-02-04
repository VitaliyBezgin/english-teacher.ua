<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

class CreateTheoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('theories', function (Blueprint $table) {
            $table->id()->unsigned();
            $table->foreignId('category_id')->constrained('categories')->onDelete('cascade');
            $table->string('theory_title', 150)->unique();
            $table->string('header', 150);
            $table->json('theory_video')->nullable();
            $table->text('theory_body');
            $table->timestamps();
        });
        // Full Text Index
        DB::statement('ALTER TABLE theories ADD FULLTEXT fulltext_index (header, theory_body)');
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('theories');
    }
}
