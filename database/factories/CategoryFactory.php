<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

class CategoryFactory extends Factory
{
    protected $model = Category::class;

    public function definition()
    {
        return [
            'name' => [
                'en' => $this->faker->word,
                'fr' => $this->faker->word,
                'es' => $this->faker->word,
            ],
            'description' => [
                'en' => $this->faker->sentence,
                'fr' => $this->faker->sentence,
                'es' => $this->faker->sentence,
            ],
        ];
    }
}
