<x-admin.adminApp>
    <div class="container">
        @foreach ($words as $word)
            {{ $word->words_title }}
            @if(isset($word->image->image))
                <img src="{{asset('storage/word_images/'.$word->image->image)}}" alt="">
            @endif
            <ul>
                <li>{{$word->category->category_title}}</li>
            </ul>
        @endforeach
    </div>

    {{ $words->links() }}
</x-admin.adminApp>
