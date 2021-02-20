<?php

namespace App\Http\Controllers;

use App\Models\Friend;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class ProfileController extends Controller
{
    public function profile(int $id)
    {
        $this->authorize('enterToProfile', [User::class, $id]);

        $userInfo = User::with('image')->whereIn('id', function ($query){
           $query->select('friend_id')->
                   from('friends')->
                   where('user_id', '=', Auth::id())->
                   where('status', '=', '1')->get();
        })->get();

        return view('profile.welcome', ['userInfo' => $userInfo]);
    }
}
