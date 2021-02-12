<x-admin.adminApp>
    <h2 class="text-center mt-5 pb-3">Create practise for theory</h2>
    <div class="theory-create-form w-50 m-auto pb-5">
        <form action="{{route('practice.store')}}" method="post" enctype="multipart/form-data">
            @csrf
            <div class="form-group mt-4">
                <label for="">Choose category</label>
                @error('theory_id')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <select name="theory_id" id="" required class="form-control @error('theory_id') is-invalid @enderror">
                @foreach($theories as $theory)
                    <option value="{{$theory->id}}">{{$theory->theory_title}}</option>
                @endforeach
                </select>
            </div>
            <div class="form-group mt-4">
                <label for="">Question</label>
                @error('questions')
                <div class="alert alert-danger">{{ $message }}</div>
                @enderror
                <textarea name="questions" required  cols="30" rows="10" class="form-control @error('questions') is-invalid @enderror">
                    {{old('questions')}}
                </textarea>
                <p title="example"><mark> Example: 1    @answer@   I saw Tom yesterday, but .... @options@
                        I have not seen him today@,@ I has not saw him today @,@ I did not see him today @;@</mark></p>
            </div>
            <input type="submit" value="Save" class="btn btn-success mt-4">
        </form>
    </div>
</x-admin.adminApp>
