<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Mail\Mailables\Content;
use Illuminate\Mail\Mailables\Envelope;
use Illuminate\Queue\SerializesModels;

class ForgotPasswordOTPEmail extends Mailable
{
    use Queueable, SerializesModels;

    public $otpMessage;

    public function __construct($otpMessage)
    {
        $this->otpMessage = $otpMessage;
    }

    public function build()
    {
        return $this->subject('Your Password Reset OTP')
                    ->view('emails.forgot_password_otp')
                    ->with([
                        'otpMessage' => $this->otpMessage,
                    ]);
                }
}
