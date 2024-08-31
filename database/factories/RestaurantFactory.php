<?php

namespace Database\Factories;

use App\Models\Restaurant;
use Illuminate\Database\Eloquent\Factories\Factory;
use Faker\Generator as Faker;
use Illuminate\Support\Str;

class RestaurantFactory extends Factory
{
    protected $model = Restaurant::class;

    public function definition()
    {
        $faker = $this->faker;

        return [
            'name' => [
                'en' => $faker->company,
                'es' => $faker->company,
            ],
            'location' => json_encode([
                'address' => $faker->address,
                'city' => $faker->city,
                'country' => $faker->country,
            ]),
            'latitude' => $faker->latitude,
            'longitude' => $faker->longitude,
            'restaurant_rating' => $faker->numberBetween(3, 2),
        ];
    }

    public function configure()
    {
        return $this->afterCreating(function (Restaurant $restaurant) {
            $imageUrls = [
                'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4', // Random restaurant images from Unsplash
                'https://images.unsplash.com/photo-1522336572468-97b06e8ef143',
                'https://images.unsplash.com/photo-1508006728353-6ecef00dcbb8',
                'https://images.unsplash.com/photo-1521017432531-fbd92d768814',
            ];

            $restaurant->addMediaFromUrl($this->faker->randomElement($imageUrls))->toMediaCollection('images');
        });
    }
}
