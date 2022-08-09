<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use App\Models\CustomFields;
use App\Models\CustomFieldsData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Auth;

class CustomFieldsController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $role = Role::findOrFail(Auth::user()->roles->first()->id);
        $groupsWithRoles = $role->getPermissionNames()->toArray();
        
        $customFields = CustomFields::orderBy('id','DESC')->get();
        return view('backend.customFields.list', compact('customFields', 'groupsWithRoles'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        $roles = Role::where([['name', '!=', 'Super-Admin'], ['name', '!=', 'admin']])->pluck('name','name')->all();
        return view('backend.forms.customFields.add', compact('id', 'roles'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'form_id'=>'required',
            'name' => 'required|unique:custom_fields,name',
            'input_field_type' => 'required',
            'input_required' => 'required',
            'order_no' => 'required',
            'status' => 'required',
        ]);

        if ($validator->fails())
        {
             return view('backend.customFields.list')->withErrors($validator->errors());
        }
        else
        {
            $newCustomFields = New CustomFields();
            $newCustomFields->form_id = $request->form_id;
            $newCustomFields->name = $request->name;
            $newCustomFields->slug = $this->clean($request->name);
            $newCustomFields->input_field_type = $request->input_field_type;
            $newCustomFields->input_required = $request->input_required;
            
            if(!empty($request->file_accept))
            {
                $newCustomFields->file_accept = implode(',', $request->file_accept);
            }

            if(!empty($request->input_artist))
            {
                $newCustomFields->input_artist = $request->input_artist;
            }

            $newCustomFields->order_no = $request->order_no;
            $newCustomFields->status = $request->status;
            $newCustomFields->created_by = Auth::user()->id;
         
            if($newCustomFields -> save())
            {
                return redirect()->route('forms.show', $request->form_id)->withSuccess(__($request->name.' Custom Field created successfully.'));
            }
        } 
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomFields $customFields
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, $id)
    {
        $role = Role::findOrFail(Auth::user()->roles->first()->id);
        $groupsWithRoles = $role->getPermissionNames()->toArray();
        $customFields = CustomFields::find($id);

        $customFieldsdata = CustomFieldsData::where('cf_id', $customFields->id)->orderBy('id','DESC')->get();
        return view('backend.forms.customFields.data.list',  [ 'customFields' => $customFields, 'customFieldsdata' => $customFieldsdata, 'groupsWithRoles' => $groupsWithRoles ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CustomFields $customFields
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $customFields = CustomFields::find($id);
        $roles = Role::where([['name', '!=', 'Super-Admin'], ['name', '!=', 'admin']])->pluck('name','name')->all();
        return view('backend.forms.customFields.edit', [ 'customFields' => $customFields, 'roles' => $roles ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @param  \App\Models\CustomFields $customFields
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required',
            'input_field_type' => 'required',
            'input_required' => 'required',
            'order_no' => 'required',
            'status' => 'required',
        ]);

        $customFields = CustomFields::find($id);
        $customFields->name = $request->name;
        $customFields->slug = $this->clean($request->name);
        $customFields->input_field_type = $request->input_field_type;
        $customFields->input_required = $request->input_required;
        
        if(!empty($request->file_accept))
        {
            $customFields->file_accept = implode(',', $request->file_accept);
        }

        if(!empty($request->input_artist))
        {
            $customFields->input_artist = $request->input_artist;
        }
      
        $customFields->order_no = $request->order_no;
        $customFields->status = $request->status;
        $customFields->updated_by = Auth::user()->id;
   
        if($customFields -> save())
        {
            return redirect()->route('forms.show', $request->form_id)->with('success', $request->name.' Custom Field has been updated successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomFields $customFields
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $customFields = CustomFields::find($id);
        if($customFields -> delete()){
            return back()->with('success', $customFields->name.' Custom Field has been deleted successfully!');
        }
    }

    public function clean($string) {
        $string = str_replace(' ', '-', $string); // Replaces all spaces with hyphens.
        $string = preg_replace('/[^A-Za-z0-9\-]/', '', $string); // Removes special chars.
        $string = strtolower(preg_replace('/-+/', '-', $string));

        return  rtrim($string, '-'); // Replaces multiple hyphens with single one.

     }
}
