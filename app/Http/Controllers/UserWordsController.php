<?php

namespace App\Http\Controllers;

use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;

class UserWordsController extends Controller
{
    public function wordsPractise($id)
    {
        $words = Words::with(['category', 'image'])->where('id', $id)->first();

        if (Cache::get('words', false) == false){
            Cache::put('words', $words, 60);
        }

        return view('words.words-practise', ['words' => $words]);
    }

    /*
     * Check words answer
     * */
    public function answerHandle(Request $request)
    {
       $this->checkAnswers($request->word, $request->id, $request->last ?? false);
    }

    final private function checkAnswers($answer, $id, $last = false)
    {

        $wordsFromCache = Cache::get('words', false);

        $words = json_decode($wordsFromCache['words']);

        foreach ($words as $index => $key){
            if ($id === $index){
                if ($key->origin === $answer){
                    echo '✅';
                    if ($last){
                        $levelUp = DB::table('user_levels')->updateOrInsert(
                            ['user_id' => Auth::user()->id],
                            [
                                'points' => DB::raw('points + 25'),
                                'updated_at' => date("Y-m-d H:i:s")
                            ]
                        );
                        echo 'Сongratulations you have earned 25 points';
                    }
                    break;
                }else{
                    echo '❌';
                    break;
                }
            }
        }
    }
}
