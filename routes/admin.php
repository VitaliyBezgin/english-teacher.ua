<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CRUD\TheoryController;
use App\Http\Controllers\CRUD\WordController;
use App\Http\Controllers\CRUD\CategoryController;
use App\Http\Controllers\CRUD\PractiseController;

Route::middleware('auth')->group(function (){
    Route::resource('theory', TheoryController::class);
    Route::resource('words', WordController::class);
    Route::resource('categories', CategoryController::class);
    Route::resource('practise', PractiseController::class);
});

