<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\DishType;

class DishTypeSeeder extends Seeder
{
    public function run()
    {
        $dishTypes = [
            [
                'name' => ['en' => 'Arab', 'fr' => 'Arabe', 'es' => 'Árabe']
            ],
            [
                'name' => ['en' => 'Thai', 'fr' => 'Thaï', 'es' => 'Tailandés']
            ],
            [
                'name' => ['en' => 'Mexican', 'fr' => 'Mexicain', 'es' => 'Mexicano']
            ],
            [
                'name' => ['en' => 'Peruvian', 'fr' => 'Péruvien', 'es' => 'Peruano']
            ],
            [
                'name' => ['en' => 'Turkish', 'fr' => 'Turc', 'es' => 'Turco']
            ],
            [
                'name' => ['en' => 'Mediterranean', 'fr' => 'Méditerranéen', 'es' => 'Mediterráneo']
            ],
            [
                'name' => ['en' => 'Poke', 'fr' => 'Poke', 'es' => 'Poke']
            ],
            [
                'name' => ['en' => 'Indian', 'fr' => 'Indien', 'es' => 'Indio']
            ],
            [
                'name' => ['en' => 'Italian', 'fr' => 'Italien', 'es' => 'Italiano']
            ],
            [
                'name' => ['en' => 'Japanese', 'fr' => 'Japonais', 'es' => 'Japonés']
            ],
            [
                'name' => ['en' => 'Asian', 'fr' => 'Asiatique', 'es' => 'Asiático']
            ],
        ];

        // Clear existing data before seeding
        DishType::truncate();

        foreach ($dishTypes as $type) {
            DishType::create($type);
        }
    }
}
