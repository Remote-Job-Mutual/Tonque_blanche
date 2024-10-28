<?php

namespace App\Http\Controllers\Apis\V1;

use App\Http\Controllers\Controller;
use App\Models\UserRestaurantInteraction;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Helpers\ResponseHelper;

class UserRestaurantInteractionController extends Controller
{
    /**
     * Store a new review for a restaurant.
     */
    public function store(Request $request, $restaurantId)
    {
        $validated = $request->validate([
            'service_rating' => 'required|integer|min:1|max:10',
            'cleaning_rating' => 'required|integer|min:1|max:10',
            'timing_rating' => 'required|integer|min:1|max:10',
            'environment_rating' => 'required|integer|min:1|max:10',
            'place_rating' => 'required|integer|min:1|max:10',
            'parking_rating' => 'required|integer|min:1|max:10',
            'categories' => 'nullable|array',
            'visited_at' => 'nullable|date',
            'comments' => 'nullable|string|max:1000',
            'images' => 'nullable|array',
            'images.*' => 'file|mimes:jpg,png,jpeg|max:2048',
        ]);

        $interaction = UserRestaurantInteraction::create([
            'user_id' => Auth::id(),
            'restaurant_id' => $restaurantId,
            'service_rating' => $validated['service_rating'],
            'cleaning_rating' => $validated['cleaning_rating'],
            'timing_rating' => $validated['timing_rating'],
            'environment_rating' => $validated['environment_rating'],
            'place_rating' => $validated['place_rating'],
            'parking_rating' => $validated['parking_rating'],
            'categories' => $validated['categories'] ?? [],
            'visited_at' => $validated['visited_at'] ?? now(),
            'comments' => $validated['comments'] ?? '',
        ]);

        if ($request->hasFile('images')) {
            foreach ($request->file('images') as $image) {
                $interaction->addMedia($image)->toMediaCollection('images');
            }
        }

        return ResponseHelper::success([
            'message' => 'Review posted successfully!',
            'interaction' => $interaction
        ], 201);
    }
}
