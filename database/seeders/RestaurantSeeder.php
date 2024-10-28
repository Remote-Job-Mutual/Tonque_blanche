<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Restaurant;
use App\Models\Amenity;

class RestaurantSeeder extends Seeder
{
    public function run()
    {
        // Truncate existing records to start fresh
        Restaurant::truncate();

        // Seed some amenities
        $this->seedAmenities();

        // Get all available amenities
        $amenities = Amenity::all();

        // Create restaurants with factory and assign random amenities
        Restaurant::factory()
            ->count(2)
            ->create()
            ->each(function ($restaurant) use ($amenities) {
                // Attach random amenities to each restaurant
                $restaurant->amenities()->sync(
                    $amenities->random(rand(2, 4))->pluck('id')->toArray()
                );
            });
    }

    /**
     * Seed amenities if they don't already exist.
     */
    private function seedAmenities()
    {
        $amenities = ['Kids Zone', 'Free Parking', 'Television', 'Wi-Fi'];

        foreach ($amenities as $amenity) {
            Amenity::firstOrCreate(['name' => $amenity]);
        }
    }
}
