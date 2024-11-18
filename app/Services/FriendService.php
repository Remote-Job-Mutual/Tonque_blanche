<?php

namespace App\Services;

use App\Models\User;

class FriendService
{
    /**
     * Map the data to show or hide for a single friend based on privacy settings.
     */
    public function mapFriendDetails(User $currentUser, User $friend)
    {
        $isFriend = $currentUser->friends()->where('friend_id', $friend->id)->wherePivot('status', 'accepted')->exists();
        $canViewFavorites = $friend->privacySettings->show_favorites_to_followers || $isFriend;
        $canViewRatings = $friend->privacySettings->show_ratings_to_followers || $isFriend;

        return [
            'id' => $friend->id,
            'name' => $friend->name,
            'username' => $friend->username,
            'profile_picture' => $friend->profile_picture ?? null, // Include other relevant user data
            'can_view_favorites' => $canViewFavorites,
            'can_view_ratings' => $canViewRatings,
            'favorites' => $canViewFavorites ? $friend->favoriteDishes : null,
            'ratings' => $canViewRatings ? $friend->ratedDishes : null,
        ];
    }

    /**
     * Map the data for a list of users (e.g., friends).
     */
    public function mapUserList($users)
    {
        return $users->map(function ($user) {
            return [
                'id' => $user->id,
                'name' => $user->name,
                'username' => $user->username,
                'email' => $user->email,
                'profile_picture' => $user->profile_picture ?? null,
            ];
        });
    }

    /**
     * Map the data to show or hide for a list of friends.
     */
    public function mapFriendList(User $currentUser, $friends)
    {
        return $friends->map(function ($friend) use ($currentUser) {
            return $this->mapFriendDetails($currentUser, $friend);
        });
    }

    /**
     * Map the data to show or hide for a list of followers.
     */
    public function mapFollowerList(User $currentUser, $followers)
    {
        return $followers->map(function ($follower) use ($currentUser) {
            return $this->mapFriendDetails($currentUser, $follower);
        });
    }

    /**
     * Map data for a list of pending friend requests.
     */
    public function mapPendingFriendList(User $currentUser, $pendingFriends)
    {
        return $pendingFriends->map(function ($friend) use ($currentUser) {
            return [
                'id' => $friend->id,
                'name' => $friend->name,
                'username' => $friend->username,
                'requested_at' => $friend->pivot->created_at, // Date when the request was made
            ];
        });
    }
}
