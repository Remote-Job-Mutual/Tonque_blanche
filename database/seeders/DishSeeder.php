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
            'https://placehold.co/300x300?text=Dish+Image+1',
            'https://placehold.co/300x300?text=Dish+Image+2',
            'https://placehold.co/300x300?text=Dish+Image+3'
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
