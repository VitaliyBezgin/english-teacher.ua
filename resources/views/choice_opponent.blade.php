<x-app-layout>
    <x-slot name="header">
        <ul class="col-6">
            <li>
                <a href="{{url('theory')}}" class="btn btn-outline-danger">ADMIN</a>
            </li>
        </ul>
        <a class="col-6 text-right fight" href="{{url('choice/opponent')}}">
            <img src="{{asset('images/fight.png')}}" alt="" title="choice opponent">
        </a>
    </x-slot>

    <div>
        @if(session('message'))
            <p class="text-center alert alert-warning">
                <b>{{session('message')}}</b>
                <a href="{{url(session('url'))}}" class=" btn btn-info">Continue started battle</a>
            </p>
        @endif
        <form id="opponent-form">
            <div class="form-group">
                <input type="hidden" class="striker_id" value="{{Auth::id()}}">
             <h1>Opponents</h1>
                <select name="opponent" id="opponent-select" size="10" class="form-select" required>
                    @foreach($opponents as $opp)
                        <option value="{{$opp->id}}" class="opponent-option">
                            {{$opp->fname.'  '.$opp->sname}}
                        </option>
                    @endforeach
                </select>
            </div>
            <div class="form-group">
                <h1>Words choice</h1>
                <select name="words" id="words-select" size="5" class="form-select" required>
                    @foreach($words as $word)
                        <option value="{{$word->id}}" class="word-option">{{$word->words_title}}</option>
                    @endforeach
                </select>
            </div>
            <input type="submit" class="btn d-block btn-dark mt-3" value="Fight">
        </form>
    </div>
</x-app-layout>
