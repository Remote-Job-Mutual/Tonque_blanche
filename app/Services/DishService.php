<?php

namespace App\Services;

use App\Helpers\GlobalHelper;
use App\Helpers\UserHelper;

class DishService
{


    /**
     * Apply the Haversine distance filter to the query.
     *
     * @param  \Illuminate\Database\Eloquent\Builder  $query
     * @param  float  $latitude
     * @param  float  $longitude
     * @param  float  $radius  Radius in kilometers (default: 10km)
     * @return void
     */
    public function applyDistanceFilter($query, $latitude, $longitude, $radius = 10)
    {
        $query->whereRaw(
            "(6371 * acos(cos(radians(?)) * cos(radians(latitude)) *
            cos(radians(longitude) - radians(?)) + sin(radians(?)) *
            sin(radians(latitude)))) < ?",
            [$latitude, $longitude, $latitude, $radius]
        );
    }

    /**
     * Format a collection of dishes.
     *
     * @param  \Illuminate\Support\Collection $dishes
     * @return array
     */
    public function formatDishes($dishes)
    {
        return $dishes->map(fn($dish) => $this->formatSingleDish($dish))->toArray();
    }

    /**
     * Format a single dish.
     *
     * @param  \App\Models\Dish $dish
     * @return array
     */
    public function formatSingleDish($dish)
    {
        return [
            'name' => $dish->getTranslation('name', app()->getLocale()),
            'slug' => \Str::slug($dish->getTranslation('name', app()->getLocale())),
            'price' => $dish->price,
            'rating' => $dish->reviews()->avg('rating') ?? 0,
            'is_new' => $dish->created_at >= now()->subMonth(),
            'is_suggested' => $dish->isSuggested(),
            'distance' => $dish->distance,
            'restaurant' => [
                'name' => optional($dish->restaurant)->getTranslation('name', app()->getLocale()) ?? '',
                'slug' => \Str::slug(optional($dish->restaurant)->getTranslation('name', app()->getLocale())) ?? '',
            ],
            'image_urls' => GlobalHelper::getAllImageUrls($dish),
        ];
    }



    /**
     * Calculate the distance between two geographic points using the Haversine formula.
     *
     * @param  float|null  $lat1  User's latitude
     * @param  float|null  $lon1  User's longitude
     * @param  float|null  $lat2  Restaurant's latitude
     * @param  float|null  $lon2  Restaurant's longitude
     * @return float|null  Distance in kilometers or null if coordinates are missing
     */
    private function calculateDistance($lat2, $lon2)
    {

        [$lat1, $lon1] = UserHelper::getUserCoordinates();

        if (is_null($lat1) || is_null($lon1) || is_null($lat2) || is_null($lon2)) {
            return 0; // Return null if any coordinate is missing
        }

        $earthRadius = 6371; // Earth's radius in kilometers

        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
            sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        return round($earthRadius * $c, 2); // Distance in kilometers, rounded to 2 decimal places
    }
}
