<?php

namespace App\Http\Controllers;

use App\Events\NewTheory;
use App\Mail\TellNewTheory;
use App\Models\Theory;
use App\Models\User;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class PageController extends Controller
{
    public function welcome()
    {
        return view('welcome');
    }
    public function studyWords()
    {
        $words = Words::with(['category', 'image'])->paginate(4);

        return view('study_words', ['words' => $words]);
    }
}
