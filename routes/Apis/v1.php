<?php

namespace App\Http\Controllers\Apis\V1;


use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



/*
|--------------------------------------------------------------------------
| Agrigulture Version 1 API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/



Route::prefix('v1')->group(function () {
    Route::prefix('{locale}')->middleware('setLocaleForApi')->group(function () {


        //Authentication
        Route::prefix('/login')->group(function () {
            Route::post('email', [AuthenticationController::class, 'loginWithEmail'])->name('api.login.email');
            Route::post('phone', [AuthenticationController::class, 'loginWithPhone'])->name('api.login.phone');
        });

        // Grouped Forgot Password routes
        Route::prefix('forgot-password')->group(function () {
            Route::post('/email', [AuthenticationController::class, 'forgetPasswordWithEmail'])->name('api.forgot.password.email');
            Route::post('/phone', [AuthenticationController::class, 'forgetPasswordWithPhone'])->name('api.forgot.password.phone');
            Route::post('/verify', [AuthenticationController::class, 'verifyOtp'])->name('api.verify.otp');
        });

        // Route::post('login', [AuthenticationController::class, 'login'])->name('api.login');
        Route::post('/register', [AuthenticationController::class, 'register'])->name('api.register');

        //Now Apply Middleware for Authenticated User
        Route::middleware('auth:sanctum')->group(function () {
            //logout for all type auth
            Route::post('logout', [AuthenticationController::class, 'logout'])->name('api.logout');
            Route::prefix('customer')->group(function () {
                Route::prefix('preferences')->group(function () {
                    // Route to show available preferences
                    Route::get('/', [UserPreferenceController::class, 'showPreferences'])->name('api.preferences.show');
                    // Route to save user preferences
                    Route::post('/', [UserPreferenceController::class, 'savePreferences'])->name('api.preferences.save');
                });

                // Notification
                Route::prefix('notifications')->group(function () {
                    Route::get('/', [NotificationController::class, 'index'])->name('api.v1.customer.notifications.index');
                    Route::post('/mark-all-read', [NotificationController::class, 'markAllAsRead'])->name('api.v1.customer.notifications.markAllRead');
                    Route::post('/{id}/mark-read', [NotificationController::class, 'markAsRead'])->name('api.v1.customer.notifications.markAsRead');
                });


                // Personal info routes
                Route::prefix('profile')->group(function () {
                    Route::get('/', [AuthenticationController::class, 'profile'])->name('api.v1.customer.profile');
                    Route::post('update-password', [AuthenticationController::class, 'updatePassword'])->name('api.v1.customer.update-password');
                    Route::post('update', [AuthenticationController::class, 'update'])->name('api.v1.user.personal-info.update');
                });

                // Dish-related Routes
                Route::prefix('dishes')->group(function () {
                    Route::get('todays-suggestions', [DishController::class, 'todaysSuggestions'])->name('api.v1.customer.dishes.todays-suggestions');
                    Route::get('new-dishes', [DishController::class, 'newDishes'])->name('api.v1.customer.dishes.new-dishes');
                    Route::get('nearby-dishes', [DishController::class, 'nearbyDishes'])->name('api.v1.customer.dishes.nearby-dishes');
                    Route::get('rated-by-friends', [DishController::class, 'ratedByFriends'])->name('api.v1.customer.dishes.rated-by-friends');
                    Route::get('details/{dishId}', [DishController::class, 'details'])->name('api.v1.customer.dishes.details');
                });

                Route::prefix('restaurants')->group(function () {
                    // List all restaurants
                    Route::get('/', [RestaurantController::class, 'index'])->name('api.v1.restaurants.index');
                    // Post a review
                    Route::post('/{restaurantId}/review', [UserRestaurantInteractionController::class, 'store'])
                        ->name('api.v1.restaurants.review.store');

                    //Restaurant Details
                    Route::get('details/{restaurantId}', [RestaurantController::class, 'details'])
                        ->name('api.v1.restaurants.details');
                });



                Route::prefix('friends')->group(function () {
                    Route::get('/', [FriendController::class, 'friendList'])->name('api.v1.friends.list');
                    Route::get('/suggest', [FriendController::class, 'userList'])->name('api.v1.friends.suggest');
                    Route::get('/pending-list', [FriendController::class, 'pendingFriendList'])->name('api.v1.friends.pending-list');

                    Route::post('send-request', [FriendController::class, 'sendFriendRequest'])->name('api.v1.friends.send-request');
                    Route::post('accept-request', [FriendController::class, 'acceptFriendRequest'])->name('api.v1.friends.accept-request');
                    Route::post('unfriend', [FriendController::class, 'unfriendUser'])->name('api.v1.friends.unfriend');
                });

                Route::prefix('follow')->group(function () {
                    Route::get('/follower-list', [FriendController::class, 'followerList'])->name('api.v1.follow.follower-list');
                    Route::post('follow', [FriendController::class, 'followUser'])->name('api.v1.follow.follow-user');
                    Route::post('unfollow', [FriendController::class, 'unfollowUser'])->name('api.v1.follow.unfollow-user');
                });
            });
        });
    });
});
