<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
Route::post('register','App\Http\Controllers\admincontroller@register');

Route::post('login','App\Http\Controllers\admincontroller@login');

Route::post('add_application','App\Http\Controllers\admincontroller@add_application');

Route::post('user_profile', 'App\Http\Controllers\admincontroller@user_profile');