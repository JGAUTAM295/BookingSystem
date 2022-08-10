<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Auth\ResetPasswordController;

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

// Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//     return $request->user();
// });
    //Route::post('password/reset', ResetPasswordController::class);
Route::group(['namespace' => 'App\Http\Controllers'], function()
{
    Route::get('user_roles', 'API\AuthController@getUserRole')->name('UserRole');
    Route::post('login', 'API\AuthController@login')->name('login');
    Route::post('register', 'API\AuthController@register')->name('register');
    Route::post('password/email', 'API\AuthController@forgotPassword')->name('forgotPassword');
    Route::post('password/code/check', 'API\AuthController@codecheck')->name('codecheck');
    // Route::get('profile', 'API\StaffController@profile')->name('profile');
    // After Login Routes
    
    Route::middleware('auth:sanctum')->group(function ()
    {
        Route::get('form_list', 'API\FormsAPIController@form_list')->name('form_list');
        Route::post('form_store', 'API\FormsAPIController@form_store')->name('form_store');
        Route::get('booking_list', 'API\BookingController@booking_list')->name('booking_list');
        Route::get('booking_detail/{id}', 'API\BookingController@booking_detail')->name('booking_detail');
        Route::post('get_booking_by_date', 'API\BookingController@booking_by_date')->name('booking_by_date');
        Route::get('bookingtest/{id}', 'API\FormsAPIController@bookingtest')->name('bookingtest');
        Route::post('artist_booked', 'API\ArtistController@artist_booked')->name('artist_booked');

        
        Route::get('profile', 'API\AccountController@profile')->name('profile');
        Route::post('change_password', 'API\AccountController@changePassword')->name('changePassword');
        
        Route::get('notifications', 'API\NotificationController@index')->name('notifications');
        Route::get('notification/{id}', 'API\NotificationController@readnotification')->name('readnotification');
        Route::get('clear_notification_id/{id}', 'API\NotificationController@deletenotification')->name('deletenotification');
        Route::get('clear_notifications', 'API\NotificationController@destroyallnotification')->name('destroyallnotification');
        Route::post('logout', 'API\AuthController@logout')->name('logout');
    });

});