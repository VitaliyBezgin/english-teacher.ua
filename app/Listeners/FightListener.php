<?php

namespace App\Listeners;

use App\Events\NewFightEvent;
use App\Models\Fight;
use App\Models\FightInfo;
use App\Models\User;
use App\Notifications\InvitationToBattle;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Notification;

class FightListener
{
    /**
     * Create the event listener.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     *
     * @param  NewFightEvent  $event
     * @return void
     */
    public function handle(NewFightEvent $event)
    {
        try {
            $history = DB::table('fights')->
                      where('striker_id', '=', $event->striker_id)->
                      where('defender_id', '=', $event->defender_id)->
                      where('words_id', '=', $event->words_id)->first();

            if ($history == null){
                $fight = new Fight();
                $fight->striker_id = $event->striker_id;
                $fight->defender_id = $event->defender_id;
                $fight->words_id = $event->words_id;
                $fight->save();

                $defender = User::where('id', '=', $event->defender_id)->first();

                $defender->notify(new InvitationToBattle(Auth::user()));
            }
        }catch (\Exception $e){
            Log::info($e->getMessage());
        }
    }
}
