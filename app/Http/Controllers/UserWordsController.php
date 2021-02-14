<?php

namespace App\Http\Controllers;

use App\Models\Statistic;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use App\Http\Controllers\UserProgressWatcher;

class UserWordsController extends Controller
{
    use UserProgressWatcher;


    public function wordsGetFile($id)
    {
        if (intval($id)){
            try {
                $userWordFile = storage_path().'/app/public/user_files/'.Auth::id().'wordFile'.'.txt';
                $file = fopen($userWordFile, 'w');
                foreach (json_decode(Cache::get('words-'.$id)->words) as $index => $val){
                    fwrite($file, $index.'. '.$val->translate.' - '.$val->origin. "\n");
                }
                fclose($file);

            $filePath = public_path('storage/user_files/'.Auth::id().'wordFile'.'.txt');
            $headers = ['Content-Type: application/txt'];
            $fileName = time().'.txt';

            return response()->download($filePath, $fileName, $headers);

            }catch (\Exception $e){
                print $e->getMessage();
            }
        }
    }

    public function wordsPractise($id)
    {
        if (Cache::get('words-'.$id, false) == false){

            $words = Words::with(['category', 'image'])->where('id', $id)->first();

            if ($words == null){
                return redirect('/');
            }

            Cache::put('words-'.$id, $words, now()->addMinutes(60));
        }

        $words = Cache::get('words-'.$id);

        return view('words.words-practice', ['words' => $words]);
    }

    /*
     * Check words answer
     * */
    public function answerHandle(Request $request)
    {
        $validated = $request->validate([
            'answer' => 'required|string|min:1|max:255',
            'word_id' => 'required|integer',
            'words_list_id' => 'required|integer'
        ]);


        if (!Cache::get('words-'. $request->words_list_id, false)){
            Cache::put('words-'. $request->words_list_id, Words::where('id', '=', $request->word_id)->first(), now()->addSeconds(60));
        }

        $this->checkAnswer($request->answer, $request->word_id, $request->words_list_id);
    }

    final private function checkAnswer(string $answer, int $word_id, int $words_list_id, string $functionality_type = 'lesson')
    {
        $response = [];
        $message = 'Finish !';

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

            //it try to increase user points of this words testing first time
            $increasePoints = $this->increasePoints($words_list_id, Auth::id());

            $response['message'] = $increasePoints;
            $response['status'] = "finished";
        }

       echo json_encode($response);
    }
}
