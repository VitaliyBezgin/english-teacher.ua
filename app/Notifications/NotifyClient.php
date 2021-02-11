<?php

namespace App\Notifications;

use App\Mail\TellNewTheory;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NotifyClient extends Notification
{
    use Queueable;

    /**
     * Create a new notification instance.
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
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        return (new MailMessage)->view(
            'mails.testMail',
            [
                'user' => $this->users['fname']. ' '.$this->users['sname'],
                'theory' => $this->theory
            ]
        );
    }
}
