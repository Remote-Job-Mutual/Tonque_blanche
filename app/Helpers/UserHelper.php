<?php

namespace App\Helpers;

/**
 * Retrieve user coordinates from the request or authenticated user.
 *
 * @return array [latitude, longitude]
 */
class UserHelper
{
    public static function getUserCoordinates(): array
    {
        return [
            request()->input('lat') ?? auth()->user()->lat ?? null,
            request()->input('long') ?? auth()->user()->long ?? null,
        ];
    }

    public static function getUserRadius(): int
    {
        return request()->input('radius') ?? 6371;
    }

    public static function getUserPreferredDishTypes()
    {
        return auth()?->user()?->preferredDishesTypes()
            ->select('dish_types.id')
            ->pluck('id')
            ->toArray() ?? [];
    }

    public static function getUserPreferredCategories()
    {
        return auth()?->user()?->preferredCategories()
            ->select('categories.id')
            ->pluck('id')
            ->toArray() ?? [];
    }
}
