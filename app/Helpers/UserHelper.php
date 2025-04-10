<?php

namespace App\Helpers;

/**
 * Retrieve user coordinates from the request or authenticated user.
 *
 * @return array [latitude, longitude]
 */
class UserHelper
{
    public static function getUserCoordinates(): array
    {
        return [
            request()->input('lat') ?? auth()->user()->lat ?? null,
            request()->input('long') ?? auth()->user()->long ?? null,
        ];
    }

    public static function getUserRadius(): int
    {
        return request()->input('radius') ?? 6371;
    }

    public static function getUserPreferredDishTypes()
    {
        return auth()?->user()?->preferredDishesTypes()
            ->select('dish_types.id')
            ->pluck('id')
            ->toArray() ?? [];
    }

    public static function getUserPreferredCategories()
    {
        return auth()?->user()?->preferredCategories()
            ->select('categories.id')
            ->pluck('id')
            ->toArray() ?? [];
    }

    public static function getUserProfile()
    {
        $user = auth()->user();
        if (!$user) {
            return null;
        }
        return [
            'id' => $user->id,
            'username' => $user->username,
            'email' => $user->email,
            'avatar' => $user?->getFirstMediaUrl('PROFILE_PICTURE') ?? '',
            'phone_number' => $user->phone_number,
            'date_of_birth' => $user->date_of_birth,
            'address' => $user->address,
            'phone_number' => $user->phone_number,
            'password' => '********', // Masked for security
            'creation_date' => $user->created_at->format('d-m-Y'),
            'friends' => $user->friends()->wherePivot('status', 'accepted')->count(),
            'followers' => $user->followers()->count(),
            'following' => $user->followings()->count(),
            'pending_friend_requests' => $user->pendingFriendRequests()->count(),
            'trust_percentage' => [
                'total' => 80,
                'tags' => [
                    'Overall' => 12,
                ]
            ],
            'points' => [
                'total_points' =>  30,
                'tags' => [
                    'Madrid' => 12,
                    'Overall' => 56,
                ]
            ]
            // $friends = $user->friends()->wherePivot('status', 'accepted')->count(),


        ];
    }
}
