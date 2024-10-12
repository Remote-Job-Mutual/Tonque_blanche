<?php

namespace App\Http\Controllers\Apis\V1;

use App\Enum\DishTypePreference;
use Illuminate\Routing\Controller;
use App\Models\Category;
use App\Models\Restaurant;
use App\Models\Tag;
use App\Models\User;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;
use App\Models\DishType;
use Illuminate\Support\Facades\Auth;


class UserPreferenceController extends Controller
{

    // Fetch user preference options like categories, restaurants, and tags
    public function showPreferences()
    {
        try {
            $currentLocale = app()->getLocale();

            // Fetch categories with translations for current locale
            $categories = Category::all()->map(function ($category) use ($currentLocale) {
                return [
                    'id' => $category->id,
                    'name' => $category->getTranslation('name', $currentLocale),
                    'description' => $category->getTranslation('description', $currentLocale),
                    // Add other fields if necessary
                ];
            });

            $dishTypes = DishType::all()->map(function ($dishType) use ($currentLocale) {
                return [
                    'id' => $dishType->id,
                    'name' => $dishType->getTranslation('name', $currentLocale),
                    'preferences' => DishTypePreference::values(),
                ];
            });

            return ResponseHelper::success([
                'categories' => $categories,
                'dishTypes' => $dishTypes,
            ], 'Preferences fetched successfully.');
        } catch (\Exception $e) {
            return ResponseHelper::error('Failed to fetch preferences. ' . $e->getMessage(), 500);
        }
    }

    // Save user preferences
    public function savePreferences(Request $request)
    {
        try {
            $user = auth()->user();  // Get the authenticated user

            // Validate the incoming request
            $request->validate([
                'category_ids' => 'required|array',
                'category_ids.*' => 'exists:categories,id',  // Ensure categories exist

                'dish_ids' => 'required|array',
                'dish_ids.*' => 'in:love,like,neutral,dislike',  // Validate preferences
            ]);

            // Sync the user's selected categories
            $user->preferredCategories()->sync($request->category_ids);

            // Prepare the dish type preferences data
            $dishPreferences = [];
            foreach ($request->dish_ids as $dishTypeId => $preference) {
                $dishPreferences[$dishTypeId] = ['preference' => $preference];
            }

            // Sync the dish type preferences in the pivot table
            $user->preferredDishesTypes()->sync($dishPreferences);

            return ResponseHelper::success([], 'Preferences saved successfully.');
        } catch (\Exception $e) {
            return ResponseHelper::error('Failed to save preferences. ' . $e->getMessage(), 500);
        }
    }
}
