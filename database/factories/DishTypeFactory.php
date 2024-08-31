<?php

namespace Database\Factories;

use App\Models\DishType;
use Illuminate\Database\Eloquent\Factories\Factory;

class DishTypeFactory extends Factory
{
    protected $model = DishType::class;

    public function definition()
    {
        return [
            'name' => [
                'en' => $this->faker->word,  // Generate a random word for English name
                'fr' => $this->faker->word,  // Generate a random word for French name
                'es' => $this->faker->word,  // Generate a random word for Spanish name
            ],
        ];
    }
}
