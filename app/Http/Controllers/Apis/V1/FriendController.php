<?php

namespace App\Http\Controllers\Apis\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use App\Helpers\ResponseHelper;

class FriendController extends Controller
{
    /**
     * Send a friend request to another user.
     */
    public function sendFriendRequest(Request $request)
    {
        $user = Auth::user();

        // Validate the request
        $validatedData = $request->validate([
            'friend_id' => ['required', 'integer', 'exists:users,id']
        ]);

        $friendId = $validatedData['friend_id'];

        // Check if the friend request already exists
        if ($user->friends()->where('friend_id', $friendId)->exists()) {
            return ResponseHelper::error('Friend request already sent or you are already friends.', 400);
        }

        // Attach the friend with a 'pending' status
        $user->friends()->attach($friendId, ['status' => 'pending']);

        return ResponseHelper::success([], 'Friend request sent successfully.');
    }

    /**
     * Accept a friend request.
     */
    public function acceptFriendRequest(Request $request)
    {
        $user = $request->user();

        // Validate the request
        $validatedData = $request->validate([
            'friend_id' => ['required', 'integer', 'exists:users,id']
        ]);

        $friendId = $validatedData['friend_id'];

        // Check if there is a pending friend request
        $friendRequest = $user->friends()->wherePivot('friend_id', $friendId)->wherePivot('status', 'pending')->first();

        if (!$friendRequest) {
            return ResponseHelper::error('No pending friend request found.', 400);
        }

        // Update the friend request status to 'accepted'
        $user->friends()->updateExistingPivot($friendId, ['status' => 'accepted']);

        // Ensure mutual friendship by attaching the user to the friend's list
        $validatedData['friend_id']->friends()->attach($user->id, ['status' => 'accepted']);

        return ResponseHelper::success([], 'Friend request accepted.');
    }
    /**
     * Follow a user.
     */
    public function followUser(Request $request)
    {
        $user = $request->user();

        // Validate the request
        $validatedData = $request->validate([
            'followed_user_id' => ['required', 'integer', 'exists:users,id']
        ]);

        $followedUserId = $validatedData['followed_user_id'];

        // Check if the user is already following the specified user
        if ($user->followers()->where('follower_id', $followedUserId)->exists()) {
            return ResponseHelper::error('Already following this user.', 400);
        }

        // Attach the user to the followers list
        $user->followers()->attach($followedUserId);

        return ResponseHelper::success([], 'User followed successfully.');
    }

    /**
     * Unfollow a user.
     */
    public function unfollowUser(Request $request)
    {
        $user = $request->user();

        // Validate the request
        $validatedData = $request->validate([
            'followed_user_id' => ['required', 'integer', 'exists:users,id']
        ]);

        $followedUserId = $validatedData['followed_user_id'];

        // Check if the user is following the specified user
        if (!$user->followers()->where('follower_id', $followedUserId)->exists()) {
            return ResponseHelper::error('You are not following this user.', 400);
        }

        // Detach the user from the followers list
        $user->followers()->detach($followedUserId);

        return ResponseHelper::success([], 'User unfollowed successfully.');
    }

    /**
     * Unfriend a user.
     */
    public function unfriendUser(Request $request)
    {
        $user = $request->user();

        // Validate the request
        $validatedData = $request->validate([
            'friend_id' => ['required', 'integer', 'exists:users,id']
        ]);

        $friendId = $validatedData['friend_id'];
        $friend = User::find($friendId);

        // Check if the user is friends with the specified user
        if (!$user->friends()->wherePivot('friend_id', $friendId)->wherePivot('status', 'accepted')->exists()) {
            return ResponseHelper::error('You are not friends with this user.', 400);
        }

        // Detach the friendship relationship for both users
        $user->friends()->detach($friendId);
        $friend->friends()->detach($user->id);

        return ResponseHelper::success([], 'User unfriended successfully.');
    }
}
