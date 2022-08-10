<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Http\Helpers\Helper;
use App\Models\User;
use Illuminate\Support\Str;
use Validator, Auth, Hash, DB, File;


class AccountController extends BaseController
{
    //GET AUTH USER PROFILE
    public function profile() 
    {
        $user = User::where('id', Auth::user()->id)->where('status', '1')->first();

        if(!empty($user))
        {
            $success['id']    =  $user->id;
            $success['name']  =  $user->name;
            $success['email'] =  $user->email;
            $success['role']  =  $user->roles->pluck('name')[0];
            $success['image'] =  asset($user->image);

            return $this->handleResponse($success);
        }
    }

    public function changePassword(Request $request) 
    {
        $data = $request->all();
        $user = Auth::user();

        //Changing the password only if is different of null
        
        if( isset($data['oldPassword']) && !empty($data['oldPassword']) && $data['oldPassword'] !== "" && $data['oldPassword'] !=='undefined') {
         //checking the old password first
            $check  = Auth::guard('web')->attempt([
                'email' => $user->email,
                'password' => $data['oldPassword']
            ]);
            
            if($check && isset($data['newPassword']) && !empty($data['newPassword']) && $data['newPassword'] !== "" && $data['newPassword'] !=='undefined') {
                $user->password = Hash::make($data['newPassword']);
                Auth::user()->tokens()->delete();
                
                //Changing the type
                $user->save();
                $success['token'] =  $user->createToken('LaravelSanctumAuth')->plainTextToken;
                
                return $this->handleResponse($success, 'Password Changed Successfully!');
            }
            else 
            {
                return $this->handleError("Wrong password information");
            }
        }
        
        return $this->handleError("Wrong password information");
    }
}
