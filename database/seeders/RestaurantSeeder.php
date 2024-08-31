<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Restaurant;

class RestaurantSeeder extends Seeder
{
    public function run()
    {
        Restaurant::truncate();
        Restaurant::factory()->count(2)->create();
    }
}
