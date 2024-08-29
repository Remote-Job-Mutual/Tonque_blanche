<?php

namespace App\Services;

use Kreait\Firebase\Factory;
use Kreait\Firebase\Messaging\CloudMessage;
use Kreait\Firebase\Messaging\Notification;
use Kreait\Firebase\Messaging\MulticastSendReport;
use Kreait\Firebase\Exception\Messaging\MessagingException;
use Kreait\Firebase\Exception\FirebaseException;

class FirebaseService
{
    private $firebase;

    public function __construct()
    {
        $this->firebase = (new Factory)->withServiceAccount(base_path(env('FIREBASE_SERVICE')));
    }



    public function sendSinglePushNotification(array $data = [], ?string $token = null)
    {
        try {
            $messaging = $this->firebase->createMessaging();

            $message = CloudMessage::fromArray([
                'notification' => [
                    'title' => $data['title'] ?? '',
                    'body' => $data['body'] ?? $data['message'] ?? '',
                ],
                'data' => $data,
                'token' => $token,
            ]);

            $messaging->send($message);

            return response()->json(['message' => 'Notification sent successfully']);
        } catch (MessagingException | FirebaseException $e) {
            \Log::error('Notification failed: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function sendMultiplePushNotification(array $tokens = [], array $data)
    {
        try {
            $messaging = $this->firebase->createMessaging();

            $message = CloudMessage::new()
                ->withNotification(Notification::fromArray([
                    'title' => $data['title'] ?? '',
                    'body' => $data['body'] ?? '',
                ]))
                ->withData($data)
                ->withAndroidConfig([
                    'priority' => $data['priority'] ?? 'high',
                ])
                ->withApnsConfig([
                    'headers' => [
                        'apns-priority' => $data['apns-priority'] ?? '10',
                    ],
                ]);

            $report = $messaging->sendMulticast($message, $tokens);

            $successful = $report->successes()->count();
            $failed = $report->failures()->count();

            return response()->json([
                'message' => 'Notification sent successfully',
                'successful' => $successful,
                'failed' => $failed,
            ]);
        } catch (MessagingException | FirebaseException $e) {
            \Log::error('Notification failed: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function subscribeToTopic(string $topic, array $tokens)
    {
        try {
            $messaging = $this->firebase->createMessaging();
            $messaging->subscribeToTopic($topic, $tokens);

            return response()->json(['message' => 'Successfully subscribed to topic']);
        } catch (MessagingException | FirebaseException $e) {
            \Log::error('Subscription to topic failed: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function unsubscribeFromTopic(string $topic, array $tokens)
    {
        try {
            $messaging = $this->firebase->createMessaging();
            $messaging->unsubscribeFromTopic($topic, $tokens);

            return response()->json(['message' => 'Successfully unsubscribed from topic']);
        } catch (MessagingException | FirebaseException $e) {
            \Log::error('Unsubscription from topic failed: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }

    public function sendNotificationToTopic(string $topic, array $data)
    {
        try {
            $messaging = $this->firebase->createMessaging();

            $message = CloudMessage::new()
                ->withNotification(Notification::fromArray([
                    'title' => $data['title'] ?? '',
                    'body' => $data['body'] ?? '',
                ]))
                ->withData($data)
                ->withTopic($topic);

            $messaging->send($message);

            return response()->json(['message' => 'Notification sent to topic successfully']);
        } catch (MessagingException | FirebaseException $e) {
            \Log::error('Notification to topic failed: ' . $e->getMessage());
            return response()->json(['error' => $e->getMessage()], 500);
        }
    }
}
