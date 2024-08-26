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
    Route::post('login', [AuthenticationController::class, 'login'])->name('api.login');
    Route::middleware('auth:sanctum')->group(function () {

    });


});

