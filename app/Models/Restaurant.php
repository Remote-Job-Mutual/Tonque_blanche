<?php

namespace App\Models;

use App\Helpers\GlobalHelper;
use App\Helpers\UserHelper;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Restaurant extends Model implements HasMedia
{
    use HasFactory, SoftDeletes, HasTranslations, InteractsWithMedia;

    protected $fillable = [
        'name',
        'location',  // JSON field for location data (address)
        'latitude',  // Latitude of the restaurant
        'longitude', // Longitude of the restaurant
        'distance',  // Distance can be dynamically calculated based on user location
    ];

    public $translatable = ['name'];
    public $casts = [
        'location' => 'array',
    ];

    //Define UserRestaurentInterest relationship
    public function interactions()
    {
        return $this->hasMany(UserRestaurantInteraction::class);
    }


    // Define the average rating attribute
    public function getAverageRatingAttribute()
    {
        return $this->interactions()
            ->selectRaw('
                AVG((service_rating + cleaning_rating + timing_rating + environment_rating + place_rating + parking_rating) / 6) as average_rating
            ')
            ->value('average_rating') ?? 0;
    }

    // Define the relationship with the dishes
    public function dishes()
    {
        return $this->hasMany(Dish::class);
    }

    public function services()
    {
        return $this->belongsToMany(Service::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images');
    }


    public function amenities()
    {
        return $this->belongsToMany(Amenity::class, 'amenity_restaurant');
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


        if ($this->latitude && $this->longitude) {
            // Calculate distance with the custom radius
            $distance = $this->calculateDistance(
                $this->latitude,
                $this->longitude
            );


            //  'km' or 'miles'
            $unit = GlobalHelper::getDistanceUnit();

            // Convert distance to miles if needed
            if ($unit === 'miles') {
                $distance *= 0.621371; // Conversion factor for km to miles
            }

            // Return the distance rounded to 1 decimal place, with the unit
            return round($distance, 1) . " " . $unit;
        }

        return null;
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
