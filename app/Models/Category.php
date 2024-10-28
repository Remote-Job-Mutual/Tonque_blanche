<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Category extends Model implements HasMedia
{
    use HasFactory, HasTranslations, SoftDeletes, InteractsWithMedia;

    protected $fillable = [
        'name',
        'description',
    ];

    public $translatable = ['name', 'description'];

    public function products()
    {
        return $this->hasMany(Dish::class);
    }

    public function users()
    {
        return $this->belongsToMany(User::class, 'preference_category_user');
    }

    public function registerMediaCollections(): void
    {
        $this->addMediaCollection('images');
    }
}
