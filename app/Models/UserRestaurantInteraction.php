<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class UserRestaurantInteraction extends Model implements HasMedia
{
    use HasFactory, SoftDeletes, InteractsWithMedia;

    protected $fillable = [
        'user_id',
        'restaurant_id',
        'service_rating',      // Rating for service
        'cleaning_rating',     // Rating for cleaning
        'timing_rating',       // Rating for timing
        'environment_rating',  // Rating for environment
        'place_rating',        // Rating for the place itself
        'parking_rating',      // Rating for parking
        'categories',          // Selected categories (e.g., free parking, kids zone)
        'visited_at',          // Date of the visit
        'comments',            // User's comments
    ];

    protected $casts = [
        'categories' => 'array',
        'visited_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function restaurant()
    {
        return $this->belongsTo(Restaurant::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images')->useDisk('public')->multiple(); // Allow multiple images per review
    }
}
