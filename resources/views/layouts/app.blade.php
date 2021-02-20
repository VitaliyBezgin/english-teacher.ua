<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'Laravel') }}</title>

        {{$styles ?? ''}}

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

        <!-- Fonts -->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">

        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
        <!-- Add the slick-theme.css if you want default styling -->
        <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
        <!-- Styles -->
        <link rel="stylesheet" href="{{ asset('slick-1.8.1/slick/slick.css') }}">
        <link rel="stylesheet" href="{{ asset('slick-1.8.1/slick/slick-theme.css') }}">
        <link rel="stylesheet" href="{{ asset('css/app.css') }}">
        <link rel="stylesheet" href="{{ asset('css/main.css') }}">

        <!-- Scripts -->

    </head>
    <body class="font-sans antialiased">
        <div class="min-h-screen bg-gray-100">
            @include('layouts.navigation')
            <!-- Page Heading -->
            <header class="container m-auto">
                <div class="row justify-center">
                    {{ $header ?? ''}}
                </div>
            </header>
            <!-- Page Content -->
            <main>
                @if(session('message'))
                    <p class="alert alert-success">{{session('message')}}</p>
                @elseif(session('warning'))
                    <p class="alert alert-warning">{{session('warning')}}</p>
                @elseif(session('error'))
                    <p class="alert alert-danger">{{session('error')}}</p>
                @endif
                {{ $slot ?? ''}}
            </main>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js" integrity="sha384-q2kxQ16AaE6UbzuKqyBE9/u/KzioAlnx2maXQHiDX9d4/zp8Ok3f+M7DPm+Ib6IU" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.min.js" integrity="sha384-pQQkAEnwaBkjpqZ8RU1fF1AKtTcHJwFl3pblpTlHXybJjHpMYo79HY3hIi4NKxyj" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="{{ asset('slick-1.8.1/slick/slick.min.js') }}"></script>
        <script src="{{ asset('js/app.js') }}"></script>
        <script>
            $( function() {
                var availableTags = [];

                $.get({
                    url:'http://english-teacher.ua/get-theories',
                    success:function (res){
                        let headers = res.data;
                        for (let i = 0; i < headers.length; i++){
                            availableTags.push(headers[i].header)
                        }
                    },
                    error:function (error){
                        console.log(error)
                    }
                })

                $( "#tags" ).autocomplete({
                    source: availableTags
                });
            } );
        </script>

        //scripts slot
        {{$scripts ?? ''}}

    </body>
</html>
