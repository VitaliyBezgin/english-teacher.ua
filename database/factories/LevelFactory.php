<?php

namespace Database\Factories;

use App\Models\Level;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

class LevelFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Level::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::factory()->create(),
            'level' => rand(1,10),
            'points' => rand(0, 10000)
        ];
    }
}
