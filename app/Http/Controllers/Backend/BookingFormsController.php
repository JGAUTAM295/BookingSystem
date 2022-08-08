<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use App\Models\BookingForms;
use App\Models\BookedArtist;
use App\Models\Forms;
use App\Models\CustomFields;
use App\Models\CustomFieldsData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Response, Auth, PDF, File;

class BookingFormsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::check()) 
        {
            $role = Role::findOrFail(Auth::user()->roles->first()->id);
            $groupsWithRoles = $role->getPermissionNames()->toArray();
        
            if(Auth::user()->hasRole('admin|Super-Admin'))
            {
                $forms = Forms::orderBy('id','DESC')->get();
            }
            else
            {
                $forms = Forms::where('user_id', Auth::user()->id)->orderBy('id','DESC')->get();
            }

            return view('backend.bookingforms.list', compact('forms', 'groupsWithRoles'));
        }
        else
        {
            return redirect()->route('dashboard');
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $jsonForm = json_encode($request->except('_token', 'form_id'));
        $jsonDecode = json_decode($jsonForm, true);
        
        $cf = CustomFields::where('input_field_type', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
        
        $colname = $oldfile = array();
    
        $newForm = New BookingForms();
        $newForm->user_id = Auth::user()->id;
        $newForm->form_id = $request->form_id;
            
        foreach($cf as $cf_file) 
        {
            $colname = $cf_file->slug.'='.$cf_file->id;
            
            $allowedMimeTypes = explode(',', $cf_file->file_accept);
            
            if($request->hasFile($colname))
            {
                $file = $request->file($colname);
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
                    
                    $jsonDecode[$colname] = $jsonimage;
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
                            $BookedArtist = New BookedArtist();
                            $BookedArtist->booking_id =$newForm->id;
                            $BookedArtist->col_key = $colnamee;
                            $BookedArtist->artist_id = $arr[$colnamee];
                            $BookedArtist->save();
                        }
                        
                    }   
                }
                
            }
            
            return redirect()->route('booking-forms.index')->withSuccess(__('Booking Form created successfully!'));
        }
        else
        {
            return redirect()->route('booking-forms.index')->withErrors(__('Booking Form not created successfully!'));
        }   
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\BookingForms  $bookingForms
     * @return \Illuminate\Http\Response
     */
    public function show(BookingForms $bookingForms, $id)
    {
        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $form = Forms::where('id', $id)->orderBy('id','DESC')->first();
        }
        else
        {
            $form = Forms::where('id', $id)->where('user_id', Auth::user()->id)->first();
        }
        
        $cfs = CustomFields::where('status', '1')->orderBy('order_no','ASC')->get();
        return view('backend.bookingforms.add', compact('form', 'cfs'));
    }

    public function booking_entries($id)
    {
        $role = Role::findOrFail(Auth::user()->roles->first()->id);
        $groupsWithRoles = $role->getPermissionNames()->toArray();

        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $form = Forms::where('id', $id)->orderBy('id','DESC')->first();
        }
        else
        {
            $form = Forms::where('id', $id)->where('user_id', Auth::user()->id)->first();
        }
        
        $cfs = CustomFields::where('status', '1')->orderBy('order_no','ASC')->limit('5')->get();
       
        $bookingforms = BookingForms::select('id','form_info')->where('form_id', $id)->get();
       
        $my_var = array();
        foreach($bookingforms as $bookingform)
        {
            
            $ccf = CustomFields::where('input_field_type', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
            $form_info = json_decode($bookingform->form_info, true); // convert it to an array.
           // $my_var['booking_id']  = $bookingform->id;

            $firstItem = array('booking_id' => $bookingform->id);
            $form_info =array_merge($firstItem, $form_info);
            
            $my_var[] = $form_info;
        }

        return view('backend.bookingforms.entries.list', compact('groupsWithRoles', 'form', 'cfs', 'my_var', 'bookingforms'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\BookingForms  $bookingForms
     * @return \Illuminate\Http\Response
     */
    public function edit(BookingForms $bookingForms, $id)
    {
        $role = Role::findOrFail(Auth::user()->roles->first()->id);
        $groupsWithRoles = $role->getPermissionNames()->toArray();

        $bookingform = BookingForms::find($id);

        if(Auth::user()->hasRole('admin|Super-Admin'))
        {
            $form = Forms::where('id', $bookingform->form_id)->orderBy('id','DESC')->first();
        }
        else
        {
            $form = Forms::where('id', $bookingform->form_id)->where('user_id', Auth::user()->id)->first();
        }
        
        $cfs = CustomFields::where('status', '1')->orderBy('order_no','ASC')->get();
        
        $jsonbookingform = json_decode($bookingform->form_info, true); 
        return view('backend.bookingforms.edit', compact('groupsWithRoles', 'form', 'cfs', 'bookingform', 'jsonbookingform'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\BookingForms  $bookingForms
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BookingForms $bookingForms)
    {
        $jsonForm = json_encode($request->except('_method', 'id', 'form_id', '_token'));
        $jsonDecode = json_decode($jsonForm, true);
        
        $cf = CustomFields::where('input_field_type', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
        
        $colname = $oldfile = array();
        
        $form = BookingForms::find($request->id);
        $form->user_id = Auth::user()->id;
        $form->form_id = $request->form_id;
        $oldjsonDecode = json_decode($form->form_info, true);
        
        foreach($cf as $cf_file) 
        {
            $colname = $cf_file->slug.'='.$cf_file->id;
            
            if(!empty($oldjsonDecode[$colname]))
            {
              $oldfile = $oldjsonDecode[$colname];  
            }
            
            $allowedMimeTypes = explode(',', $cf_file->file_accept);
            
            if($request->hasFile($colname))
            {
                $file = $request->file($colname);
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

                    
                    if(!empty($oldfile))
                    {
                        if (File::exists('public/'.$oldfile))
                        {
                            File::delete('public/'.$oldfile);
                        }
                        
                    }
                    
                    $file->move(public_path($formname3), $filename);
                    $jsonimage = stripslashes($formname3.'/'.$filename);
                    
                    $jsonDecode[$colname] = $jsonimage;
                    $jsonEquipment = json_encode($jsonDecode);
                    
                }
            }
            else
            {
                $jsonDecode[$colname] = $oldfile;
                $jsonForm = json_encode($jsonDecode);
            }
        }
        
        $form->form_info = $jsonForm;
        $form->updated_by = Auth::user()->id;
   
        if($form->save())
        {
            $arr = $request->all();
            $arrd = array();

            $acf = CustomFields::where('input_field_type', 'Artist')->where('status', '1')->orderBy('order_no','ASC')->get();
            $colnamee = '';
            if($acf->isNotEmpty())
            {
                foreach($acf as $acf_artist) 
                {
                    $colnamee = $acf_artist->slug.'='.$acf_artist->id;

                    if(isset($colnamee)) 
                    {
                        $value = $arr[$colnamee];

                        // $arrd[] = array(
                        //     $colnamee => $arr[$colnamee]
                        // );
                        if(!empty($arr[$colnamee])) {
                            $BookedArtist = BookedArtist::where('booking_id', $request->id)
                            ->where('col_key', $colnamee)->update([
                                'artist_id' => $arr[$colnamee]
                            ]);
                        }
                        
                    }

                    
                }

                
            }
          
            return redirect()->route('booking-forms.list', $request->form_id)->withSuccess(__('Booking Form has been updated successfully!'));
        }
        else
        {
            return redirect()->route('booking-forms.show', $request->form_id)->withErrors(__('Booking Form not updated successfully!'));
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\BookingForms  $bookingForms
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $bookingForm = BookingForms::find($id);
        if($bookingForm->delete()){
            return back()->with('success', 'Booking Form has been deleted successfully!');
        }
    }

    public function booking_export($id)
    {
        $form = Forms::find($id);
        if(!empty($form))
        {
            $bookingForms = BookingForms::where('form_id', $form->id)->orderBy('id','ASC')->get();
            $fileName = strtolower(str_replace('_', ' ', $form->title)).'_bookingForms'.'_'.time().'_'.rand().'.csv';

            $headers = array(
                "Content-type"        => "text/csv",
                "Content-Disposition" => "attachment; filename=$fileName",
                "Pragma"              => "no-cache",
                "Cache-Control"       => "must-revalidate, post-check=0, pre-check=0",
                "Expires"             => "0"
            );

            $cfs = CustomFields::where('input_field_type', '!=', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
            $columns = [];
            foreach($cfs as $cf)
            {
                $columns[] = strtoupper($cf->name);
            }

            $callback = function() use($bookingForms, $columns) {
               $file = fopen('php://output', 'w');
               fputcsv($file, $columns);
    
                foreach ($bookingForms as $bookingForm) 
                {
                    $ccf = CustomFields::where('input_field_type', 'File')->where('status', '1')->orderBy('order_no','ASC')->get();
                    $acf = CustomFields::where('input_field_type', 'Artist')->where('status', '1')->orderBy('order_no','ASC')->get();
                    $my_var = json_decode($bookingForm->form_info, true); // convert it to an array.
                   
                    $json = array();

                    
                    if($ccf->isNotEmpty())
                    {
                        foreach($ccf as $cf_file) 
                        {
                            $colname = $cf_file->slug.'='.$cf_file->id;
                            unset($my_var[$colname]);
                            $json = json_encode($my_var);
                            
                        }

                        $form_info = json_decode($json, true);

                        foreach ($form_info as  $key => $value) 
                        { 
                            $form_info[$key]  = $value; 
                        }

                        fputcsv($file, $form_info);
                    }
                    elseif($acf->isNotEmpty())
                    {
                        foreach($acf as $acf_artist) 
                        {
                            $colname = $acf_artist->slug.'='.$acf_artist->id;
                            $artistname = User::select('name')->where('id', $my_var[$colname])->where('status', '1')->first();
                            if(!empty($artistname))
                            {
                                $my_var[$colname]  = $artistname->name;
                            }
                            
                        }

                       // echo '<pre>'; print_r($my_var);  echo '</pre>';
                       
                       fputcsv($file, $my_var);

                    }
                    else
                    {
                       fputcsv($file, $my_var);
                       
                    }
                }
                fclose($file);
          };

            return response()->stream($callback, 200, $headers);
            
        }
    }
}
