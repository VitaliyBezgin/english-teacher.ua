<x-app-layout>
    <x-slot name="styles">
        @include('components.styles.bootstrap-4')
        @include('components.styles.main')
    </x-slot>
    <x-slot name="header">
        <h1>Practise choose</h1>
    </x-slot>
    <div class="py-12">
        <div class="elements w-50 m-auto theory-practice-main">
            <h1 class="display-3">{{$theoryPractise['theory_title']}}</h1>
            <hr>
            <h3 class="display-4 mb-3 mt-3">{{$theoryPractise['header'] ?? ''}}</h3>
            <p>
{{--               <b>{{$theoryPractise['theory_body']}}</b>--}}
            </p>
            <p class="bg-blue-50 mt-4">
                created at : {{$theoryPractise['created_at'] }}
                updated at : {{ $theoryPractise['updated_at']}}
            </p>
            <hr>
            <button type="button" id="start-practice" class="btn btn-dark">Start practising</button>
            <div id="practice_id" style="display: none">{{$theoryPractise['id']}}</div>
                <div class="exercises-box">
                    @foreach(json_decode($theoryPractise->practice['questions']) as $index => $val)
                        <form data-question-index="{{$index}}">
                            @foreach($val->options as $val_index => $option)
                                <div class="form-group">
                                    <label for="">exercise # {{$val_index}}</label>
                                    <input type="radio" value="{{$val_index}}" name="answer" data-id="{{$val_index}}" class="form-control">
                                    <span>{{$option}}</span>
                                </div>
                            @endforeach
                                <input type="submit" class="btn btn-outline-info">
                        </form>
                    @endforeach
                </div>
            <div class="message"></div>
        </div>
    </div>

    <x-slot name="scripts">
        @include('components.scripts.bootstrap-4')
        <script src="{{asset('js/practice-check.js')}}"></script>
    </x-slot>
</x-app-layout>
