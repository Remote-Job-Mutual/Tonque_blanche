<?php

namespace App\Models;

use App\Helpers\GlobalHelper;
use App\Helpers\UserHelper;
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
        $this->addMediaCollection('images');
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
        return in_array($this->dish_type_id, UserHelper::getUserPreferredDishTypes()) &&
            in_array($this->category_id, UserHelper::getUserPreferredCategories());
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
        $restaurant = optional($this->restaurant); // Handle null safely
        $unit = GlobalHelper::getDistanceUnit();
        if ($restaurant->latitude && $restaurant->longitude) {
            // Calculate distance using latitude and longitude
            $distance = $this->calculateDistance(
                $restaurant->latitude,
                $restaurant->longitude
            );

            // Get the distance unit (either 'km' or 'miles')


            // Convert to miles if necessary
            if ($unit === 'miles') {
                $distance *= 0.621371; // Conversion factor: km to miles
            }

            // Return the distance rounded to 1 decimal point with the unit
            return round($distance, 1) . " " . $unit;
        }

        return  0 . " " . $unit; // Return null if coordinates are not available
    }

    /**
     * Haversine formula to calculate the distance using a custom radius.
     *
     * @param float $lat2 Latitude of the destination point.
     * @param float $lon2 Longitude of the destination point.
     * @return float Distance in the provided unit (based on custom radius).
     */
    private function calculateDistance($lat2, $lon2)
    {
        [$lat1, $lon1] = UserHelper::getUserCoordinates();

        // Get the custom radius (in kilometers or your preferred unit)
        $radius = UserHelper::getUserRadius();

        $dLat = deg2rad($lat2 - $lat1);
        $dLon = deg2rad($lon2 - $lon1);

        $a = sin($dLat / 2) * sin($dLat / 2) +
            cos(deg2rad($lat1)) * cos(deg2rad($lat2)) *
            sin($dLon / 2) * sin($dLon / 2);

        $c = 2 * atan2(sqrt($a), sqrt(1 - $a));

        // Calculate the distance using the custom radius
        return $radius * $c;
    }
}
