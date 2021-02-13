<?php

namespace App\Http\Controllers;

use App\Models\Theory;
use App\Models\User;
use App\Models\Words;
use Illuminate\Http\Request;

class PageController extends Controller
{
    public function welcome()
    {
        return view('dashboard');
    }

    public function getTheory()
    {
        $theories = Theory::select('header')->get();

        return response()->json([
            'data' => $theories
        ]);
    }

    public function profile()
    {
        return view('profile.welcome');
    }

    public function studyWords()
    {
        $words = Words::with(['category', 'image'])->paginate(4);

        return view('study_words', ['words' => $words]);
    }
}
