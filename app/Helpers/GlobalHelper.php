<?php

namespace App\Helpers;

/**
 * Retrieve user coordinates from the request or authenticated user.
 *
 * @return array [latitude, longitude]
 */
class GlobalHelper
{

    public static function getDistanceUnit(): string
    {
        return env('DISTANCE_UNIT', 'km');
    }

    /**
     * Retrieve all image URLs for a dish.
     *
     * @param  \App\Models\Dish $dish
     * @return array
     */
    public static function getAllImageUrls($model, $collectionName = 'images')
    {
        return $model->getMedia($collectionName)->map(fn($media) => $media->getFullUrl())->toArray();
    }
}
