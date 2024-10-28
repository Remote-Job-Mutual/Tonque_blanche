<?php

namespace Database\Seeders;

use App\Models\Dish;
use DB;
use Illuminate\Database\Seeder;
use Spatie\MediaLibrary\MediaCollections\Models\Media;

class DishSeeder extends Seeder
{
    public function run()
    {
        // Clear existing data before seeding
        $this->clearDishesAndMedia();
        // Create 10 dishes and attach images to each one
        Dish::factory(10)->create()->each(function ($dish) {
            $this->attachImages($dish);
        });
    }

    /**
     * Attach images to the given dish using Spatie Media Library.
     *
     * @param  Dish  $dish
     * @return void
     */
    private function attachImages($dish)
    {


        $images = [
            'https://images.unsplash.com/photo-1517244683847-7456b63c5969?q=80&w=300&auto=format&fit=crop',
            'https://images.unsplash.com/photo-1464093515883-ec948246accb?q=80&w=300&auto=format&fit=crop',
            'https://images.unsplash.com/photo-1542528180-a1208c5169a5?q=80&w=300&auto=format&fit=crop'
        ];

        foreach ($images as $image) {
            $dish->addMediaFromUrl($image)->toMediaCollection('images');
        }
    }



    private function clearDishesAndMedia()
    {
        Dish::all()->each(function ($dish) {
            $dish->clearMediaCollection('images'); // Clears both files and records
        });


        // Disable foreign key constraints before truncating (important for MySQL/PostgreSQL)
        DB::statement('SET FOREIGN_KEY_CHECKS=0;');
        DB::table('dishes')->truncate();
        DB::statement('SET FOREIGN_KEY_CHECKS=1;');
    }
}
