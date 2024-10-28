<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Amenity;

class AmenitySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run()
    {
        $amenities = ['Kids Zone', 'Free Parking', 'Television', 'Wi-Fi'];

        foreach ($amenities as $amenity) {
            Amenity::create(['name' => $amenity]);
        }
    }
}
