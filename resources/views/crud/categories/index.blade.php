<x-admin.adminApp>
    <div class="container">
        @foreach ($categories as $category)
            <div>
                {{ $category->category_title }}
            </div>
            @if(isset($category->image->image))
                <img src="{{asset('storage/word_images/'.$category->image->image)}}" alt="">
            @endif
        @endforeach
    </div>

    {{ $categories->links() }}
</x-admin.adminApp>
