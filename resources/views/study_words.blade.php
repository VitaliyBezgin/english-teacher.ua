<x-app-layout>
    <x-slot name="styles">
        @include('components.styles.bootstrap-4')
    </x-slot>
    <x-slot name="header">
        <h1>Words choose</h1>
    </x-slot>

    <div class="py-12">
        <div class="elements">
            @foreach($words as $word)
                <div class="item">
                    <a href="{{url('words/practice/'.$word->id)}}">{{$word->category->category_title}}</a>
                </div>
            @endforeach
        </div>
    </div>

    <x-slot name="scripts">
        @include('components.scripts.bootstrap-4')
    </x-slot>
</x-app-layout>
