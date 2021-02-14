<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\UserWordsController;
use App\Http\Controllers\UserTheoryPracticeController;


Route::get('/', [PageController::class, 'welcome'])->name('home');
Route::get('get-theories', [PageController::class, 'getTheory']);
Route::get('words/all', [PageController::class, 'studyWords']);
Route::middleware('auth')->group(function (){
    Route::get('choice/opponent', [PageController::class, 'choiceOpponent']);
    Route::get('opponents/fight/striker/{striker_id}/defender/{defender_id}/words/{words_id}', [PageController::class, 'opponentsFight']);
//    Route::post('opponents/fight', [PageController::class, 'opponentsFight']);
    Route::get('profile', [PageController::class, 'profile']);
    Route::get('/words/practice/{id}', [UserWordsController::class, 'wordsPractise']);
    Route::get('/words/getFile/{id}', [UserWordsController::class, 'wordsGetFile']);
    Route::post('check-words', [UserWordsController::class, 'answerHandle']);
    Route::get('/theory/practice/{id}', [UserTheoryPracticeController::class, 'theoryPractice']);
    Route::post('theory-practice-check', [UserTheoryPracticeController::class, 'answerHandle']);
});

require __DIR__.'/auth.php';
require __DIR__.'/admin.php';
