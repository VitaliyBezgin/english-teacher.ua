<?php


namespace App\Http\Controllers\CRUD\Tools;


class WordsExplode
{
    protected static $words_arr = [];

    public static function explodeWords( string $words):string
    {
        $step_1 = explode(';', $words);

        //flush empty space in array
        array_pop($step_1);

        foreach ($step_1 as $key){
            $step_2 = explode('=', $key);
            $step_3 = explode('|', $step_2[1]);

            self::$words_arr += [
                $step_3[1] => [
                    'origin' => $step_3[0],
                    'translate' => $step_2[0]
                ]
            ];
        }

        return json_encode(self::$words_arr, JSON_UNESCAPED_UNICODE);
    }
}
