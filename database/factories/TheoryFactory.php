<?php

namespace Database\Factories;

use App\Models\Category;
use App\Models\Theory;
use Illuminate\Database\Eloquent\Factories\Factory;

class TheoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Theory::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'category_id' => Category::factory()->create(),
            'theory_title' => 'theory - >'.$this->faker->unique()->firstName,
            'header' => $this->faker->title,
            'theory_video' => json_encode($this->faker->url),
            'theory_body' => $this->faker->realText()
        ];
    }
}
