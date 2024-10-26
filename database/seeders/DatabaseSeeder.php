<?php

namespace Database\Seeders;

use App\Models\Category;
use App\Models\User;
use Illuminate\Database\Seeder;
use Spatie\MediaLibrary\MediaCollections\Models\Media;
use Illuminate\Support\Facades\Storage;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {


        Media::all()->each(function ($media) {
            $media->delete(); // This will also delete the associated files from storage
        });

        // Optionally, you can clear specific directories in the storage
        Storage::disk('public')->deleteDirectory('media');
        //call DishTypeSeeder
        $this->call(DishTypeSeeder::class);
        $this->call(RestaurantSeeder::class);
        $this->call(ServiceSeeder::class);
        $this->call(TagSeeder::class);
        $this->call(CategorySeeder::class);
        $this->call(DishSeeder::class);


        User::truncate();

        // Create a customer
        $user = User::factory()->create([
            'name' => 'customer',
            'username' => 'customer',
            'email' => 'customer@example.com',
            'phone_number' => '1234567890',
            'password' => bcrypt('password'),
            'active' => 1,
        ]);

        // $user->assignRole('customer');

    }
}
