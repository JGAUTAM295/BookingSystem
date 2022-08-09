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

class CustomFieldsDataController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($id)
    {
        return view('backend.forms.customFields.data.add', compact('id'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name'   => 'required|unique:custom_fields_data,name,NULL,id,cf_id,' . $id,
            'status' => 'required'
        ]);

        if ($validator->fails())
        {
            $customFields = CustomFields::find($id);
            return view('backend.customFields.data.add', compact('customFields', 'id'))->withErrors($validator->errors());
        }
        else
        {
            $newCustomFieldsData = New CustomFieldsData();
            $newCustomFieldsData->cf_id = $id;
            $newCustomFieldsData->name = $request->name;
            $newCustomFieldsData->status = $request->status;
            $newCustomFieldsData->created_by = Auth::user()->id;
         
            if($newCustomFieldsData->save())
            {
                return redirect()->route('custom-fields.show', $id)->withSuccess(__($request->name.' Custom Field Data created successfully!'));
            }
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\CustomFieldsData  $customFieldsData
     * @return \Illuminate\Http\Response
     */
    public function show(CustomFieldsData $customFieldsData)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\CustomFieldsData  $customFieldsData
     * @return \Illuminate\Http\Response
     */
    public function edit($id, $tdid)
    {
        $customFields = CustomFields::find($id);
        $customFieldsData = CustomFieldsData::find($tdid);

        return view('backend.forms.customFields.data.edit', compact('customFields', 'customFieldsData'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\CustomFieldsData  $customFieldsData
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, CustomFieldsData $customFieldsData)
    {
        $request->validate([
            'name'   => 'required|unique:custom_fields_data,name,NULL,id,cf_id,' . $request->route('id'),
            'status' => 'required',
        ]);

        $customFieldsData = CustomFieldsData::find($request->route('tdid'));
        $customFieldsData->name = $request->name;
        $customFieldsData->status = $request->status;
        $customFieldsData->updated_by = Auth::user()->id;
   
        if($customFieldsData->save())
        {
            return redirect()->route('custom-fields.show', $request->route('id'))->with('success', $request->name.' Custom Field Data has been updated successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\CustomFieldsData $customFieldsData
     * @return \Illuminate\Http\Response
     */
    public function destroy($tdid)
    {
        $customFieldsData = CustomFieldsData::find($tdid);
        if($customFieldsData -> delete()){
            return back()->with('success', $customFieldsData->name.' Custom Field Data has been deleted successfully!');
        }
    }
}
