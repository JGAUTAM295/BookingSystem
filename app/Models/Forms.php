<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Forms extends Model
{
    use HasFactory;

    //Check Custom Fields Data Exists Or Not Via Form ID
    public function checkCFExits($data)
    {
        $cf = CustomFields::where('form_id', $data)->count();

        if($cf == 0){
            $cf = '<i class="fas fa-plus"></i> Add Data';
        }
        else
        {
            $cf = '<i class="fas fa-eye"></i> Form Field List';  
        }
        
        return $cf;
    }
}
