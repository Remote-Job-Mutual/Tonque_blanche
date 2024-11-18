<?php

namespace App\Http\Controllers\Api\V1;

use App\Helpers\ResponseHelper;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

class NotificationController extends Controller
{
    // Fetch all notifications for the authenticated user
    public function index()
    {
        $notifications = Auth::user()->notifications()->orderBy('created_at', 'desc')->paginate(10);
        return ResponseHelper::success([
            'notifications' => $notifications,
        ]);
    }

    // Mark all notifications as read
    public function markAllAsRead()
    {
        Auth::user()->unreadNotifications->markAsRead();
        return ResponseHelper::success([], 'All notifications marked as read');
    }

    // Mark a single notification as read
    public function markAsRead($id)
    {
        $notification = Auth::user()->notifications()->findOrFail($id);
        $notification->markAsRead();
        return ResponseHelper::success([], 'Notification marked as read');
    }
}
