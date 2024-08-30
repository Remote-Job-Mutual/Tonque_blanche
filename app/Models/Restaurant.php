<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class Restaurant extends Model
{
    use HasFactory, SoftDeletes, HasTranslations;

    protected $fillable = [
        'name',
        'location',  // JSON field for location data (address)
        'latitude',  // Latitude of the restaurant
        'longitude', // Longitude of the restaurant
        'distance',  // Distance can be dynamically calculated based on user location
        'restaurant_rating',
    ];

    public $translatable = ['name', 'location'];

    public function dishes()
    {
        return $this->hasMany(Dish::class);
    }

    public function services()
    {
        return $this->belongsToMany(Service::class);
    }
}
