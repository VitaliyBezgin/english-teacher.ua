<x-app-layout>
    <x-slot name="header">
        <ul>
            <li>
                <a href="{{url('theory')}}">all theory</a>
            </li>
            <li>
                <a href="{{url('theory/create')}}">theory create</a>
            </li>
        </ul>
    </x-slot>

    <div class="py-12">
        <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
            <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
                <div class="p-6 bg-white border-b border-gray-200">
                    You're logged in!
                </div>
            </div>
        </div>
    </div>
</x-app-layout>
