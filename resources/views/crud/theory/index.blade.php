<x-admin.adminApp>
    <div class="container">
        @foreach ($theories as $theory)
            {{ $theory->theory_title }}
        @endforeach
    </div>

    {{ $theories->links() }}
</x-admin.adminApp>
