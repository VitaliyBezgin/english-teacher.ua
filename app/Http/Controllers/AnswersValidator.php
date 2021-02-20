<?php


namespace App\Http\Controllers;


use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;

trait AnswersValidator
{
    /*
     * Getting words list from cache by @words_list_id
     * Search in words list confluence with given words by @word_id,
     * if confluence was founded push to @response array response message
     * */
    final private function checkAnswer(string $answer, int $word_id, int $words_list_id, string $functionality_type = 'lesson')
    {
        $response = [];

        $words = Cache::get('words-'.$words_list_id);


        foreach (json_decode($words['words']) as $index => $val){
            if ($index == $word_id){
                if(strcasecmp($val->origin, $answer) == 0){
                    $response = [
                        'result' => 'true',
                        'icon' => '✅'
                    ];
                }else{
                    $response = [
                        'result' => 'wrong',
                        'origin' => $val->origin,
                        'icon' => '❌'
                    ];
                }
                break;
            }
        }

        if($word_id == count(get_object_vars(json_decode($words['words']))) && $functionality_type == 'lesson'){

            //trying to increase user points of this words list testing first time
            $increasePoints = $this->increasePoints($words_list_id, Auth::id());

            $response['message'] = $increasePoints;
            $response['status'] = 'finish';
        }

        echo json_encode($response);
    }
}
