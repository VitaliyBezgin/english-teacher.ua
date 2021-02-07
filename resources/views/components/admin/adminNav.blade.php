<div>
    <h4>Theory</h4>
    <ul>
        <li>
            <a href="{{url('theory')}}">all theory</a>
        </li>
        <li>
            <a href="{{url('theory/create')}}">theory create</a>
        </li>
    </ul>
    <hr>
    <h4>Words</h4>
    <ul>
        <li><a href="{{url('words')}}">all words</a></li>
        <li><a href="{{url('words/create')}}">words list create</a></li>
    </ul>
</div>

<div class="messages">
    @if(session('message'))
        @switch(session('message.status'))
            @case(session('message.status') == 'success')
            <p class="alert alert-success">{!!  session('message.text') !!}</p>
            @break
            @case(session('message.status') == 'warning')
            <p class="alert alert-warning">{!!session('message.text')!!}</p>
            @break
            @case(session('message.status') == 'error')
            <p class="alert alert-danger">{!!session('message.text')!!}</p>
            @break
        @endswitch
    @endif
</div>
