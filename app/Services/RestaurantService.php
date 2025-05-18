<?php

namespace App\Services;

use App\Helpers\GlobalHelper;
use Illuminate\Support\Collection;
use App\Services\DishService;

class RestaurantService
{


    public function formatRestaurant($restaurant): array
    {
        $dishService = new DishService();

        return [
            'id'            => $restaurant->id,
            'name'          => $restaurant->name,
            'location'      => $this->parseLocation($restaurant->location),
            'distance'      => $restaurant->distance,
            'rating'        => round((float) $restaurant->average_rating, 1),
            'dishes_count'  => $restaurant->dishes->count(),
            'amenities'     => $restaurant->amenities->pluck('name')->toArray(),
            'image_urls'    => GlobalHelper::getAllImageUrls($restaurant),
            'dishes'        => $this->formatDishes($restaurant->dishes, $dishService),
        ];
    }

    /**
     * Parse JSON location data safely.
     */
    protected function parseLocation(?string $location): ?array
    {
        return $location ? json_decode($location, true) : null;
    }

    /**
     * Format the restaurant's dishes using the DishService.
     */
    protected function formatDishes(Collection $dishes, DishService $dishService): array
    {
        return $dishes->map(fn($dish) => $dishService->formatSingleDish($dish))->toArray();
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
