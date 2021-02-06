<?php

namespace App\Http\Controllers\CRUD;

use App\Events\NewTheory;
use App\Http\Controllers\Controller;
use App\Http\Requests\StoreTheoryRequest;
use App\Models\Theory;
use App\Models\User;
use Illuminate\Http\Request;

class TheoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $theories = Theory::paginate(3);

        return view('crud.theory.index', ['theories' => $theories]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $theories = Theory::with('category')->get();

        return view('crud.theory.create', ['theories' => $theories]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreTheoryRequest $request)
    {
        $validated = $request->validated();

        $newTheory = new Theory();
        try {
            $newTheory->fill([
                'category_id' => $request->category_id,
                'theory_title' => $request->theory_title,
                'header' => $request->header,
                'theory_video' => (!isset($request->theory_video)) ? null : json_encode($request->theory_video),
                'theory_body' => $request->theory_body,
            ]);
           $res = $newTheory->save();

           if ($res == true){
               $users= User::all();
               event(new NewTheory($users, $newTheory));
           }

        }catch (\Exception $exception){
            return redirect()->back()->with('message', [
                'status' => 'error',
                'text' => $exception->getMessage()
            ]);
        }

        return redirect('theory')->with('message', [
            'status' => 'success',
            'text' => "Theory \" {$newTheory->theory_title} \" was successfully saved ! <br> Have a nice day ! =)"
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
