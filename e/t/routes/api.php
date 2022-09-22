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


Route::post('register', 'App\Http\Controllers\UserController@register');

Route::post('login', 'App\Http\Controllers\UserController@login');

Route::get('view_category', 'App\Http\Controllers\UserController@view_category');

Route::get('view_items', 'App\Http\Controllers\UserController@view_items');
Route::post('get_user', 'App\Http\Controllers\UserController@get_user');

Route::get('get_item/{id}', 'App\Http\Controllers\UserController@get_item');

Route::post('search_item', 'App\Http\Controllers\UserController@search_item');

Route::post('add_cart', 'App\Http\Controllers\UserController@add_cart'); 

Route::post('add_save', 'App\Http\Controllers\UserController@add_save');

Route::get('view_save/{id}', 'App\Http\Controllers\UserController@view_save'); 

Route::post('history', 'App\Http\Controllers\UserController@history');

Route::get('item_category/{name}', 'App\Http\Controllers\UserController@item_category');

Route::post('delete_cart','App\Http\Controllers\UserController@delete_cart') ;
Route::post('delete_save','App\Http\Controllers\UserController@delete_save') ;

Route::post('delete_all_cart','App\Http\Controllers\UserController@delete_all_cart') ;


Route::post('delete_all_history','App\Http\Controllers\UserController@delete_all_history') ;
Route::get('view_cart/{id}', 'App\Http\Controllers\UserController@view_cart');

Route::get('sale', 'App\Http\Controllers\UserController@sale');
Route::post('buy', 'App\Http\Controllers\UserController@buy');
Route::post('amount', 'App\Http\Controllers\UserController@amount');
Route::post('price', 'App\Http\Controllers\UserController@price');

Route::get('get_sale', 'App\Http\Controllers\UserController@get_sale');