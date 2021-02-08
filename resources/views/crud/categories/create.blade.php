
<x-admin.adminApp>
    <h2 class="text-center mt-5 pb-3">Create new theory</h2>
    <div class="theory-create-form w-50 m-auto pb-5">
        <form action="{{route('categories.store')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="form-group mt-4">
                <label for="">Choose category</label>
                @error('category_type')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <select name="category_type" id="" required class="form-control @error('category_type') is-invalid @enderror">
                    <option value="words">belongs to words</option>
                    <option value="theory">belongs to  theory</option>
                </select>
            </div>
            <div class="form-group mt-4">
                <label for="">Category title</label>
                @error('category_title')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="text" class="form-control @error('category_title') is-invalid @enderror" required name="category_title"  value="{{old('category_title')}}">
            </div>
            <div class="form-group mt-4">
                <label for="">Category image</label>
                @error('image')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <input type="file" class="form-control @error('image') is-invalid @enderror" name="image">
            </div>
            <input type="submit" value="Save" class="btn btn-success mt-4">
        </form>
    </div>
</x-admin.adminApp>
