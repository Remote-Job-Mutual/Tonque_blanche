<?php
namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Service;

class ServiceSeeder extends Seeder
{
    public function run()
    {
        $services = [
            [
                'en' => 'Kids Zone',
                'fr' => 'Zone pour enfants',
                'es' => 'Zona de niños'
            ],
            [
                'en' => 'Take Away',
                'fr' => 'À emporter',
                'es' => 'Para llevar'
            ],
            [
                'en' => 'Private Parking',
                'fr' => 'Parking privé',
                'es' => 'Estacionamiento privado'
            ],
            [
                'en' => 'Free WiFi',
                'fr' => 'WiFi gratuit',
                'es' => 'WiFi gratis'
            ]
        ];

        foreach ($services as $service) {
            Service::create([
                'name' => $service
            ]);
        }
    }
}
