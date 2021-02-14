<?php


namespace App\Http\Controllers;


use App\Models\Statistic;
use App\Models\Words;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

trait UserProgressWatcher
{
    public function increasePoints(int $words_list_id, int $user_id, string $model_type = Words::class):string
    {
        $message = 'finish';

        $user_history = Statistic::where('user_id', '=', $user_id)->
            where('statistiable_id', '=', $words_list_id)->
            where('statistiable_type', '=', $model_type)->first();

        if (empty($user_history)){
            DB::beginTransaction();
                Statistic::create([
                    'statistiable_id' => $words_list_id,
                    'statistiable_type' => $model_type,
                    'user_id' => $user_id
                ]);

                DB::table('user_levels')->updateOrInsert(
                    ['user_id' => $user_id],
                    [
                        'points' => DB::raw('points + 25'),
                        'updated_at' => date("Y-m-d H:i:s")
                    ]
                );
            DB::commit();

            $message = "Congratulations you earn 25 points !";
        }

        return $message;
    }
}
