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
        if (Cache::get('words', false) == false){
            $words = Words::with(['category', 'image'])->where('id', $id)->first();
            Cache::put('words', $words, now()->addMinutes(60));
        }

        $words = Cache::get('words');

        return view('words.words-practise', ['words' => $words]);
    }

    /*
     * Check words answer
     * */
    public function answerHandle(Request $request)
    {
        $validated = $request->validate([
            'word' => 'required|string|min:1|max:255',
            'id' => 'required|integer',
            'answer_count' => 'required|integer',
        ]);

       $this->checkAnswers($request->word, $request->id, $request->answer_count);
    }

    final private function checkAnswers($answer, $id, $answer_count)
    {

        $wordsFromCache = Cache::get('words', false);

        $words = json_decode($wordsFromCache['words']);

        foreach ($words as $index => $key){
            if ($id === $index){
                if (strcasecmp($key->origin, $answer) == 0) {
                    $this->answerCount($answer_count, $words, '✅');
                    break;
                }else{
                    $this->answerCount($answer_count, $words, '❌', $key->origin);
                    break;
                }
            }
        }
    }

    final private function answerCount(int $answer, object $count_answers, string $answer_result, $correct = '')
    {
        $response = [
            'result' => $answer_result . ' ' . $correct
        ];

        if ($answer == count(get_object_vars($count_answers))){
            $levelUp = DB::table('user_levels')->updateOrInsert(
                ['user_id' => Auth::user()->id],
                [
                    'points' => DB::raw('points + 25'),
                    'updated_at' => date("Y-m-d H:i:s")
                ]
            );

            $response = [
                'status' => 'final',
                'result' => $answer_result,
                'message' => 'Сongratulations you have earned 25 points'
            ];
        }
        print json_encode($response);
    }
}
