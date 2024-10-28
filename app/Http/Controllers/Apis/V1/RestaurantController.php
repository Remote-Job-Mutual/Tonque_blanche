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
