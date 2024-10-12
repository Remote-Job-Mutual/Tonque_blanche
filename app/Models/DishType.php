<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\Translatable\HasTranslations;

class DishType extends Model
{
    use HasFactory, SoftDeletes, HasTranslations;

    protected $fillable = ['name'];

    public $translatable = ['name'];

    public function userPreferences()
    {
        return $this->hasMany(User::class,'UserDishPreference::class');
    }
}
