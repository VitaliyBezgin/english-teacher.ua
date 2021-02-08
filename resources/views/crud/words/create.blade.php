
<x-admin.adminApp>
    <h2 class="text-center mt-5 pb-3">Create new theory</h2>
    <div class="theory-create-form w-50 m-auto pb-5">
        <form action="{{route('words.store')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="form-group mt-4">
                <label for="">Choose category</label>
                @error('category_id')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <select name="category_id" id="" required class="form-control @error('category_id') is-invalid @enderror">
                    @foreach($categories as $category)
                        <option value="{{$category->id}}">{{$category->category_title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group mt-4">
                <label for="">Words title</label>
                @error('words_title')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="text" class="form-control @error('words_title') is-invalid @enderror" required name="words_title"  value="{{old('words_title')}}">
            </div>
            <div class="form-group mt-4">
                <label for="">Words image</label>
                @error('image')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="file" class="form-control @error('image') is-invalid @enderror" name="image">
            </div>
            <div class="form-group mt-4">
                <label for="">Words body</label>
                @error('words')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <mark>
                    <hr>
                    <div>stick to the rules</div>
                    <div>example</div>
                    <b>кот=cat|1;собака=dog|2;автомобиль=car|3;девушка=girl|4;</b>
                </mark>
                <textarea name="words" required  id="" cols="30" rows="10" class="form-control @error('words') is-invalid @enderror">
                    {{old('words')}}
                </textarea>
            </div>
            <input type="submit" value="Save" class="btn btn-success mt-4">
        </form>
    </div>
</x-admin.adminApp>
