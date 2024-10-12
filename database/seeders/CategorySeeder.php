<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Category;

class CategorySeeder extends Seeder
{
    public function run()
    {
        $categories = [
            [
                'name' => ['en' => 'Country', 'fr' => 'Pays', 'es' => 'País'],
                'description' => [
                    'en' => 'Select your country to receive dishes from your region.',
                    'fr' => 'Sélectionnez votre pays pour recevoir des plats de votre région.',
                    'es' => 'Seleccione su país para recibir platos de su región.'
                ]
            ],
            [
                'name' => ['en' => 'Ingredients', 'fr' => 'Ingrédients', 'es' => 'Ingredientes'],
                'description' => [
                    'en' => 'Choose the ingredients you prefer in your dishes.',
                    'fr' => 'Choisissez les ingrédients que vous préférez dans vos plats.',
                    'es' => 'Elija los ingredientes que prefiere en sus platos.'
                ]
            ],
            [
                'name' => ['en' => 'Drinks', 'fr' => 'Boissons', 'es' => 'Bebidas'],
                'description' => [
                    'en' => 'Select your preferred drinks.',
                    'fr' => 'Sélectionnez vos boissons préférées.',
                    'es' => 'Seleccione sus bebidas preferidas.'
                ]
            ],
            [
                'name' => ['en' => 'Dessert', 'fr' => 'Dessert', 'es' => 'Postre'],
                'description' => [
                    'en' => 'Choose your favorite type of dessert.',
                    'fr' => 'Choisissez votre type de dessert préféré.',
                    'es' => 'Elija su tipo de postre favorito.'
                ]
            ],
            [
                'name' => ['en' => 'Suggestions', 'fr' => 'Suggestions', 'es' => 'Sugerencias'],
                'description' => [
                    'en' => 'Receive dish suggestions based on your preferences.',
                    'fr' => 'Recevez des suggestions de plats basées sur vos préférences.',
                    'es' => 'Reciba sugerencias de platos basadas en sus preferencias.'
                ]
            ],
        ];

        // Truncate the table before seeding
        Category::truncate();

        foreach ($categories as $category) {
            Category::create($category);
        }
    }
}
