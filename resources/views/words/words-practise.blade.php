<x-app-layout>
    <x-slot name="styles">
        @include('components.styles.bootstrap-4')
        @include('components.styles.main')
    </x-slot>
    <x-slot name="header">
        <h1>Words choose</h1>
    </x-slot>

    <div class="py-12">
        <div class="elements w-50 m-auto words-list">
            @foreach(json_decode($words['words']) as $word => $val)
                <form class="word_form">
                    <div class="form-group">
                        <label for="">{{$val->translate}}</label>
                        <span class="result"></span>
                        <input type="text" required minlength="1" class="form-control answer" name="word" data-id="{{$word}}">
                    </div>
                    <input type="submit" class="answer-btn btn btn-outline-info" value="To answer">
                </form>
            @endforeach
        </div>
    </div>

    <x-slot name="scripts">
        @include('components.scripts.bootstrap-4')
        <script src="{{asset('js/word-check.js')}}"></script>
    </x-slot>
</x-app-layout>