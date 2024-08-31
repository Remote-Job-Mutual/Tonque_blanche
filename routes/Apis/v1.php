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

        Route::post('login', [AuthenticationController::class, 'login'])->name('api.login');
        Route::post('/register', [AuthenticationController::class, 'register'])->name('api.register');

        //Now Apply Middleware for Authenticated User
        Route::middleware('auth:sanctum')->group(function () {
            //logout for all type auth
            Route::post('logout', [AuthenticationController::class, 'logout'])->name('api.logout');

            Route::prefix('customer')->group(function () {
                Route::get('profile', [AuthenticationController::class, 'profile'])->name('api.customer.profile');
                Route::post('update-password', [AuthenticationController::class, 'updatePassword'])->name('api/customer.update-password');


                //Screen
                Route::get('/home', [DishController::class, 'home'])->name('api.customer.home');

            });
        });


    });
});

