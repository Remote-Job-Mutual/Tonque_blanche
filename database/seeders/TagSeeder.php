<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Tag;

class TagSeeder extends Seeder
{
    public function run()
    {
        $tags = [
            ['en' => 'Halal', 'fr' => 'Halal', 'es' => 'Halal'],
            ['en' => 'Kosher', 'fr' => 'Casher', 'es' => 'Kosher'],
            ['en' => 'Vegan', 'fr' => 'Végétalien', 'es' => 'Vegano'],
            // Add more tags as needed
        ];

        Tag::truncate();
        foreach ($tags as $tag) {
            Tag::create(['name' => $tag]);
        }
    }
}
