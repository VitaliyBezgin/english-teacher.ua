<x-app-layout>
    <x-slot name="styles">
        @include('components.styles.bootstrap-4')
    </x-slot>
    <x-slot name="header">
        <h1>Lets go</h1>

        <div class="fighters">
            @foreach($persons_info as $person)
               <div class="person">
                   @if(isset($person->image->image))
                       <img src="{{asset('storage/avatars/'.$person->image->image)}}" alt="">
                   @else
                       <img src="{{asset('images/default.png')}}" alt="">
                   @endif
                   <span>{{$person->fname }} {{  $person->sname}}</span>
                   <div>
                       Level - {{$person->level->level}} / Points {{$person->level->points}}
                   </div>
               </div>
            @endforeach
        </div>
    </x-slot>

    <div class="py-12">
        <div class="elements w-50 m-auto words-list">
            <a href="{{url('words/getFile/'.$words['id'])}}" class="btn btn-outline-secondary mt-4 mb-4" id="getWordsFile">Get words list</a>
            <div id="words_list_id" style="display: none">{{$words['id']}}</div>
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

            <div class="message"></div>
        </div>
    </div>

    <x-slot name="scripts">
        @include('components.scripts.bootstrap-4')
        <script src="{{asset('js/word-check.js')}}"></script>
    </x-slot>
</x-app-layout>
