<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class UserDishPreference extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'user_id',
        'dish_type_id',
        'preference',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function dishType()
    {
        return $this->belongsTo(DishType::class);
    }
}
