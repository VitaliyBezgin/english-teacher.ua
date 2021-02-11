<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PageController;
use App\Http\Controllers\UserWordsController;

Route::get('/', [PageController::class, 'welcome']);
Route::get('/dashboard', function () {
    return view('dashboard');
})->middleware(['auth'])->name('dashboard');

Route::get('words/all', [PageController::class, 'studyWords']);
Route::middleware('auth')->group(function (){
    Route::get('profile', [PageController::class, 'profile']);
    Route::get('/words/practise/{id}', [UserWordsController::class, 'wordsPractise']);
    Route::get('/words/getFile/{id}', [UserWordsController::class, 'wordsGetFile']);
    Route::get('download-user-words/', [UserWordsController::class, 'downloadWords']);
    Route::post('check/answers', [UserWordsController::class, 'answerHandle']);
});

require __DIR__.'/auth.php';
require __DIR__.'/admin.php';
