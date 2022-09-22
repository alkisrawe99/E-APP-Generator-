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


Route::post('admin_login','App\Http\Controllers\AdminController@admin_login');
Route::get('adminindex','App\Http\Controllers\AdminController@adminindex');


Route::get('usershow','App\Http\Controllers\AdminController@usershow');
Route::get('productsshow','App\Http\Controllers\AdminController@productsshow');
Route::get('products','App\Http\Controllers\AdminController@products');
Route::get('categories','App\Http\Controllers\AdminController@categories');
Route::post('add_category','App\Http\Controllers\AdminController@add_category');
Route::post('add_products','App\Http\Controllers\AdminController@add_products');
Route::get('show_categorys','App\Http\Controllers\AdminController@show_categorys');

Route::get('delete_user/{id}','App\Http\Controllers\AdminController@delete_user') ;
Route::get('delete_category/{id}','App\Http\Controllers\AdminController@delete_category') ;
Route::get('delete_products/{id}','App\Http\Controllers\AdminController@delete_products') ;
Route::get('show_user/{id}','App\Http\Controllers\AdminController@show_user') ;
Route::post('update_user','App\Http\Controllers\AdminController@update_user') ;
Route::get('show_category/{id}','App\Http\Controllers\AdminController@show_category') ;
Route::post('update_category','App\Http\Controllers\AdminController@update_category') ;
Route::get('show_products/{id}','App\Http\Controllers\AdminController@show_products') ;
Route::post('update_prodact','App\Http\Controllers\AdminController@update_prodact') ;

Route::get('logout','App\Http\Controllers\AdminController@logout') ;


Route::get('sale','App\Http\Controllers\AdminController@sale');
Route::get('saleshow','App\Http\Controllers\AdminController@saleshow');
Route::post('add_sale','App\Http\Controllers\AdminController@add_sale');
Route::get('delete_sale/{id}','App\Http\Controllers\AdminController@delete_sale') ;