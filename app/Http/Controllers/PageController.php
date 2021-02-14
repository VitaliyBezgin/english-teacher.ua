<?php

namespace App\Http\Controllers;

use App\Models\Theory;
use App\Models\User;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class PageController extends Controller
{
    public function welcome()
    {
        $bestStudents = DB::table('user_levels')
                        ->join('users', 'user_id', '=', 'users.id')
                        ->leftJoin('images', 'user_id', '=', 'imageables_id')
                        ->select('users.*', 'user_levels.*', 'images.image')
                        ->orderByDesc('user_levels.points')->get();


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
        //need to cache !!!
        $persons_info = User::with(['image', 'level'])->whereIn('id', [$striker_id, $defender_id])->get();
        $words = Words::where('id', '=', $words_id)->first();

        return view('fight_ground', [
            'persons_info' => $persons_info,
            'words' => $words
            ]);
    }

    public function choiceOpponent()
    {
        $opponents = User::with('image')->where('id', '!=', Auth::id())->get();
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
