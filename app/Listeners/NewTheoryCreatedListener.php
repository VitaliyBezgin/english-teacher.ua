<?php

namespace App\Listeners;

use App\Events\NewTheory;
use App\Notifications\NotifyClient;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;

class NewTheoryCreatedListener
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
     * @param  NewTheory  $event
     * @return void
     */
    public function handle(NewTheory $event)
    {
        foreach ($event->users as $user){
            try{
                Notification::send($user, new NotifyClient($user, $event->theory));
            }catch (\Exception $e){
                Log::info($e->getMessage());
            }
        }
    }
}
