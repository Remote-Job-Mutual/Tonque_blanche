<?php

namespace App\Models;

use App\Helpers\UserLocationHelper;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Dish extends Model implements HasMedia
{
    use HasFactory, SoftDeletes, InteractsWithMedia, HasTranslations;

    protected $fillable = [
        'name',
        'description',
        'price',
        'is_offer',      // Indicates if the dish is on offer
        'restaurant_id',
        'category_id',
        'dish_type_id',  // New field for Dish Types
    ];

    public $translatable = ['name', 'description'];

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function dishType()
    {
        return $this->belongsTo(DishType::class);
    }

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function reviews()
    {
        return $this->hasMany(Review::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images')->multiple();
    }

    /**
     * Calculate the average rating from the dish's reviews.
     *
     * @return float
     */
    public function getAverageRatingAttribute()
    {
        return $this->reviews()->avg('rating') ?? 0;
    }

    /**
     * Check if the dish is new (created within the last month).
     *
     * @return bool
     */
    public function getIsNewAttribute()
    {
        return $this->created_at >= now()->subMonth();
    }

    /**
     * Determine if the dish is suggested based on user preferences.
     *
     * @param  array  $userDishTypePreferences
     * @param  array  $userCategoryPreferences
     * @return bool
     */
    public function isSuggested()
    {
        $userDishTypePreferences = auth()->user()->preferredDishesTypes()
            ->select('dish_types.id')
            ->pluck('id')
            ->toArray() ?? [];

        $userCategoryPreferences = auth()->user()->preferredCategories()
            ->select('categories.id')
            ->pluck('id')
            ->toArray() ?? [];


        return in_array($this->dish_type_id, $userDishTypePreferences) &&
            in_array($this->category_id, $userCategoryPreferences);
    }

    /**
     * Calculate the distance between the user and the restaurant.
     *
     * @param  float  $userLatitude
     * @param  float  $userLongitude
     * @return float|null
     */
    public function getDistanceAttribute()
    {
        $restaurant = $this->restaurant;

        if ($restaurant->latitude && $restaurant->longitude) {
            return $this->calculateDistance(
                $restaurant->latitude,
                $restaurant->longitude
            );
        }

        return null;
    }

    /**
     * Haversine formula to calculate the distance in kilometers.
     *
     * @return float
     */
    private function calculateDistance($lat2, $lon2)
    {
        $earthRadius = 6371;
        [$lat1, $lon1] = UserLocationHelper::getUserCoordinates();
        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
            sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));
        return $earthRadius * $c;
    }
}
