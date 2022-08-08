<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use App\Models\Forms;
use App\Models\CustomFields;
use App\Models\CustomFieldsData;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Str;
use Response, Auth, PDF, File;

class FormsController extends Controller
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

            return view('backend.forms.list', compact('forms', 'groupsWithRoles'));
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
        return view('backend.forms.add');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'title'   => 'required|unique:forms',
            'status' => 'required',
        ]);

        if ($validator->fails())
        {
            return view('backend.forms.add')->withErrors($validator->errors());
        }
        else
        {
        
            $newForm = New Forms();
            $newForm->user_id = Auth::user()->id;
            $newForm->title = $request->title;
            $newForm->status = $request->status;
            $newForm->created_by = Auth::user()->id;

            if($newForm->save())
            {
                return redirect()->route('forms.index')->withSuccess(__('Form created successfully!'));
            }
            else
            {
                return redirect()->route('forms.index')->withErrors(__('Form not created successfully!'));
            }
        }
    }
    

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Forms $forms
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $role = Role::findOrFail(Auth::user()->roles->first()->id);
        $groupsWithRoles = $role->getPermissionNames()->toArray();
            
        $form = Forms::find($id);
        $customFields = CustomFields::where('form_id', $id)->orderBy('id','ASC')->get();
        
        return view('backend.forms.customFields.list', compact('form','customFields', 'groupsWithRoles'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Forms  $forms
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $forms = Forms::find($id);
        return view('backend.forms.edit', [ 'form' => $forms ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Forms  $forms
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'title' => 'required',
            'status' => 'required',
        ]);

        $forms = Forms::find($id);
        $forms->title = $request->title;
        $forms->status = $request->status;
        $forms->updated_by = Auth::user()->id;
   
        if($forms->save())
        {
            return redirect()->route('forms.index')->with('success', 'Form has been updated successfully!');
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Forms  $forms
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $forms = Forms::find($id);
        if($forms->delete()){
            return back()->with('success', 'Form has been deleted successfully!');
        }
    }
}
