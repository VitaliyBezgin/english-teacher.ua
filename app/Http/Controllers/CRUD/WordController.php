<?php

namespace App\Http\Controllers\CRUD;

use App\Http\Controllers\Controller;
use App\Http\Controllers\CRUD\Tools\TaskExploder;
use App\Http\Requests\WordList;
use App\Models\Category;
use App\Models\Image;
use App\Models\Words;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;

class WordController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $words = Words::with(['category', 'image'])->paginate(10);

        return view('crud.words.index', ['words' => $words]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $categories = Category::where('category_type', 'words')->get();

        return view('crud.words.create', ['categories' => $categories]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(WordList $request)
    {
//        example words = "кот=cat|1;собака=dog|2;автомобиль=car|3;девушка=girl|4;";

        $words = new Words();

        try {
            $words->fill([
                'words_title' => $request->words_title,
                'category_id' => $request->category_id,
                'words' => TaskExploder::explodeWords($request->words)
            ]);

            $res = $words->save();

            if ($res == true && $request->hasFile('image')){

                $image = Image::create([
                    'imageables_id' => $words->id,
                    'imageables_type' => Words::class,
                    'image' => $request->file('image')->getClientOriginalName()
                ]);

                $image_name = $request->file('image')->getClientOriginalName();

                $path = $request->file('image')->storeAs(
                    'public/word_images', $image_name
                );

            }

        }catch (\Exception $exc){
            Log::info($exc->getMessage());
            return redirect()->back()->with('message', [
                'status' => 'error',
                'text' => $exc->getMessage()
            ]);
        }

        return redirect('words')->with('message', [
            'status' => 'success',
            'text' => "Words \" {$words->words_title} \" was successfully saved ! <br> Have a nice day ! =)"
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
