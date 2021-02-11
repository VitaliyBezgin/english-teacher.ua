<div style="display: flex; justify-content: space-around;">
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
    </div>
    <div>
        <h4>Words</h4>
        <ul>
            <li><a href="{{url('words')}}">all words</a></li>
            <li><a href="{{url('words/create')}}">words list create</a></li>
        </ul>
    </div>
    <div>
        <h4>Categories</h4>
        <ul>
            <li><a href="{{url('categories')}}">all categories</a></li>
            <li><a href="{{url('categories/create')}}">category create</a></li>
        </ul>
    </div>
    <div>
        <h4>Practise</h4>
        <ul>
            <li><a href="{{url('practise/create')}}">practise create</a></li>
        </ul>
    </div>
</div>
<hr>

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
