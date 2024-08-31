<?php

namespace App\Http\Controllers\Apis\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Dish;
use Illuminate\Support\Str;
use App\Helpers\ResponseHelper;
class DishController extends Controller
{
    public function home(Request $request)
    {
        $locale = app()->getLocale();

        // Today's Suggestions
        $todaysSuggestions = Dish::where('is_suggested', true)
            ->paginate(10, ['*'], 'todays_suggestions');

        // New Dishes
        $newDishes = Dish::where('created_at', '>=', now()->subMonth())
            ->paginate(10, ['*'], 'new_dishes');

        // Nearby
        $nearbyDishes = Dish::whereHas('restaurant', function ($query) use ($request) {
            // Assuming latitude and longitude are passed in request
            $latitude = $request->input('latitude');
            $longitude = $request->input('longitude');

            if ($latitude && $longitude) {
                $query->whereRaw(
                    "(6371 * acos(cos(radians(?)) * cos(radians(latitude)) * cos(radians(longitude) - radians(?)) + sin(radians(?)) * sin(radians(latitude)))) < 10",
                    [$latitude, $longitude, $latitude]
                );
            }
        })->paginate(10, ['*'], 'nearby_dishes');

        // Rated by Friends
        $ratedByFriends = Dish::whereHas('review', function ($query) {
            $query->whereHas('user', function ($query) {
                // $query->where('is_friend', true);
            });
        })->paginate(10, ['*'], 'rated_by_friends');


        return ResponseHelper::success([
            'todays_suggestions' => $this->formatDishes($todaysSuggestions, $locale),
            'new_dishes' => $this->formatDishes($newDishes, $locale),
            'nearby_dishes' => $this->formatDishes($nearbyDishes, $locale),
            'rated_by_friends' => $this->formatDishes($ratedByFriends, $locale),
        ]);
    }


    private function formatDishes($dishes, $locale)
    {
        return $dishes->map(function ($dish) use ($locale) {
            return [
                'name' => $dish->getTranslation('name', $locale),
                'slug' => Str::slug($dish->getTranslation('name', $locale)),
                'rating' => $dish->rating,
                'price' => $dish->price,
                'restaurant' => [
                    'name' => $dish->restaurant->getTranslation('name', $locale),
                    'slug' => Str::slug($dish->restaurant->getTranslation('name', $locale)),
                ],
                'image_url' => $dish->getFirstMediaUrl('images'), // Assuming Spatie Media Library
            ];
        })->toArray();
    }
}
