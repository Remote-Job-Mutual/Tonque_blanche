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

                // Customer Profile Routes
                Route::get('profile', [AuthenticationController::class, 'profile'])->name('api.v1.customer.profile');
                Route::post('update-password', [AuthenticationController::class, 'updatePassword'])->name('api.v1.customer.update-password');


                // Dish-related Routes
                Route::prefix('dishes')->group(function () {
                    Route::get('todays-suggestions', [DishController::class, 'todaysSuggestions'])->name('api.v1.customer.dishes.todays-suggestions');
                    Route::get('new-dishes', [DishController::class, 'newDishes'])->name('api.v1.customer.dishes.new-dishes');
                    Route::get('nearby-dishes', [DishController::class, 'nearbyDishes'])->name('api.v1.customer.dishes.nearby-dishes');
                    Route::get('rated-by-friends', [DishController::class, 'ratedByFriends'])->name('api.v1.customer.dishes.rated-by-friends');
                });

                Route::prefix('restaurants')->group(function () {
                    // List all restaurants
                    Route::get('/', [RestaurantController::class, 'index'])->name('api.v1.restaurants.index');
                    // Post a review
                    Route::post('/{restaurantId}/review', [UserRestaurantInteractionController::class, 'store'])
                        ->name('api.v1.restaurants.review.store');
                });
            });
        });
    });
});
