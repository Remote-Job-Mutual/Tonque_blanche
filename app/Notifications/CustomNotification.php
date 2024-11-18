<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Notification;
use Illuminate\Notifications\Messages\DatabaseMessage;

class CustomNotification extends Notification
{
    use Queueable;

    public $title;
    public $message;
    public $iconUrl;
    public $type;

    /**
     * Create a new notification instance.
     */
    public function __construct($title, $message, $type, $iconUrl = null)
    {
        $this->title = $title;
        $this->message = $message;
        $this->type = $type;
        $this->iconUrl = $iconUrl;
    }

    /**
     * Get the notification's delivery channels.
     */
    public function via($notifiable)
    {
        return ['database'];
    }

    /**
     * Get the array representation of the notification.
     */
    public function toDatabase($notifiable)
    {
        return [
            'title' => $this->title,
            'message' => $this->message,
            'type' => $this->type,
            'icon_url' => $this->iconUrl,
            'is_read' => false,
        ];
    }
}
