<x-app-layout>
    <x-slot name="header">
        <ul>
            <li>
                <a href="{{url('theory')}}" class="btn btn-outline-danger">ADMIN</a>
            </li>
        </ul>
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
               <a href="">
                   <img src="{{asset('images/Vocabluary-words-language-feat.jpg')}}" alt="">
               </a>
           </div>
       </div>
   </div>
</x-app-layout>
