<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Review extends Model implements HasMedia
{
    use HasFactory, SoftDeletes, InteractsWithMedia;

    protected $fillable = [
        'user_id',
        'dish_id',
        'rating',            // Numeric rating by the user
        'price',             // Price paid for the dish
        'dish_size',         // Size of the dish (e.g., small, medium, large)
        'is_available',      // Whether the dish is always available
        'categories',        // Selected categories (JSON)
        'reviewed_at',       // Timestamp when the review was made
        'comments',          // User's comments
    ];

    protected $casts = [
        'categories' => 'array',
        'reviewed_at' => 'datetime',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function dish()
    {
        return $this->belongsTo(Dish::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images')->singleFile(); // For a single image per review
    }
}
