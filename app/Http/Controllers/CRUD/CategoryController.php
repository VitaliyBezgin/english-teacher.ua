<?php

namespace App\Http\Controllers\CRUD;

use App\Http\Controllers\Controller;
use App\Http\Requests\CategoryStoreRequest;
use App\Models\Category;
use Illuminate\Http\Request;
use App\Models\Image;
use Illuminate\Support\Facades\Log;

class CategoryController extends Controller
{
    public function index()
    {
        $categories = Category::with(['image'])->paginate(5);

        return view('crud.categories.index', ['categories' => $categories]);
    }

    public function create()
    {
        return view('crud.categories.create');
    }

    public function store(CategoryStoreRequest $request)
    {
        $category = new Category();
        try {
            $category->fill([
                'category_type' => $request->category_type,
                'category_title' => $request->category_title
            ]);
            $res = $category->save();

            if ($res == true && $request->hasFile('image')){

                $image = Image::create([
                    'imageables_id' => $category->id,
                    'imageables_type' => Category::class,
                    'image' => $request->file('image')->getClientOriginalName()
                ]);

                $image_name = $request->file('image')->getClientOriginalName();

                $path = $request->file('image')->storeAs(
                    'public/category_images', $image_name
                );

            }
        }catch (\Exception $e){
            Log::info($e->getMessage());
            return redirect()->back()->with('message', [
                'status' => 'error',
                'text' => $e->getMessage()
            ]);
        }

        return redirect('theory')->with('message', [
            'status' => 'success',
            'text' => "Category \" {$category->category_title} \" was successfully saved ! <br> Have a nice day ! =)"
        ]);
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }


    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
