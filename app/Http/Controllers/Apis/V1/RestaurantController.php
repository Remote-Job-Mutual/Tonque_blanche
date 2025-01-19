<?php

namespace App\Http\Controllers\Apis\V1;

use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use App\Services\RestaurantService;
use App\Helpers\ResponseHelper;
use Illuminate\Http\Request;

class RestaurantController extends Controller
{
    protected $restaurantService;

    public function __construct(RestaurantService $restaurantService)
    {
        $this->restaurantService = $restaurantService;
    }


    // Show Details of a Restaurant
    public function details($locale, $restaurantId)
    {
        $restaurant = Restaurant::with('dishes', 'services', 'amenities')->find($restaurantId);
        if (!$restaurant) {
            return ResponseHelper::error('Restaurant not found');
        }
        return ResponseHelper::success([
            'restaurant' => $this->restaurantService->formatRestaurant($restaurant)
        ]);
    }
    /**
     * List all restaurants.
     */
    public function index(Request $request)
    {
        $restaurants = Restaurant::with('dishes', 'services', 'amenities')
            ->paginate(10);

        return ResponseHelper::success([
            'restaurants' => $this->restaurantService->formatRestaurants($restaurants)
        ]);
    }
}
