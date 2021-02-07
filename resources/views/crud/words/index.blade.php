<x-admin.adminApp>
    <div class="container">
        @foreach ($words as $word)
            {{ $word->words_title }}
            <img src="{{asset('storage/word_images/'.$word->image->image)}}" alt="">
            <ol>
                <li>{{$word->category->category_title}}</li>
            </ol>
        @endforeach
    </div>

    {{ $words->links() }}
</x-admin.adminApp>
