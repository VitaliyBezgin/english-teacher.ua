<?php

namespace App\Listeners;

use App\Events\AddNewFriendEvent;
use App\Models\User;
use App\Notifications\NotifyNewFriendNotification;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;

class FriendRequestListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */

    public function __construct()
    {

    }

    /**
     * Handle the event.
     *
     * @param  AddNewFriendEvent  $event
     * @return void
     */
    public function handle(AddNewFriendEvent $event)
    {
        $find_friend = User::where('id', '=', $event->friend_id)->first();

        $find_friend->notify(new NotifyNewFriendNotification($find_friend));
    }
}
