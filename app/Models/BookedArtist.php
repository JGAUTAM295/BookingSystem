<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Permission\Models\Role;
use Spatie\Permission\Models\Permission;
use App\Models\User;
use Carbon\Carbon;

class BookedArtist extends Model
{
    use HasFactory;

    protected $fillable = ['artist_id'];

    public function getartistbookcountbyrole($data) {
        $role = $data;
        
        $gettArtist = User::select('id', 'name')->with('roles')->whereHas("roles", function($q) use($role){ 
            $q->where([ ['name', $role]]);
        })->where('status', '1')->get();

        $getBookedArtist = array();

        foreach($gettArtist as $vall)
        {
            $getBookedArtist[] = BookedArtist::select('artist_id')->where('artist_id', $vall->id)->count();

        }
        
        return array_sum($getBookedArtist);
    }

    public function getartistbookcountbyrolemonthly($data) {
        $role = $data;
        
        $gettArtist = User::select('id', 'name')->with('roles')->whereHas("roles", function($q) use($role){ 
            $q->where([ ['name', $role]]);
        })->where('status', '1')->get();

        $getBookedArtist = array();

        foreach($gettArtist as $vall)
        {
            $res = BookedArtist::select('artist_id')->where([ ['artist_id', $vall->id], ['created_at', '>', Carbon::now()->startOfWeek()], ['created_at','<', Carbon::now()->endOfWeek()] ])->
            // groupBy('artist_id')->
            get()->toArray();

            $getBookedArtist[] = count($res);
        }
        
        return array_sum($getBookedArtist);
    }
}
