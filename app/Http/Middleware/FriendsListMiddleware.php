<?php

namespace App\Http\Middleware;

use Closure;
use http\Env;
use Illuminate\Http\Request;

class FriendsListMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->header('appName') == null || $request->header('appName') != 'Laravel-super-unique-name'){
            return response()->json([
                'error' => 'header \'APP_NAME\' is not valid !'
            ]);
        }
        return $next($request);
    }
}
