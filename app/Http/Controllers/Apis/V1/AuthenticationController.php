<?php

namespace App\Http\Controllers\Apis\V1;

use Hash;
use Exception;
use Carbon\Carbon;
use App\Models\User;
use Illuminate\Http\Request;
use App\Helpers\ResponseHelper;
use Illuminate\Routing\Controller;
use App\Mail\ForgotPasswordOTPEmail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;
use App\Http\Requests\API\Auth\LoginRequest;
use App\Http\Requests\API\Auth\LoginOtpRequest;
use App\Http\Requests\API\Auth\RegisterRequest;
use App\Http\Requests\API\Auth\ForgetPasswordRequest;
use App\Http\Requests\API\Auth\UpdatePasswordRequest;



class AuthenticationController extends Controller
{



    public function register(RegisterRequest $request)
    {
        try {
            // Create the user
            $user = User::create([
                'name' => $request->full_name,
                'username' => $request->username,
                'email' => $request->email,
                'phone_number' => $request->phone_number,
                'password' => Hash::make($request->password),
                'address' => $request->address,
                'lat' => $request->lat,
                'long' => $request->long,
                'radius' => $request->radius,
            ]);

            // Automatically log in the user after registration
            Auth::login($user);

            // Generate access token
            $accessToken = $user->createToken('authToken')->plainTextToken;

            return ResponseHelper::success([
                'user' => $user->only(['id', 'name', 'email', 'username', 'phone_number', 'address']),
                'token' => [
                    'access_token' => $accessToken,
                    'token_type' => 'Bearer',
                ]
            ], 'Registration successful!');
        } catch (\Exception $e) {
            return ResponseHelper::error('Registration failed. Please try again.', 500);
        }
    }

    //Login API
    public function loginWithEmail(LoginRequest $request)
    {
        $credentials = $request->only('identity', 'password');

        if (Auth::attempt(['email' => $credentials['identity'], 'password' => $credentials['password']])) {
            $user = Auth::user();
            $accessToken = $user->createToken('authToken')->plainTextToken;

            return ResponseHelper::success([
                'user' => $user->only(['id', 'name', 'email', 'phone_number']),
                'token' => [
                    'access_token' => $accessToken,
                    'token_type' => 'Bearer',
                ]
            ], 'Login successful!');
        }

        return ResponseHelper::error('Invalid credentials', 401);
    }

    public function loginWithPhone(LoginRequest $request)
    {
        $credentials = $request->only('identity', 'password');

        if (Auth::attempt(['phone_number' => $credentials['identity'], 'password' => $credentials['password']])) {
            $user = Auth::user();
            $accessToken = $user->createToken('authToken')->plainTextToken;

            return ResponseHelper::success([
                'user' => $user->only(['id', 'name', 'email', 'phone_number']),
                'token' => [
                    'access_token' => $accessToken,
                    'token_type' => 'Bearer',
                ]
            ], 'Login successful!');
        }

        return ResponseHelper::error('Invalid credentials', 401);
    }


    //Profile API
    public function profile()
    {
        $user = Auth::user();
        // $user->avatar_url = $user?->getFirstMediaUrl('PROFILE_PICTURE') ?? '';
        // unset($user->media);
        return ResponseHelper::success(['user' => $user], 'User Profile');
    }



    public function updatePassword(UpdatePasswordRequest $request)
    {
        $user = Auth::user();
        if (Hash::check($request->get('old_password'), $user->password)) {
            $currentUser = User::find($user->id);
            $currentUser->fill([
                'password' => Hash::make($request->get('password'))
            ])->save();

            return ResponseHelper::success(['user' => $currentUser], 'Password Updated Successfully');
        }

        return ResponseHelper::error('old password is invalid!', 500);
    }

    public function logout()
    {
        $user = Auth::user();
        if (!is_null($user)) {
            $user->currentAccessToken()->delete();
        }

        return ResponseHelper::success([], 'Logged Out');
    }


    /**
     * Store a newly created resource in storage.
     * @param LoginOtpRequest $request
     *
     */
    public function forgetPasswordWithEmail(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        $user = User::where('email', $request->email)->first();
        $otpExpirationMinutes = (int) env('OTP_EXPIRATION_MINUTES', 10);
        $otpExpiredAt = Carbon::now()->addMinutes($otpExpirationMinutes); // OTP expiration time
        if ($user) {
            $otp = random_int(1000, 9999);
            $user->fill([
                'email_code' => $otp,
                'email_code_expired_at' => $otpExpiredAt
            ])->save();

            $otpMessage = "Your OTP for App Forget password is: " . $otp . ". Please update your password within the next " . $otpExpirationMinutes . " minutes.";

            // Implement email logic here. For example:
            Mail::to($user->email)->send(new ForgotPasswordOTPEmail($otpMessage));

            return ResponseHelper::success([
                'email' => $request->email,
                'otp' => $otp,
                'otp_time' => $user->email_code_expired_at
            ], 'Forget Password OTP sent to Email');
        }

        return ResponseHelper::error('Invalid Email', 500);
    }

    public function forgetPasswordWithPhone(Request $request)
    {
        $request->validate([
            'phone_number' => 'required'
        ]);

        $user = User::where('phone_number', $request->phone_number)->first();
        $otpExpirationMinutes = (int) env('OTP_EXPIRATION_MINUTES', 10);
        $otpExpiredAt = Carbon::now()->addMinutes($otpExpirationMinutes);
        if ($user) {
            $otp = random_int(1000, 9999);
            $user->fill([
                'sms_code' => $otp,
                'sms_code_expired_at' =>   $otpExpiredAt
            ])->save();

            $otpMessage = "Your OTP for App Forget password is: " . $otp . ". Please update your password within the next " . $otpExpirationMinutes . " minutes.";

            // Implement SMS logic here. For example:
            // $sms->sendSms($user->phone_number, $otpMessage);

            return ResponseHelper::success([
                'phone_number' => $request->phone_number,
                'otp' => $otp,
                'otp_time' => $user->sms_code_expired_at
            ], 'Forget Password OTP sent to Phone');
        }

        return ResponseHelper::error('Invalid Phone Number', 500);
    }



    public function verifyOtp(Request $request)
    {
        $request->validate([
            'identity' => 'required',
            'otp' => 'required|integer',
            'type' => 'required|in:email,phone',
            'new_password' => 'required|min:6|confirmed'
        ]);

        $user = null;
        $otpField = null;
        $otpExpiredAtField = null;

        if ($request->type === 'email') {
            $user = User::where('email', $request->identity)->first();
            $otpField = 'email_code';
            $otpExpiredAtField = 'email_code_expired_at';
        } elseif ($request->type === 'phone') {
            $user = User::where('phone_number', $request->identity)->first();
            $otpField = 'sms_code';
            $otpExpiredAtField = 'sms_code_expired_at';
        }




        if ($user && $user->{$otpField} == $request->otp && Carbon::now()->lessThanOrEqualTo($user->{$otpExpiredAtField})) {
            // OTP is valid and not expired
            $user->fill([
                'password' => Hash::make($request->new_password),
                $otpField => null, // Clear OTP after verification
                $otpExpiredAtField => null // Clear OTP expiration
            ])->save();

            return ResponseHelper::success([], 'OTP verified. Password updated successfully.');
        }

        return ResponseHelper::error('Invalid OTP or OTP expired', 500);
    }


    public function saveFirebaseNotification(Request $request, FirebaseNotificationAction $action)
    {

        try {
            $request->validate([
                'fcm_token' => 'required',
            ]);

            $user = User::find(Auth::user()->id ?? 0);
            if ($user) {

                $action->deleteFcmToken([
                    'notifiable_id' => Auth::user()->id,
                    'app_id' => 83,
                ]);

                $notification = $action->saveFcmToken([
                    ...$request->all(),
                    'app_id' => 83,
                    'module_name' => 'agriculture',
                ]);


                $fcm = $user->firebaseNotifications()->save($notification);
                if ($fcm) {
                    $response = [
                        'error' => false,
                        'message' => 'Firebase Notification Token Saved Successfully',
                        'data' => $fcm
                    ];
                } else {
                    $response = [
                        'error' => true,
                        'message' => 'Firebase Notification Token Not Saved',
                        'data' => null
                    ];
                }
            }
        } catch (Exception $exception) {

            $response = [
                'error' => true,
                'message' => env('APP_DEBUG') ? $exception->getMessage() : 'Something went wrong',
                'data' => null
            ];
        }



        return $response;
    }
}
