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
                'en' => 'Arab',
                'fr' => 'Arabe',
                'es' => 'Árabe'
            ],
            [
                'en' => 'Thai',
                'fr' => 'Thaï',
                'es' => 'Tailandés'
            ],
            [
                'en' => 'Mexican',
                'fr' => 'Mexicain',
                'es' => 'Mexicano'
            ],
            // Add other dish types similarly
        ];

        DishType::truncate();

        foreach ($dishTypes as $type) {
            DishType::create(['name' => $type]);
        }
    }
}
