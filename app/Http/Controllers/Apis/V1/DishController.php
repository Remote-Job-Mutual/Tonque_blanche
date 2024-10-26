<?php

namespace App\Http\Controllers\Apis\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Dish;
use App\Services\DishService;
use App\Helpers\ResponseHelper;

class DishController extends Controller
{
    protected $dishService;

    public function __construct(DishService $dishService)
    {
        $this->dishService = $dishService;
    }

    /**
     * Get suggested dishes based on the user's preferences.
     */
    public function todaysSuggestions(Request $request)
    {
        $user = $request->user();

        // Get user preferences
        $preferredDishTypes = $user->preferredDishesTypes()
            ->select('dish_types.id')
            ->pluck('id')
            ->toArray();
        $preferredCategories = $user->preferredCategories()
            ->select('categories.id')
            ->pluck('id')
            ->toArray();

        // Build the query for dishes
        $query = Dish::with('restaurant')
            ->when(!empty($preferredDishTypes), function ($q) use ($preferredDishTypes) {
                $q->whereIn('dish_type_id', $preferredDishTypes);
            })
            ->when(!empty($preferredCategories), function ($q) use ($preferredCategories) {
                $q->whereIn('category_id', $preferredCategories);
            });

        // Get paginated results
        $dishes = $query->paginate(10, ['*'], 'todays_suggestions');

        // If no dishes found, get random dishes instead
        if ($dishes->isEmpty()) {
            $dishes = Dish::with('restaurant')->inRandomOrder()->paginate(10, ['*'], 'todays_suggestions');
        }

        return ResponseHelper::success([
            'todays_suggestions' => $this->dishService->formatDishes($dishes)
        ]);
    }


    /**
     * Get new dishes created within the last month.
     */
    public function newDishes(Request $request)
    {
        $dishes = Dish::where('created_at', '>=', now()->subMonth())
            ->paginate(10, ['*'], 'new_dishes');

        return ResponseHelper::success([
            'new_dishes' => $this->dishService->formatDishes($dishes)
        ]);
    }

    /**
     * Get dishes from nearby restaurants based on user's location.
     */
    public function nearbyDishes(Request $request)
    {
        $user = $request->user();

        // Use request coordinates if available, otherwise fall back to user's stored coordinates.
        $latitude = $request->input('latitude', $user->latitude);
        $longitude = $request->input('longitude', $user->longitude);

        // Handle the case where both latitude and longitude are missing.
        if (is_null($latitude) || is_null($longitude)) {
            return ResponseHelper::success(['nearby_dishes' => []]);
        }

        // Query dishes with the distance filter applied.
        $dishes = Dish::whereHas('restaurant', function ($query) use ($latitude, $longitude) {
            $this->dishService->applyDistanceFilter($query, $latitude, $longitude);
        })->paginate(10, ['*'], 'nearby_dishes');

        return ResponseHelper::success([
            'nearby_dishes' => $this->dishService->formatDishes($dishes)
        ]);
    }

    /**
     * Get dishes rated by the user's friends.
     */
    public function ratedByFriends(Request $request)
    {
        $user = $request->user();

        $dishes = Dish::whereHas('reviews', function ($query) use ($user) {
            $query->whereHas('user', function ($query) use ($user) {
                // Adjust the logic to fit your friend system
                // $query->whereIn('id', function ($subQuery) use ($user) {
                //     $subQuery->select('friend_id')
                //         ->from('friends')
                //         ->where('user_id', $user->id);
                // });
            });
        })->paginate(10, ['*'], 'rated_by_friends');

        return ResponseHelper::success([
            'rated_by_friends' => $this->dishService->formatDishes($dishes)
        ]);
    }
}
