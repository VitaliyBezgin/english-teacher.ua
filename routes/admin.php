<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CRUD\TheoryController;
use App\Http\Controllers\CRUD\WordController;

Route::resource('theory', TheoryController::class)->middleware('auth');
Route::resource('words', WordController::class)->middleware('auth');
