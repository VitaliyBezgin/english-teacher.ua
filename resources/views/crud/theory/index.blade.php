<x-admin.adminApp>
    <div class="container">
        @foreach ($theories as $theory)
            <div class="theory">
                <p>
                    {{$theory->theory_title}}
                    <br>
                    @if(isset($theory->practice->id))
                        <span>practice for {{$theory->theory_title}}</span>
                        <a href="{{url('/theory/practice/'.$theory->practice->id)}}">{{ $theory->theory_title }}</a>
                    @endif
                </p>
                <hr>
            </div>
        @endforeach
    </div>

    {{ $theories->links() }}
</x-admin.adminApp>
