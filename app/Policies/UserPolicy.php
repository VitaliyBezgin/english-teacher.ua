<?php

namespace App\Policies;

use App\Models\User;
use Illuminate\Auth\Access\HandlesAuthorization;
use Illuminate\Auth\Access\Response;

class UserPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function enterToProfile(User $user, int $id)
    {
        return $user->id === $id
                ? Response::allow()
                : Response::deny('It is not your profile ! login after logout');
    }
}
