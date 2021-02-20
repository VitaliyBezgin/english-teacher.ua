<?php

namespace App\Http\Controllers;

use App\Http\Controllers\UserWordsController;
use App\Models\User;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Log;
use mysql_xdevapi\Exception;
use App\Events\NewFightEvent;

class OpponentController extends Controller
{

    /*
     * Prepare fight playground for battle
     * */
    protected $words;

    public function opponentsFightPlayground(int $striker_id, int $defender_id, int $words_id)
    {
        try{

            $persons_info = User::with(['image', 'level'])->whereIn('id', [$striker_id, $defender_id])->get();

            if (Cache::get('words-'.$words_id == false) == false){
                $this->words = Words::where('id', '=', $words_id)->first();
                Cache::put('words-'.$words_id, $this->words, now()->addMinutes(60));
            }

            $this->words = Cache::get('words-'.$words_id);

            event(new NewFightEvent($words_id, $striker_id, $defender_id));

        }catch (Exception $e){
            Log::info($e->getMessage());
        }


        return view('fight_ground', [
            'persons_info' => $persons_info,
            'words' => $this->words
        ]);
    }

    public function answerHandle(Request $request)
    {

    }
}
