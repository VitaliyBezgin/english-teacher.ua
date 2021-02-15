<?php

namespace App\Http\Controllers;

use App\Events\NewFightEvent;
use App\Models\Fight;
use App\Models\Theory;
use App\Models\User;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;
use mysql_xdevapi\Exception;

class PageController extends Controller
{
    public function welcome()
    {

        $bestStudents = null;

        if(Cache::get('name', false) == false){
            $bestStudents = DB::table('user_levels')
                ->join('users', 'user_id', '=', 'users.id')
                ->leftJoin('images', 'user_id', '=', 'imageables_id')
                ->select('users.*', 'user_levels.*', 'images.image')
                ->orderByDesc('user_levels.points')->get();

            Cache::put('bestStudents', $bestStudents, now()->addMinutes(60));
        }else{
            $bestStudents = Cache::get('bestStudents');
        }


        return view('dashboard', ['bestStudents' => $bestStudents]);
    }

    public function getTheory()
    {
        $theories = Theory::select('header')->get();

        return response()->json([
            'data' => $theories
        ]);
    }

    public function opponentsFight(int $striker_id, int $defender_id, int $words_id)
    {
        try{

            $persons_info = User::with(['image', 'level'])->whereIn('id', [$striker_id, $defender_id])->get();

            if (Cache::get('words-'.$words_id == false) == false){
                $words = Words::where('id', '=', $words_id)->first();
                Cache::put('words-'.$words_id, $words, now()->addMinutes(60));
            }

            $words = Cache::get('words-'.$words_id);

            event(new NewFightEvent($words_id, $striker_id, $defender_id));

        }catch (Exception $e){
            Log::info($e->getMessage());
        }

        $words = Cache::get('words-'.$words_id);

        return view('fight_ground', [
            'persons_info' => $persons_info,
            'words' => $words
            ]);
    }

    public function choiceOpponent()
    {
        $id = Auth::id();

        $opponents = DB::table('users')->whereNotIn('id', function ($query){
                                    $query->select('defender_id')->
                                            from('fights')->get();
        })->whereNotIn('id', function ($query){
            $query->select('striker_id')->from('fights')->get();
        })->where('id', '!=', $id)->get();

        $words = Words::all();

        return view('choice_opponent', [
            'opponents' => $opponents,
            'words' => $words
            ]);
    }

    public function profile()
    {
        return view('profile.welcome');
    }

    public function studyWords()
    {
        $words = Words::with(['category', 'image'])->paginate(4);

        return view('study_words', ['words' => $words]);
    }
}
