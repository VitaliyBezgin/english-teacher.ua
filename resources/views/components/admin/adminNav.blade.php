<ul>
    <li> <a href="{{url('theory/create')}}" class="btn btn-success">create theory</a></li>
</ul>

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
