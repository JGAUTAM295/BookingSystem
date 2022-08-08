<?php

use Illuminate\Support\Facades\Route;
use Illuminate\Support\Facades\Artisan;

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

Auth::routes();

// Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Authentication Routes...
Route::get('/', [
    'as' => 'login',
    'uses' => 'App\Http\Controllers\Auth\LoginController@showLoginForm'
]);

Route::post('/', [
    'as' => '',
    'uses' => 'App\Http\Controllers\Auth\LoginController@login'
]);

Route::get('logout', [
    'as' => 'logout',
    'uses' => 'App\Http\Controllers\Auth\LoginController@logout'
  ]);
  
  // Password Reset Routes...
  Route::post('password/email', [
    'as' => 'password.email',
    'uses' => 'App\Http\Controllers\Auth\ForgotPasswordController@postEmail'
  ]);
  Route::get('password/reset', [
    'as' => 'password.request',
    'uses' => 'App\Http\Controllers\Auth\ForgotPasswordController@showLinkRequestForm'
  ]);
  Route::post('password/reset', [
    'as' => 'password.update',
    'uses' => 'App\Http\Controllers\Auth\ResetPasswordController@customreset'
  ]);
  Route::get('password/reset/{token}', [
    'as' => 'password.reset',
    'uses' => 'App\Http\Controllers\Auth\ResetPasswordController@customshowResetForm'
  ]);
  
  // Registration Routes...
  Route::get('register', [
    'as' => 'register',
    'uses' => 'App\Http\Controllers\Auth\RegisterController@showRegistrationForm'
  ]);
  Route::post('register', [
    'as' => '',
    'uses' => 'App\Http\Controllers\Auth\RegisterController@register'
  ]);
  
    //clear all cache
  
    Route::get('/clear', function() {
      Artisan::call('cache:clear');
      Artisan::call('config:clear');
      Artisan::call('config:cache');
      Artisan::call('view:clear');
      
      return "Cleared!";
      
  });


  Route::group(['namespace' => 'App\Http\Controllers'], function()
  {   
    /**
     * Home Routes
     */
    //Route::get('/', 'HomeController@index')->name('home.index');

    Route::group(['middleware' => ['guest']], function() {
        /**
         * Register Routes
         */
        //Route::get('/register', 'RegisterController@show')->name('register.show');
        //Route::post('/register', 'RegisterController@register')->name('register.perform');

        /**
         * Login Routes
         */
        //Route::get('/login', 'LoginController@show')->name('login.show');
        //Route::post('/login', 'LoginController@login')->name('login.perform');

    });

    Route::group(['middleware' => ['auth', 'permission']], function() {
        /**
         * User Routes
         */
        Route::group(['prefix' => 'admin/users'], function() {
            Route::get('/', [App\Http\Controllers\UserController::class, 'index'])->name('users');
            Route::get('/add-users', [App\Http\Controllers\UserController::class, 'create'])->name('addUser');
            Route::post('/store-users', [App\Http\Controllers\UserController::class, 'store'])->name('storeUser');
            Route::get('/edit/{id}', [App\Http\Controllers\UserController::class, 'edit'])->name('editUser');
            Route::post('/update/{id}', [App\Http\Controllers\UserController::class, 'update'])->name('updateUser');
            //Route::get('/{id}', [App\Http\Controllers\UserController::class, 'show'])->name('viewUser');
            Route::delete('/delete-users/{id}', [App\Http\Controllers\UserController::class, 'destroy'])->name('deleteUser');
            Route::get('/users/clients', [App\Http\Controllers\UserController::class, 'getclients'])->name('clientUser');
            Route::get('/users/staffs', [App\Http\Controllers\UserController::class, 'getstaff'])->name('staffsUser');
            Route::post('/getclient', [App\Http\Controllers\UserController::class, 'fetchClient'])->name('user.fetchClient');
            Route::post('/getartist', [App\Http\Controllers\UserController::class, 'fetchartist'])->name('user.fetchartist');

        });

        /**
         * Client Routes
         */
        Route::group(['prefix' => 'user'], function() {
            Route::resource('inventory', Backend\InventoryController::class);
            //Route::resource('custom-forms', Backend\EquipmentController::class);
            Route::get('/inventory/{id}/equipment', 'Backend\EquipmentController@index')->name('equipment.index');
            Route::get('/inventory/{id}/equipment/create', 'Backend\EquipmentController@create')->name('equipment.create');
            Route::post('/inventory/{id}/equipment/create', 'Backend\EquipmentController@store')->name('equipment.store');
            Route::get('/inventory/{id}/equipment/show/{eid}', 'Backend\EquipmentController@show')->name('equipment.show');
            Route::get('/inventory/{id}/equipment/downloadPDF/{eid}','Backend\EquipmentController@downloadPDF')->name('equipment.downloadPDF');
            Route::get('/inventory/{id}/equipment/edit/{eid}', 'Backend\EquipmentController@edit')->name('equipment.edit');
            Route::patch('/inventory/{id}/equipment/update/{eid}', 'Backend\EquipmentController@update')->name('equipment.update');
            Route::delete('/inventory/{id}/equipment/delete/{eid}', 'Backend\EquipmentController@destroy')->name('equipment.destroy');
            Route::get('/inventory/{id}/equipment/qr_code/{eid}', 'Backend\EquipmentController@getQRCode')->name('equipment.getQRCode');
            Route::get('/inventory/{id}/equipment/export', 'Backend\EquipmentController@exportcsv')->name('equipment.export');
            Route::post('/inventory/{id}/equipment/import', 'Backend\EquipmentController@importcsv')->name('equipment.import');
            Route::post('/getinventory', 'Backend\InventoryController@fetchInventory')->name('user.fetchInventory');

           
            Route::resource('taxonomyData', Backend\TaxonomyDataController::class);
            Route::resource('work_order', Backend\WorkOrderController::class);
            Route::resource('equipment_issues', Backend\EquipmentIssueLoggingController::class);
            Route::resource('departments', Backend\DepartmentController::class);
            Route::get('/equipment_issues/{id}/work_order', 'Backend\EquipmentIssueLoggingController@orderIndex')->name('equipment_issues_order.index');
            Route::get('/equipment_issues/{id}/work_order/create', 'Backend\EquipmentIssueLoggingController@orderCreate')->name('equipment_issues_order.create');
            Route::post('/equipment_issues/{id}/work_order/store', 'Backend\EquipmentIssueLoggingController@orderStore')->name('equipment_issues_order.store');
            Route::get('/equipment_issues/{id}/work_order/edit/{eilid}', 'Backend\EquipmentIssueLoggingController@orderEdit')->name('equipment_issues_order.edit');
            Route::patch('/equipment_issues/work_order/update/{id}', 'Backend\EquipmentIssueLoggingController@orderUpdate')->name('equipment_issues_order.update');
            Route::delete('/equipment_issues/{id}/work_order/delete/{eilid}', 'Backend\EquipmentIssueLoggingController@orderDestroy')->name('equipment_issues_order.destroy');
            
            Route::get('/taxonomy/{id}/data', 'Backend\TaxonomyDataController@index')->name('taxonomyData.index');
            Route::get('/taxonomy/{id}/data/create', 'Backend\TaxonomyDataController@create')->name('taxonomyData.create');
            Route::post('/taxonomy/{id}/data/create', 'Backend\TaxonomyDataController@store')->name('taxonomyData.store');
            Route::get('/taxonomy/{id}/data/show/{tdid}', 'Backend\TaxonomyDataController@show')->name('taxonomyData.show');
            Route::get('/taxonomy/{id}/data/edit/{tdid}', 'Backend\TaxonomyDataController@edit')->name('taxonomyData.edit');
            Route::patch('/taxonomy/{id}/data/update/{tdid}', 'Backend\TaxonomyDataController@update')->name('taxonomyData.update');
            Route::delete('/taxonomy/{id}/data/delete/{tdid}', 'Backend\TaxonomyDataController@destroy')->name('taxonomyData.destroy');

            Route::get('/employees/report', 'Backend\ReportController@employees_report')->name('employees.report');
            Route::get('/equipment/report', 'Backend\ReportController@equipment_report')->name('equipment.report');
            Route::get('/work-order-status/report', 'Backend\ReportController@work_order_status')->name('work_order.report');
        });

        Route::resource('roles', RolesController::class);
        Route::resource('permissions', PermissionsController::class);
        Route::resource('settings', WebSettingController::class);
        Route::resource('booking-forms', Backend\BookingFormsController::class);
        Route::get('/booking-forms/entries/{id}', 'Backend\BookingFormsController@booking_entries')->name('booking-forms.list');
        Route::get('/booking-forms/export/{id}', 'Backend\BookingFormsController@booking_export')->name('booking-forms.export');

        Route::resource('forms', Backend\FormsController::class);
        //Route::resource('custom-fields', Backend\CustomFieldsController::class);
        Route::get('/forms/{id}/custom-fields', 'Backend\CustomFieldsController@index')->name('custom-fields.index');
        Route::get('/forms/{id}/custom-fields/create', 'Backend\CustomFieldsController@create')->name('custom-fields.create');
        Route::post('/forms/custom-fields/store', 'Backend\CustomFieldsController@store')->name('custom-fields.store');
        Route::get('/forms/custom-fields/show/{eid}', 'Backend\CustomFieldsController@show')->name('custom-fields.show');
        Route::get('/forms/custom-fields/edit/{eid}', 'Backend\CustomFieldsController@edit')->name('custom-fields.edit');
        Route::patch('/forms/custom-fields/update/{eid}', 'Backend\CustomFieldsController@update')->name('custom-fields.update');
        Route::delete('/forms/custom-fields/delete/{eid}', 'Backend\CustomFieldsController@destroy')->name('custom-fields.destroy');
        
        Route::get('/custom-fields/{id}/data', 'Backend\CustomFieldsDataController@index')->name('customFieldsData.index');
        Route::get('/custom-fields/{id}/data/create', 'Backend\CustomFieldsDataController@create')->name('customFieldsData.create');
        Route::post('/custom-fields/{id}/data/create', 'Backend\CustomFieldsDataController@store')->name('customFieldsData.store');
        Route::get('/custom-fields/{id}/data/show/{tdid}', 'Backend\CustomFieldsDataController@show')->name('customFieldsData.show');
        Route::get('/custom-fields/{id}/data/edit/{tdid}', 'Backend\CustomFieldsDataController@edit')->name('customFieldsData.edit');
        Route::patch('/custom-fields/{id}/data/update/{tdid}', 'Backend\CustomFieldsDataController@update')->name('customFieldsData.update');
        Route::delete('/custom-fields/data/delete/{tdid}', 'Backend\CustomFieldsDataController@destroy')->name('customFieldsData.destroy');

        Route::post('/removeimage', 'WebSettingController@removeimage')->name('settings.removeimage');
        Route::resource('menus', MenusController::class);
        Route::get('/menus-item', 'MenusController@link_index')->name('menus_item.index');
        Route::get('/menus-item/create', 'MenusController@link_create')->name('menus_item.create');
        Route::post('/menus-item/store', 'MenusController@link_store')->name('menus_item.store');
        Route::get('/menus-item/edit/{id}', 'MenusController@link_edit')->name('menus_item.edit');
        Route::patch('/menus-item/update/{id}', 'MenusController@link_update')->name('menus_item.update');
        Route::delete('/menus-item/delete/{id}', 'MenusController@link_destroy')->name('menus_item.destroy');
    });
});

  Route::group(['middleware' => ['auth']], function() {

    Route::get('/dashboard', [App\Http\Controllers\Backend\DashboardController::class, 'index'])->name('dashboard');
    Route::get('/clientStaff/{year}', [App\Http\Controllers\Backend\DashboardController::class, 'clientStaff'])->name('dashboard.clientStaff');
    Route::get('/profile/{id}', [App\Http\Controllers\UserController::class, 'profile'])->name('user.profile');
    Route::get('/delete-your-account}', [App\Http\Controllers\UserController::class, 'authRemove'])->name('authRemove');
    Route::get('/workorder/{year}', [App\Http\Controllers\Backend\DashboardController::class, 'workorder'])->name('dashboard.workorder');
    Route::get('/contact', [App\Http\Controllers\Backend\DashboardController::class, 'contactindex'])->name('dashboard.contactindex');
    Route::post('/contactstore', [App\Http\Controllers\Backend\DashboardController::class, 'contactstore'])->name('dashboard.contactstore');
    Route::get('/mail', [App\Http\Controllers\Backend\DashboardController::class, 'mail'])->name('dashboard.mail');
    Route::get('/read-mail/{id}', [App\Http\Controllers\Backend\DashboardController::class, 'readmail'])->name('dashboard.readmail');
    Route::post('/replymessage', [App\Http\Controllers\Backend\DashboardController::class, 'replymessage'])->name('dashboard.replymessage');
    Route::delete('/mail/delete/{id}', [App\Http\Controllers\Backend\DashboardController::class, 'destorymail'])->name('dashboard.destorymail');
    Route::get('/notifications', [App\Http\Controllers\Backend\DashboardController::class, 'notifications_list'])->name('dashboard.notificationsList');
    Route::delete('/notifications/delete/{id}', [App\Http\Controllers\Backend\DashboardController::class, 'notifications_destroy'])->name('notification.destroy');
    Route::delete('/notifications-clear', [App\Http\Controllers\Backend\DashboardController::class, 'notifications_clear'])->name('notification.clearAll');
    //Route::post('/save-token', [App\Http\Controllers\Auth\LoginController::class, 'authenticate'])->name('save-token');
    
    // Route::post('/send-notification', [App\Http\Controllers\HomeController::class, 'sendNotification'])->name('send.notification');
    
});

