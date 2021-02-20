<?php

namespace App\Http\Controllers;

use App\Events\FriendInvitationEvent;
use App\Jobs\NotifyFriendJob;
use App\Jobs\NotifyNewFriendJob;
use App\Models\Friend;
use App\Models\User;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;

class FriendController extends Controller
{
    public function friendsList()
    {
        $potentialFriends = User::select('id', 'fname', 'sname')->whereNotIn('id', function ($query){
            $query->select('friend_id')->from('friends')->where('user_id', '=', Auth::id())->get();
        })->where('id', '!=', Auth::id())->get();

        $resultCollection = [];

        foreach ($potentialFriends as $friend){
            array_push($resultCollection, [
                'label' => $friend->fname. ' '.$friend->sname,
                'value' => $friend->id
            ]) ;
        }

        return response()->json([
            'potentialFriends' => $resultCollection
        ]);
    }

    public function addFriend(Request $request)
    {
        $request->validate([
            'user_id' => 'required|integer',
            'friend_id' => 'required|integer'
        ]);

        if ($request->friend_id == Auth::id()){
            throw new \Exception('You want add yourself to friends ?? =) I don\'t think soo');
        }

        try {
            if ($request->friend_id != Auth::id()){
                $newFriend = new Friend();
                $newFriend->user_id = $request->user_id;
                $newFriend->friend_id = $request->friend_id;
               $res = $newFriend->save();

               if ($res == true){
                   NotifyNewFriendJob::dispatch($request->friend_id)->delay(now()->addSeconds(30));
               }

                return redirect()->back()->with('message', 'Friend request was successfully sent');
            }
        }catch (\Exception $e){
            Log::info($e->getMessage());
            return redirect()->back()->with('error', 'Something was wrong ! =(');
        }
    }
}
