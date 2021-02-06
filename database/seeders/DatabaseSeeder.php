<?php

namespace Database\Seeders;

use App\Models\Level;
use App\Models\Theory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     *
     * @return void
     */
    public function run()
    {
        // \App\Models\User::factory(10)->create();
        Level::factory()->count(10)->create();
        Theory::factory()->count(10)->create();
    }
}
