<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

class CategoryFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Category::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $type = ['for theory', 'for words'];

        return [
            'category_title' => $this->faker->unique()->jobTitle,
            'category_type' => $type[rand(0,1)]
        ];
    }
}
