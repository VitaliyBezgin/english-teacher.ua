<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Image;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Storage;

class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     *
     * @return \Illuminate\View\View
     */
    public function create()
    {
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\RedirectResponse
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request)
    {
        $request->validate([
            'fname' => 'required|string|max:255',
            'sname' => 'required|string|max:255',
            'phone' => 'required|string|max:20',
            'photo' => 'image',
            'email' => 'required|string|email|max:255|unique:users',
            'password' => 'required|string|confirmed|min:8',
        ]);

        Auth::login($user = User::create([
            'fname' => $request->fname,
            'sname' => $request->sname,
            'phone' => $request->phone,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]));

        if(!empty($request->file('photo'))){
            try {
                Image::create([
                    'imageables_id' => $user->id,
                    'imageables_type' => User::class,
                    'image' => $request->file('photo')->getClientOriginalName()
                ]);

                $photo = $request->file('photo')->getClientOriginalName();

                $path = $request->file('photo')->storeAs(
                    'public/avatars', $photo
                );

            }catch (\Exception $exception){
                Log::info($exception->getMessage());
            }
        }

        event(new Registered($user));

        return redirect(RouteServiceProvider::HOME.Auth::id());
    }
}
