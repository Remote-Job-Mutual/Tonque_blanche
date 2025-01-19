<?php

namespace App\Services;

use App\Helpers\GlobalHelper;

class RestaurantService
{


    public function formatRestaurant($restaurant)
    {
        return [
            'id' => $restaurant->id,
            'name' => $restaurant->name,
            'location' => json_decode($restaurant->location),
            'distance' => $restaurant->distance,
            'rating' => round($restaurant->average_rating, 1),
            'dishes_count' => $restaurant->dishes->count(),
            'amenities' => $restaurant->amenities->pluck('name'),
            'image_urls' => GlobalHelper::getAllImageUrls($restaurant),
        ];
    }
    /**
     * Format restaurants for API response.
     */
    public function formatRestaurants($restaurants)
    {
        return $restaurants->map(function ($restaurant) {
            return [
                'id' => $restaurant->id,
                'name' => $restaurant->name,
                'location' => json_decode($restaurant->location),
                'distance' => $restaurant->distance,
                'rating' =>  round($restaurant->average_rating, 1),
                'dishes_count' => $restaurant->dishes->count(),
                'amenities' => $restaurant->amenities->pluck('name'),
                'image_urls' => GlobalHelper::getAllImageUrls($restaurant),
            ];
        });
    }
}
