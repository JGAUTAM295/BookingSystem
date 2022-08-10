<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\API\BaseController as BaseController;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Http\Controllers\API\BookingController;
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

class FormsAPIController extends BaseController
{
    //GET BOOKING ENTRIES BY USER ROLE WITH FORM LIST
    public function form_list()
    {
        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $forms = Forms::where([['status', '1']])->orderBy('id','ASC')->get();
            
            $formarr = array();

            if($forms->isNotEmpty())
            {
                foreach($forms as $form)
                {
                    $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                    
                    $fieldsarr = array();
                    
                    foreach($cfs as $cf)
                    {
                        $cfds = array();

                        if($cf->input_field_type == 'Select')
                        {
                            $cfds[] = CustomFieldsData::select('id', 'name')->where([['cf_id', $cf->id], ['status', '1']])->orderBy('id','ASC')->get()->toArray();

                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                                'data' => $cfds
                            );
                        }
                        elseif($cf->input_field_type == 'Artist')
                        {
                            $role = $cf->input_artist;
                            
                            $results = User::select('id', 'name')->with('roles')->whereHas("roles", function($q) use($role){ 
                                $q->where('name', '=', $role);
                            })->where('status', '1')->get();

                            $cfds = array();
                            foreach($results as $artist)
                            {
                                $cfds[]= array(
                                    'id' => $artist->id,
                                    'name' => $artist->name
                                );
                            }

                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                                'data' => $cfds
                            );
                        }
                        else
                        {
                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                            );
                        }
          

                    //    echo '<pre>'; print_r($fieldsarr); echo '</pre>';
                        
                    }

                    $formarr[] = array(
                        'id' => $form->id,
                        'title' => $form->title,
                        'form' => $fieldsarr
                    );
                }
                
                $success['forms'] = $formarr;
                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
            
        }
        else
        {
            $forms = Forms::where([['user_id', Auth::user()->id], ['status', '1']])->orderBy('id','ASC')->get();
            
            $formarr = array();

            if($forms->isNotEmpty())
            {
                foreach($forms as $form)
                {
                    $cfs = CustomFields::where([['form_id', $form->id], ['status', '1']])->orderBy('order_no','ASC')->get();
                    
                    $fieldsarr = array();
                    
                    foreach($cfs as $cf)
                    {
                        $cfds = array();

                        if($cf->input_field_type == 'Select')
                        {
                            $cfds[] = CustomFieldsData::select('id', 'name')->where([['cf_id', $cf->id], ['status', '1']])->orderBy('id','ASC')->get()->toArray();

                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                                'data' => $cfds
                            );
                        }
                        elseif($cf->input_field_type == 'Artist')
                        {
                            $role = $cf->input_artist;
                            
                            $results = User::select('id', 'name')->with('roles')->whereHas("roles", function($q) use($role){ 
                                $q->where('name', '=', $role);
                            })->where('status', '1')->get();

                            $cfds = array();
                            foreach($results as $artist)
                            {
                                $cfds[]= array(
                                    'id' => $artist->id,
                                    'name' => $artist->name
                                );
                            }

                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                                'data' => $cfds
                            );
                        }
                        else
                        {
                            $fieldsarr[] = array(
                                'id' => $cf->id,
                                'label' => $cf->name,
                                'inputname' => $cf->slug.'='.$cf->id,
                                'type' => $cf->input_field_type,
                                'required' => $cf->input_required,
                                'order_no' => $cf->order_no,
                            );
                        }
          

                    //    echo '<pre>'; print_r($fieldsarr); echo '</pre>';
                        
                    }

                    $formarr[] = array(
                        'id' => $form->id,
                        'title' => $form->title,
                        'form' => $fieldsarr
                    );
                }
                
                $success['forms'] = $formarr;
                return $this->handleResponse($success);
            }
            else
            {
                return $this->handleError('Data not found!');
            }
        } 
    }

    // Store Form Data
    public function form_store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'form_id' => 'required',
        ]);

        if ($validator->fails())
        {
            return $this->handleError($validator->errors());
        }
        else
        {
            $form = Forms::where([['id', $request->form_id],['status', '1']])->first();
            
            if(!empty($form)) 
            {
                $cfs = CustomFields::where([['form_id', $form->id], ['input_required', '1'], ['status', '1']])->orderBy('order_no','ASC')->get();
                $colnames = array();

                if($cfs->isNotEmpty())
                {
                    foreach($cfs as $cf)
                    {
                        $colnames[] = $cf->slug.'='.$cf->id;
                    }
                }

                $rules = [];

                foreach($colnames as $key => $value)
                {
                    $rules[$value] = 'required';
                }
        
                $validator = Validator::make($request->all(), $rules);

                if ($validator->fails()) 
                {
                    return $this->handleError($validator->errors());
                }
                else
                {
                    $jsonForm = json_encode($request->except('_token', 'form_id'));
                    $jsonDecode = json_decode($jsonForm, true);
                    
                    $cf_files = CustomFields::where('input_field_type', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
                    $col_name = $oldfile = array();
                    $newForm = New BookingForms();
                    $newForm->user_id = Auth::user()->id;
                    $newForm->form_id = $request->form_id;
                    
                    foreach($cf_files as $cf_file) 
                    {
                        $col_name = $cf_file->slug.'='.$cf_file->id;
                        
                        $allowedMimeTypes = explode(',', $cf_file->file_accept);
                        
                        if($request->hasFile($col_name))
                        {
                            $file = $request->file($col_name);
                            $imagename = $file->getClientOriginalName();
                            $imagename = explode('.', $imagename)[0];
                            $contentType = $file->getClientOriginalExtension();
                            
                            if (in_array($contentType, $allowedMimeTypes)) 
                            {
                                $filename = $imagename.'_'.time() . '.' . $file->getClientOriginalExtension();
                                
                                if($contentType == 'pdf')
                                {
                                    $coltype = 'doc';
                                }
                                if($contentType == 'jpg' || $contentType == 'jpeg' || $contentType == 'png') 
                                {
                                    $coltype = 'doc';
                                }
                                
                                $formname  = $coltype."/forms/".date("Y");
                                $formname2 = $coltype."/forms/".date("Y")."/".date("m");
                                $formname3 = $coltype."/forms/".date("Y")."/".date("m")."/".date("d");
                                
                                $file->move(public_path($formname3), $filename);
                                $jsonimage = stripslashes($formname3.'/'.$filename);
                                
                                $jsonDecode[$col_name] = $jsonimage;
                                $jsonForm = json_encode($jsonDecode);
                            }
                        }
                    }

                    $newForm->form_info = $jsonForm;
                    $newForm->created_by = Auth::user()->id;
                    
                    if($newForm->save())
                    {
                        $arr = $request->all();
                        $acf = CustomFields::where('input_field_type', 'Artist')->where('status', '1')->orderBy('order_no','ASC')->get();
                        $colnamee = '';
                        
                        if($acf->isNotEmpty())
                        {
                            foreach($acf as $acf_artist)
                            {
                                $colnamee = $acf_artist->slug.'='.$acf_artist->id;
                                
                                if(isset($colnamee))
                                {
                                    if(!empty($arr[$colnamee])) {
                                        $dcf = CustomFields::where('input_field_type', 'Date')->where('status', '1')->orderBy('order_no','ASC')->get();
                                        
                                        $dcfcolnamee = $booking_date= '';
                                        
                                        if($dcf->isNotEmpty())
                                        {
                                            foreach($dcf as $dcf_date) 
                                            {
                                                $dcfcolnamee = $dcf_date->slug.'='.$dcf_date->id;
                
                                                if(isset($dcfcolnamee)) 
                                                {
                                                    if(!empty($arr[$dcfcolnamee]))
                                                    {
                                                        $booking_date = $arr[$dcfcolnamee];
                                                    }
                                                }
                                            }
                                        }
                                        
                                        $BookedArtist = New BookedArtist();
                                        $BookedArtist->form_id = $request->form_id;
                                        $BookedArtist->booking_id = $newForm->id;
                                        $BookedArtist->col_key = $colnamee;
                                        $BookedArtist->artist_id = $arr[$colnamee];
                                        $BookedArtist->booking_date = $booking_date;
                                        $BookedArtist->save();
                                    }
                                }
                            }
                        }
                        
                        $form = Forms::find($request->form_id);

                        // if(!empty($form->sender_email))
                        // {
                        //     $subject = 'New Booking ('. $form->title.') '.date('d M, Y h:i:s A');
                        //     $sendMail = Helper::sendMail($form->sender_email, $subject, $form->title, $newForm->id);
                        // }

                        $response = $this->bookingtest($newForm->id);

                        //echo '<pre>'; print_r($response); echo '</pre>';

                        $success = $response;
                        return $this->handleResponse($success, 'Booking Form created successfully!');
                    }
                    else
                    {
                        return $this->handleError(null, 'Booking Form not created successfully!');
                    }  
                } 
            }
        }
         
    }

    public function bookingtest($id)
    {
        $entries = array();
        $bkc = new BookingController();
        $response = $bkc->booking_detail($id);
        $response = json_decode(json_encode($response), true);

        if($response['original']['success'] == '1' || $response['original']['success'] == 'true')
        {
            $data = $response['original']['data'];
            
            if(!empty($data))
            {
                if($data['bookings']['entries'])
                {
                   
                   foreach($data['bookings']['entries'] as $value)
                   {
                    $entries = $value;
                   } 
                }
            }
            
        }

        return $entries;
        
    }

}
