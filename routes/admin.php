<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CRUD\TheoryController;

Route::resource('theory', TheoryController::class)->middleware('auth');
