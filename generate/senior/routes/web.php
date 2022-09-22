<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('adminlogin');
});


Route::post('admin_login','App\Http\Controllers\dashController@admin_login');
Route::get('adminindex','App\Http\Controllers\dashController@adminindex');
Route::get('show_order/{id}','App\Http\Controllers\dashController@show_order') ;
Route::post('genrate','App\Http\Controllers\dashController@genrate') ;

Route::get('usershow','App\Http\Controllers\dashController@usershow') ;

Route::get('delete_user/{id}','App\Http\Controllers\dashController@delete_user') ;

Route::get('logout','App\Http\Controllers\dashController@logout') ;