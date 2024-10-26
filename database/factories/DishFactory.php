<?php

namespace Database\Factories;

use App\Models\Dish;
use App\Models\Restaurant;
use App\Models\Category;
use App\Models\DishType;
use Illuminate\Database\Eloquent\Factories\Factory;

class DishFactory extends Factory
{
    protected $model = Dish::class;

    public function definition()
    {
        // Create a Faker instance and add the Restaurant provider
        $faker = \Faker\Factory::create();
        $faker->addProvider(new \FakerRestaurant\Provider\en_US\Restaurant($faker));

        return [
            'name' => [
                'en' => $faker->foodName(), // Generate an English dish name
                'fr' => $faker->foodName(), // You can extend this to support translations
                'es' => $faker->foodName(),
            ],
            'description' => [
                'en' => $this->faker->sentence(), // Random description using standard Faker
                'fr' => $this->faker->sentence(),
                'es' => $this->faker->sentence(),
            ],
            'price' => $this->faker->randomFloat(2, 10, 50), // Price between 10 and 50
            'is_offer' => $this->faker->boolean(), // Randomly set offer status
            'restaurant_id' => Restaurant::factory(), // Random restaurant
            'category_id' => Category::factory(), // Random category
            'dish_type_id' => DishType::factory(), // Random dish type
        ];
    }
}
