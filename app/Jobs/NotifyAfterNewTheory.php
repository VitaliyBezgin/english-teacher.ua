<?php

namespace App\Jobs;

use App\Events\NewTheory;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldBeUnique;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;

class NotifyAfterNewTheory implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public $users, $theory;
    public function __construct($users, $theory)
    {
        $this->users = $users;
        $this->theory = $theory;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        event(new NewTheory($this->users, $this->theory));
    }
}
