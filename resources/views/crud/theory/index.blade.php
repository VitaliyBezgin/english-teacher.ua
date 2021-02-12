<x-admin.adminApp>
    <div class="container">
        @foreach ($theories as $theory)
            <a href="{{url('/theory/practice/'.$theory->practice->id)}}">{{ $theory->theory_title }}</a>
        @endforeach
    </div>

    {{ $theories->links() }}
</x-admin.adminApp>
