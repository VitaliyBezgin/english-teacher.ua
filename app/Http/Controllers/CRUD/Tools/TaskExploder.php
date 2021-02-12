<?php


namespace App\Http\Controllers\CRUD\Tools;


use PhpParser\Node\Stmt\DeclareDeclare;

class TaskExploder
{
    private static $practices = [];

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


    /*
     * Getting string and parse it.
     * string example
     *   1    @answer@   I saw Tom yesterday, but .... @options@
     *                      I have not seen him today@,@ I has not saw him today @,@ I did not see him today @;@
     *
     * @answer@ = question answer;
     * @options@ = answer options;
     * @,@ = options delimiter;
     * @;@ practice delimiter;
     * */
    public static function explodePractise(string $data):string
    {
        $questionsAll = explode('@;@', $data);

        array_pop($questionsAll);

        foreach ($questionsAll as $index => $val){
            $getAnswer = explode('@answer@', $val);
            $answer = $getAnswer[0];
            $getQuestionText = explode('@options@', trim($getAnswer[1]));
            $questionText = $getQuestionText[0];
            $getOptions = explode('@,@', $getQuestionText[1]);

            self::$practices +=[
                ++$index => [
                    'answer' => trim($answer),
                    'questionText' => trim($questionText),
                    'options' => []
                ]
            ];

            foreach ($getOptions as $index_2 => $val_2){
                self::$practices[$index]['options'] += [
                    ++$index_2 => trim($val_2)
                ];
            }
        }

        return json_encode(self::$practices, JSON_UNESCAPED_UNICODE);
    }
}
