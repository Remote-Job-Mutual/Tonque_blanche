<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();


        // Create a customer
        $user = User::factory()->create([
            'name' => 'Imran Ali',
            'email' => 'customer@example.com',
            'phone_number' => '1234567890',
            'password' => bcrypt('password'),
            'active' => 1,
        ]);

        $user->assignRole('customer');

    }
}
