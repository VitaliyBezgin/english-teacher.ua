
<x-admin.adminApp>
    <h2 class="text-center mt-5 pb-3">Create new theory</h2>
    <div class="theory-create-form w-50 m-auto">
        <form action="{{route('theory.store')}}" method="post">
            @csrf
            <div class="form-group mt-4">
                <label for="">Choose category</label>
                @error('category_id')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <select name="category_id" id="" class="form-control @error('category_id') is-invalid @enderror">
                    @foreach($categories as $category)
                        <option value="{{$category->id}}">{{$category->category_title}}</option>
                    @endforeach
                </select>
            </div>
            <div class="form-group mt-4">
                <label for="">Theory title</label>
                @error('theory_title')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="text" class="form-control @error('theory_title') is-invalid @enderror" name="theory_title" required value="{{old('theory_title')}}">
            </div>
            <div class="form-group mt-4">
                <label for="">Header title</label>
                @error('header')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="text" class="form-control @error('header') is-invalid @enderror" name="header" required value="{{old('header')}}">
            </div>
            <div class="form-group mt-4">
                <label for="">Theory video</label>
                @error('theory_video')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="text" class="form-control  @error('theory_video') is-invalid @enderror" name="theory_video"  value="{{old('theory_video')}}">
            </div>
            <div class="form-group mt-4">
                <label for="">Theory body</label>
                @error('theory_body')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <textarea name="theory_body" required id="" cols="30" rows="10" class="form-control @error('theory_body') is-invalid @enderror">
                    {{old('theory_body')}}
                </textarea>
            </div>
            <input type="submit" value="Save" class="btn btn-success mt-4">
        </form>
    </div>
</x-admin.adminApp>
