<?php

namespace Database\Factories;

use App\Models\Service;
use Illuminate\Database\Eloquent\Factories\Factory;

class ServiceFactory extends Factory
{
    protected $model = Service::class;

    public function definition()
    {
        return [
            'name' => [
                'en' => $this->faker->words(2, true),  // Generate a random phrase for English name
                'fr' => $this->faker->words(2, true),  // Generate a random phrase for French name
                'es' => $this->faker->words(2, true),  // Generate a random phrase for Spanish name
            ],
        ];
    }
}
