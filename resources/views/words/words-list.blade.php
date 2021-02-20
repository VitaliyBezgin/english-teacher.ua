<x-app-layout>
    <div class="words-list-box">
        @foreach($wordsList as $list)
            <div class="list-item">
                <div class="list-title">
                    <a href="{{url('/words/practice/'.$list->id)}}">{{$list->words_title}}</a>
                </div>
            </div>
        @endforeach

        {{$wordsList->links()}}
    </div>
</x-app-layout>
