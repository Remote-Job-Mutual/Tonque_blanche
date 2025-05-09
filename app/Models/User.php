<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\SoftDeletes;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class User extends Authenticatable implements HasMedia
{
    use HasFactory, Notifiable, SoftDeletes, HasRoles, HasApiTokens, InteractsWithMedia;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'username',
        'email',
        'password',
        'phone_number',
        'restaurant_id',
        'active',
        'address',
        'lat',
        'long',
        'radius',
        'sms_code',
        'sms_code_expired_at',
        'email_code',
        'email_code_expired_at',
        'date_of_birth'
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
        'email_verified_at',
        'updated_at',
        'deleted_at',
    ];

    /**
     * Get the attributes that should be cast.
     *
     * @return array<string, string>
     */
    protected function casts(): array
    {
        return [
            'email_verified_at' => 'datetime',
            'password' => 'hashed',
        ];
    }



    /**
     * Relationship: User's preferred categories.
     */
    public function preferredCategories()
    {
        return $this->belongsToMany(Category::class, 'user_category_preferences');
    }

    /**
     * Relationship: User's preferred dishes.
     */
    public function preferredDishesTypes()
    {
        return $this->belongsToMany(DishType::class, 'user_dish_type_preferences')
            ->withPivot('preference') // Include the preference column
            ->withTimestamps()
            ->withTrashed();
    }




    /**
     * Relationship: User's preferred tags.
     */
    public function preferredTags()
    {
        return $this->belongsToMany(Tag::class, 'user_tag_preferences');
    }


    // Relationships for friends and followers
    public function friends()
    {
        return $this->belongsToMany(User::class, 'friends', 'user_id', 'friend_id')
            ->withPivot('status') // status can be 'accepted', 'pending', etc.
            ->withTimestamps();
    }

    public function pendingFriendRequests()
    {
        return $this->belongsToMany(User::class, 'friends', 'friend_id', 'user_id')
            ->wherePivot('status', 'pending')
            ->withTimestamps();
            
    }

    public function followers()
    {
        return $this->belongsToMany(User::class, 'followers', 'follower_id', 'user_id')
            ->withTimestamps();
    }

    public function followings()
    {

        return $this->belongsToMany(User::class, 'followers', 'user_id', 'follower_id')
            ->withTimestamps();
    }
}
