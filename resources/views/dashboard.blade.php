<x-app-layout>
    <x-slot name="header">
        <ul class="col-6">
            <li>
                <a href="{{url('theory')}}" class="btn btn-outline-danger">ADMIN</a>
            </li>
        </ul>
        <a class="col-6 text-right fight" href="{{url('choice/opponent')}}">
            <img src="{{asset('images/fight.png')}}" alt="" title="choice opponent">
        </a>
    </x-slot>

   <div class="choose-way-box">
       <h1>Choose lesson type</h1>
       <div class="elements">
           <div class="item theory">
               <a href="">
                   <img src="{{asset('images/theory.png')}}" alt="">
               </a>
           </div>
           <div class="item words">
               <a href="{{url('words-list')}}">
                   <img src="{{asset('images/Vocabluary-words-language-feat.jpg')}}" alt="">
               </a>
           </div>
       </div>
   </div>

    <div class="best-students">
        @foreach($bestStudents as $student)
            <div>
                <div class="item">
                    <div class="student-img-box">
                        @if($student->image != null)
                            <img src="{{asset('storage/avatars/'.$student->image)}}" alt="">
                        @else
                            <img src="{{asset('images/default.png')}}" alt="">
                        @endif
                    </div>
                    <div class="level"> level {{$student->level}}</div>
                    <mark class="level">points {{$student->points}}</mark>
                </div>
            </div>
        @endforeach
    </div>
</x-app-layout>
