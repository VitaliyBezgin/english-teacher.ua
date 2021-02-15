<?php

namespace App\Providers;

use App\Events\NewFightEvent;
use App\Events\NewTheory;
use App\Listeners\FightListener;
use App\Listeners\NewTheoryCreatedListener;
use Illuminate\Auth\Events\Registered;
use Illuminate\Auth\Listeners\SendEmailVerificationNotification;
use Illuminate\Foundation\Support\Providers\EventServiceProvider as ServiceProvider;
use Illuminate\Support\Facades\Event;

class EventServiceProvider extends ServiceProvider
{
    /**
     * The event listener mappings for the application.
     *
     * @var array
     */
    protected $listen = [
        Registered::class => [
            SendEmailVerificationNotification::class,
        ],
        NewTheory::class => [
            NewTheoryCreatedListener::class
        ],
        NewFightEvent::class => [
            FightListener::class
        ]
    ];

    /**
     * Register any events for your application.
     *
     * @return void
     */
    public function boot()
    {
        //
    }
}
