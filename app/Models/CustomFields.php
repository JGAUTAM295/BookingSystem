<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\CustomFieldsData;
use App\Models\User;

class CustomFields extends Model
{
    use HasFactory;

    //Check Custom Field Data Exists Or Not Via Custom Field ID
    public function checkCFDexits($data)
    {
        $cfData = CustomFieldsData::where('cf_id', $data)->count();
 
        if($cfData == 0){
            $cfd = '<i class="fas fa-plus mx-2"></i> Add Data';
        }
        else
        {
            $cfd = '<i class="fas fa-eye mx-2"></i> View List';  
        }
         
        return $cfd;
    }

    //Check Custom Fields Data Exists Or Not Via Custom Fields ID
    public function getCustomFieldsData($data)
    {
        $CustomFieldsData = CustomFieldsData::where('cf_id', $data)->get();
        
        return $CustomFieldsData;
    }

    //Get User By Role
    public function getUserByRole($data)
    {
        $role = $data;
        
        $results = User::select('id', 'name')->with('roles')->whereHas("roles", function($q) use($role){ 
            $q->where('name', '=', $role);
        })->where('status', '1')->get();

        
        return $results;
    }
}
