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
    use UserProgressWatcher, AnswersValidator;

    public function wordsList()
    {
        $wordsList = Words::paginate(20);

        return view('words.words-list', ['wordsList' => $wordsList]);
    }

    /*
     * Download tested words file by @id
     * */
    public function wordsGetFile(int $id)
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

    /*
     * Get words list for practising by @id
     * */
    public function wordsPractise(int $id)
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
     * Handle and validate words list answers request
     * */
    public function answerHandle(Request $request)
    {
        $request->validate([
            'answer' => 'required|string|min:1|max:255',
            'word_id' => 'required|integer',
            'words_list_id' => 'required|integer'
        ]);


        if (!Cache::get('words-'. $request->words_list_id, false)){
            Cache::put('words-'. $request->words_list_id, Words::where('id', '=', $request->word_id)->first(), now()->addSeconds(60));
        }

        $this->checkAnswer($request->answer, $request->word_id, $request->words_list_id);
    }
}
