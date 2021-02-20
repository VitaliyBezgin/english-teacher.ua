<x-app-layout>
    <x-slot name="header">
        <div class="container">
            <div class="row">
                <div class="con-12 alert alert-primary mt-3">
                    <span>Glad to see you again !</span>
                </div>
            </div>
        </div>
    </x-slot>

    <div>
        <div class="container">
            <div class="search-friend-form-box">
                @if ($errors->any())
                    <div class="alert alert-danger">
                        <ul>
                            @foreach ($errors->all() as $error)
                                <li>{{ $error }}</li>
                            @endforeach
                        </ul>
                    </div>
                @endif
                <form action="{{url('addFriend')}}" method="post" class="mt-3 mb-5 w-50 m-auto">
                    @csrf
                    <input type="hidden" name="user_id" value="{{Auth::id()}}">
                    <input type="hidden" name="friend_id" class="friend_id">
                    <div class="form-group d-flex mt-3">
                        <input id="friend" class="form-control" type="search" placeholder="Search new friends" required minlength="3">
                        <input type="submit" value="add" class="ml-4 btn btn-outline-primary">
                    </div>
                </form>
            </div>
            <div class="row friends-profile-output">
                <div class="box-header">My friends</div>
                @foreach($userInfo as $friend)
                    <div class="friend-profile-item">
                        <div>
                            @if(isset($friend->image->image))
                            <img src="{{asset('storage/avatars/'.$friend->image->image)}}" alt="">
                            @else
                                <img src="{{asset('images/default.png')}}" alt="">
                            @endif
                        </div>
                        <p>
                            <b>{{$friend->fname }} {{$friend->sname}}</b>
                        </p>
                        <a href="#" class="btn btn-outline-primary add-to-friends-btn" data-friend-id="{{$friend->id}}">Take a chat</a>
                    </div>
                @endforeach
            </div>
        </div>
    </div>

    <script src="{{asset('js/friendsList.js')}}"></script>
</x-app-layout>
