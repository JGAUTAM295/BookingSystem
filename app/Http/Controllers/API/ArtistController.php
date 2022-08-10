<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Illuminate\Http\Request;
use App\Http\Helpers\Helper;
use App\Models\User;
use App\Models\BookingForms;
use App\Models\BookedArtist;
use Illuminate\Support\Str;
use Validator, Auth, Hash, DB, File;

class ArtistController extends BaseController
{
    //GET AUTH USER PROFILE
    public function artist_booked(Request $request) 
    {
        $user = User::where([['id',$request->id], ['status', '1']])->first();
        
        if(!empty($user))
        {
            $artistbooked = BookedArtist::where([['artist_id', $user->id], ['form_id', $request->form_id]])->first();

            if($artistbooked)
            {
                if(strtotime($request->eventdate) == strtotime($artistbooked->booking_date))
                {
                    return $this->handleResponse(null, $request->label.' '.$user->name.' is already booked on this date! Please select another date!');
                }
            }
        }
        else
        {
            return $this->handleError('User not found!');
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
