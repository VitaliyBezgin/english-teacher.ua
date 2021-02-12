<?php

namespace App\Http\Controllers;

use App\Models\Theory;
use Illuminate\Support\Facades\Cache;
use Illuminate\Http\Request;
use App\Models\Statistic;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;

class UserTheoryPracticeController extends Controller
{
    public function theoryPractice($id)
    {
        $practice = Cache::get('practice-'.$id, false);

        if ($practice == false){
            $getPractice = Theory::with('practice')->first();
            Cache::put('practice-'.$id, $getPractice);
            $practice = Cache::get('practice-'.$id);
        }

        return view('practice.theory_practice', ['theoryPractise' => $practice]);
    }

    public function answerHandle(Request $request)
    {
        $validated = $request->validate([
            'practice_id' => 'required|integer',
            'question_index' => 'required|integer',
            'answer_index' => 'required|integer'
        ]);

        $this->parsePractiseAnswers($request->practice_id, $request->question_index, $request->answer_index);
    }

    final private function parsePractiseAnswers(int $practice_id, int $question_index, int $answer_index)
    {
        $response = [];
        $message = 'finish !';

        $practices = Cache::get('practice-'.$practice_id);

        foreach (json_decode($practices->practice['questions']) as $index => $val){
            if($question_index == $index){
                if ($val->answer == $answer_index){
                    $response = [
                      'status' => 'true',
                    ];
                }else{
                    $response = [
                        'status' => 'wrong',
                        'origin' => $val->answer
                    ];
                }
                break;
            }
        }

        if($question_index == count(get_object_vars(json_decode($practices->practice['questions'])))){

            //return array
            $user_history = Statistic::where('user_id', '=', Auth::id())->
            where('statistiable_id', '=', $practice_id)->
            where('statistiable_type', '=', Theory::class)->first();
            //check array
            if (empty($user_history)){
                DB::transaction(function () use ($practice_id){
                    Statistic::create([
                        'statistiable_id' => $practice_id,
                        'statistiable_type' => Theory::class,
                        'user_id' => Auth::id()
                    ]);

                    DB::table('user_levels')->updateOrInsert(
                        ['user_id' => Auth::user()->id],
                        [
                            'points' => DB::raw('points + 100'),
                            'updated_at' => date("Y-m-d H:i:s")
                        ]
                    );
                });

                $message = "Congratulations you earn 100 points !";
            }
            $response['message'] = $message;
            $response['status'] = "finished";
        }

        echo json_encode($response);
    }
}
