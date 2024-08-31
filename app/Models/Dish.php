<?php

namespace App\Models;

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
        'rating',
        'distance',
        'is_suggested',  // New field for Today's Suggestions
        'is_new',        // New field for New Dishes
        'is_offer',      // New field for Offers
        'restaurant_id',
        'category_id',
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

    public function tags()
    {
        return $this->belongsToMany(Tag::class);
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images')->multiple();
    }

    public function review()
    {
        return $this->hasMany(Review::class);
    }

    // In Restaurant.php
    public function dishes()
    {
        return $this->hasMany(Dish::class);
    }
}
