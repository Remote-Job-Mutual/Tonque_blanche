<?php

namespace App\Helpers;

/**
 * Retrieve user coordinates from the request or authenticated user.
 *
 * @return array [latitude, longitude]
 */
class UserLocationHelper
{
    public static function getUserCoordinates(): array
    {
        return [
            request()->input('latitude') ?? auth()->user()->latitude ?? null,
            request()->input('longitude') ?? auth()->user()->longitude ?? null,
        ];
    }
}
