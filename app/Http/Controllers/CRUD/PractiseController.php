<?php

namespace App\Http\Controllers\CRUD;

use App\Http\Controllers\Controller;
use App\Http\Controllers\CRUD\Tools\TaskExploder;
use App\Http\Requests\PractiseStoreRequest;
use App\Models\Practice;
use App\Models\Theory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class PractiseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $practices = DB::table('practices')->select('theory_id')->get();

        $practice_ids = [];

        foreach ($practices as $id){
            array_push($practice_ids, $id->theory_id);
        }

        $theories = Theory::whereNotIn('id', $practice_ids)->get();

        return view('crud.practise.create', ['theories' => $theories]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(PractiseStoreRequest $request)
    {
        $practise = new Practice();

        try {
            $practices = TaskExploder::explodePractise($request->questions);

            $practise->fill([
                'theory_id' => $request->theory_id,
                'questions' => $practices,
            ]);

            $practise->save();

        }catch (\Exception $exception){
            Log::info($exception->getMessage());
            return redirect()->back()->with('message', [
                'status' => 'error',
                'text' => $exception->getMessage()
            ]);
        }

        return redirect()->back()->with('message', [
            'status' => 'success',
            'text' => "Practise was successfully saved !"
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
