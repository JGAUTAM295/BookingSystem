<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Http\Helpers\Helper;
use App\Models\User;
use App\Models\BookingForms;
use App\Models\BookedArtist;
use App\Models\Forms;
use App\Models\CustomFields;
use App\Models\CustomFieldsData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Response, Auth, PDF, File, Crypt;

class BookingController extends BaseController
{
    //GET BOOKING ENTRIES BY USER ROLE WITH FORM LIST
    public function booking_list()
    {
        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $bookingforms = BookingForms::groupBy('form_id')->get();

            $bookingsarr = array();

            if($bookingforms->isNotEmpty())
            {
                foreach($bookingforms as $bookingform)
                {
                    $form = Forms::where([['id', $bookingform->form_id], ['status', '1']])->orderBy('id','ASC')->first();

                    $formarr = array();
                    
                    if(!empty($form))
                    {
                        $my_var = array();
                        $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                    
                        foreach($cfs as $cf)
                        {
                            $forminfoarr = array();

                            $colname = $cf->slug.'='.$cf->id;

                            $bkforms = BookingForms::where('form_id', $form->id)->orderBy('id','ASC')->get();

                            if($bkforms->isNotEmpty())
                            {
                                foreach($bkforms as $bkform)
                                {
                                    $my_var['id'] = $bkform->id;
                                    $form_info = json_decode($bkform->form_info, true);
                                    
                                    foreach($form_info as $key => $val)
                                    {
                                        if($cf->input_field_type == 'Artist')
                                        {
                                            $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                            
                                            if(!empty($artistname))
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                                }
                                            }
                                            else
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                                }
                                            }
                                        }
                                        elseif($cf->input_field_type == 'Date')
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                            }
                                        }
                                        else
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                            }
                                        }
                                    }
                                    
                                    $forminfoarr[] = $my_var;
                                }
                            }
                        }
                        
                        $formarr = array(
                            'id' => $form->id,
                            'title' => $form->title,
                            'entries' => $forminfoarr
                        );
                    }
                    
                    $bookingsarr[] = $formarr;
                }

                $success['bookings'] = $bookingsarr;
                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }   
        }
        else
        {
            $bookedartists = BookedArtist::where('artist_id', Auth::user()->id)->groupBy('form_id')->get();

            // $bookingform = $form = $cfs = $form_info = $bookingsarr = array();

            $bookingsarr = array();

            if($bookedartists->isNotEmpty())
            {
                foreach($bookedartists as $bookedartist)
                {
                    $form = Forms::where([['id', $bookedartist->form_id], ['status', '1']])->orderBy('id','ASC')->first();

                    $formarr = array();
                    
                    if(!empty($form))
                    {
                        $my_var = $forminfoarr = array();

                        $bkforms = BookingForms::where('form_id', $form->id)->orderBy('id','ASC')->get();

                        if($bkforms->isNotEmpty())
                        {
                            foreach($bkforms as $bkform)
                            {
                                $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                                
                                foreach($cfs as $cf)
                                {
                                    $colname = $cf->slug.'='.$cf->id;
                                    
                                    $my_var['id'] = $bkform->id;
                                    
                                    $form_info = json_decode($bkform->form_info, true);
                                    
                                    foreach($form_info as $key => $val)
                                    {
                                        if($cf->input_field_type == 'Artist')
                                        {
                                            $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                            
                                            if(!empty($artistname))
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                                }
                                            }
                                            else
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                                }
                                            }
                                        }
                                        elseif($cf->input_field_type == 'Date')
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                            }
                                        }
                                        else
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                            }
                                        }
                                    }
                                }

                                $forminfoarr[] = $my_var;
                            }
                        }

                        $formarr = array(
                            'id' => $form->id,
                            'title' => $form->title,
                            'entries' => $forminfoarr
                        );
                    }
                   
                    $bookingsarr[] = $formarr;
                }

                $success['bookings'] = $bookingsarr;

                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        } 
    }

    //GET BOOKING BY BOOKING ID
    public function booking_detail($id)
    {
        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $bookingform = BookingForms::where('id', $id)->groupBy('form_id')->first();

            $bookingsarr = array();

            if(!empty($bookingform))
            {
                $form = Forms::where([['id', $bookingform->form_id], ['status', '1']])->orderBy('id','ASC')->first();
                
                $formarr = array();
                
                if(!empty($form))
                {
                    $my_var = array();
                    $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                    
                    foreach($cfs as $cf)
                    {
                        $forminfoarr = array();

                        $colname = $cf->slug.'='.$cf->id;

                        $bkform = BookingForms::where([['id', $id], ['form_id', $form->id]])->orderBy('id','ASC')->first();

                        if(!empty($bkform))
                        {
                            $my_var['id'] = $bkform->id;

                            $form_info = json_decode($bkform->form_info, true);
                            
                            foreach($form_info as $key => $val)
                            {
                                if($cf->input_field_type == 'Artist')
                                {
                                    $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                    
                                    if(!empty($artistname))
                                    {
                                        if($colname == $key)
                                        {
                                            $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                        }
                                    }
                                    else
                                    {
                                        if($colname == $key)
                                        {
                                            $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                        }
                                    }
                                }
                                elseif($cf->input_field_type == 'Date')
                                {
                                    if($colname == $key)
                                    {
                                        $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                    }
                                }
                                else
                                {
                                    if($colname == $key)
                                    {
                                        $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                    }
                                }
                            }
                        }
                        
                        $forminfoarr[] = $my_var;
                            
                    }
                       
                    $formarr = array(
                        'id' => $form->id,
                        'title' => $form->title,
                        'entries' => $forminfoarr
                    );
                }
                
                $success['bookings'] = $formarr;

                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        }
        else
        {
      
            $bookedartist = BookedArtist::where([['booking_id', $id], ['artist_id', Auth::user()->id]])->groupBy('form_id')->first();

            $bookingsarr = array();

            if(!empty($bookedartist))
            {
              
                $form = Forms::where([['id', $bookedartist->form_id], ['status', '1']])->orderBy('id','ASC')->first();

                $formarr = array();
                
                if(!empty($form))
                {
                    $my_var = $forminfoarr = array();

                    $bkform = BookingForms::where([['id', $id],['form_id', $form->id]])->orderBy('id','ASC')->first();
                    
                    if(!empty($bkform))
                    {
                        $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                        
                        foreach($cfs as $cf)
                        {
                            $colname = $cf->slug.'='.$cf->id;
                            $my_var['id'] = $bkform->id;

                            $form_info = json_decode($bkform->form_info, true);
                            
                            foreach($form_info as $key => $val)
                            {
                                if($cf->input_field_type == 'Artist')
                                {
                                    $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                    
                                    if(!empty($artistname))
                                    {
                                        if($colname == $key)
                                        {
                                            $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                        }
                                    }
                                    else
                                    {
                                        if($colname == $key)
                                        {
                                            $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                        }
                                    }
                                }
                                elseif($cf->input_field_type == 'Date')
                                {
                                    if($colname == $key)
                                    {
                                        $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                    }
                                }
                                else
                                {
                                    if($colname == $key)
                                    {
                                        $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                    }
                                }
                            }
                        }
                        
                        $forminfoarr[] = $my_var;
                        
                        $formarr = array(
                            'id' => $form->id,
                            'title' => $form->title,
                            'entries' => $forminfoarr
                        );
                    }
                    
                    $success['bookings'] = $formarr;
                    return $this->handleResponse($success);
                }
                else
                {
                    return $this->handleError('Data not found!');
                }
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        }
    }

    public function booking_by_date(Request $request)
    {
        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            if(!empty($request->to_date))
            {
                $bookedartists = BookedArtist::whereBetween('booking_date', [date('m/d/Y h:i A', strtotime($request->from_date)), date('m/d/Y h:i A', strtotime($request->to_date))])->groupBy('booking_id')->get();
            }
            else
            {
                $bookedartists = BookedArtist::whereDate('booking_date', '=', date('m/d/Y h:i A', strtotime($request->from_date)))->groupBy('booking_id')->get();
            }
            
            $bookingsarr = array();

            if($bookedartists->isNotEmpty())
            {
                foreach($bookedartists as $bookedartist)
                {
                    $form = Forms::where([['id', $bookedartist->form_id], ['status', '1']])->orderBy('id','ASC')->first();

                    $formarr = array();
                    
                    if(!empty($form))
                    {
                        $my_var = $forminfoarr = array();

                        $bkforms = BookingForms::where([['id', $bookedartist->booking_id], ['form_id', $form->id]])->orderBy('id','ASC')->get();

                        if($bkforms->isNotEmpty())
                        {
                            foreach($bkforms as $bkform)
                            {
                                $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                                
                                foreach($cfs as $cf)
                                {
                                    $colname = $cf->slug.'='.$cf->id;
                                    
                                    $my_var['id'] = $bkform->id;
                                    
                                    $form_info = json_decode($bkform->form_info, true);
                                    
                                    foreach($form_info as $key => $val)
                                    {
                                        if($cf->input_field_type == 'Artist')
                                        {
                                            $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                            
                                            if(!empty($artistname))
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                                }
                                            }
                                            else
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                                }
                                            }
                                        }
                                        elseif($cf->input_field_type == 'Date')
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                            }
                                        }
                                        else
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                            }
                                        }
                                    }
                                }

                                $forminfoarr[] = $my_var;
                            }
                        }

                        $formarr = array(
                            'id' => $form->id,
                            'title' => $form->title,
                            'entries' => $forminfoarr
                        );
                    }
                   
                    $bookingsarr[] = $formarr;
                }

                $success['bookings'] = $bookingsarr;

                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        }
        else
        {
            if(!empty($request->to_date))
            {
                $bookedartists = BookedArtist::where('artist_id', Auth::user()->id)->whereBetween('booking_date', [date('m/d/Y h:i A', strtotime($request->from_date)), date('m/d/Y h:i A', strtotime($request->to_date))])->groupBy('booking_id')->get();
            }
            else
            {
                $bookedartists = BookedArtist::where('artist_id', Auth::user()->id)->whereDate('booking_date', date('m/d/Y h:i A', strtotime($request->from_date)))->groupBy('booking_id')->get();
            }

            $bookingsarr = array();

            if($bookedartists->isNotEmpty())
            {
                foreach($bookedartists as $bookedartist)
                {
                    $form = Forms::where([['id', $bookedartist->form_id], ['status', '1']])->orderBy('id','ASC')->first();

                    $formarr = array();
                    
                    if(!empty($form))
                    {
                        $my_var = $forminfoarr = array();

                        $bkforms = BookingForms::where([['id', $bookedartist->booking_id], ['form_id', $form->id]])->orderBy('id','ASC')->get();

                        if($bkforms->isNotEmpty())
                        {
                            foreach($bkforms as $bkform)
                            {
                                $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                                
                                foreach($cfs as $cf)
                                {
                                    $colname = $cf->slug.'='.$cf->id;
                                    
                                    $my_var['id'] = $bkform->id;
                                    
                                    $form_info = json_decode($bkform->form_info, true);
                                    
                                    foreach($form_info as $key => $val)
                                    {
                                        if($cf->input_field_type == 'Artist')
                                        {
                                            $artistname = User::select('name')->where('id', $val)->where('status', '1')->first();
                                            
                                            if(!empty($artistname))
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $artistname->name;
                                                }
                                            }
                                            else
                                            {
                                                if($colname == $key)
                                                {
                                                    $my_var[strtolower(str_replace(' ', '_', $cf->name))] = null;
                                                }
                                            }
                                        }
                                        elseif($cf->input_field_type == 'Date')
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = date('d/m/Y, H:i:s', strtotime($val));
                                            }
                                        }
                                        else
                                        {
                                            if($colname == $key)
                                            {
                                                $my_var[strtolower(str_replace(' ', '_', $cf->name))] = $val;
                                            }
                                        }
                                    }
                                }

                                $forminfoarr[] = $my_var;
                            }
                        }

                        $formarr = array(
                            'id' => $form->id,
                            'title' => $form->title,
                            'entries' => $forminfoarr
                        );
                    }
                   
                    $bookingsarr[] = $formarr;
                }

                $success['bookings'] = $bookingsarr;

                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        }
        
    }
  
}
