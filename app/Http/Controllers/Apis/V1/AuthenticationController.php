<?php

namespace App\Http\Controllers\Apis\V1;
use App\Http\Requests\API\Auth\ForgetPasswordRequest;
use App\Http\Requests\API\Auth\LoginOtpRequest;
use App\Http\Requests\API\Auth\LoginRequest;
use App\Http\Requests\API\Auth\UpdatePasswordRequest;
use Carbon\Carbon;
use Hash;
use Illuminate\Routing\Controller;
use Illuminate\Support\Facades\Auth;
use App\Helpers\ResponseHelper;
use App\Models\User;
use Exception;



class AuthenticationController extends Controller
{


    //Login API
    public function login(LoginRequest $request)
    {
        if (Auth::attempt(['email' => $request->identity, 'password' => $request->password])) {
            $user = Auth::user();
            $user->token = [
                'access_token' => $user->createToken('authToken')->plainTextToken,
                'token_type' => 'Bearer',
            ];
            return ResponseHelper::success(['user' => $user], 'Login successful!');
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




    public function forgetPassword(ForgetPasswordRequest $request)
    {
        $user = User::where('phone_number', $request->identity)
            ->orWhere('email', $request->identity)
            ->first();

        if ($user) {
            $otp = random_int(1000, 9999);
            $user->fill([
                'otp' => $otp,
                'otp_time' => Carbon::now()
            ])->save();

            $otpMessage = "Your One-Time Password (OTP) for the  App Forget password is: " . $otp . ". Please update your password within the next 10 minutes to update your Password.";
            // $sms->sendSms($user->phone_number, $otpMessage);

            return ResponseHelper::success([
                'identity' => $request->identity,
                'otp' => $otp,
                'otp_time' => $user->otp_time
            ], 'Forget Password OTP sent to SMS');


        }


        return ResponseHelper::error('Invalid Credentials', 500);
    }
    /**
     * Store a newly created resource in storage.
     * @param LoginOtpRequest $request
     *
     */
    public function forgetPasswordOtp(LoginOtpRequest $request)
    {
        try {
            $user = User::where('otp', $request->otp)
                ->where(function ($query) use ($request) {
                    $query->where('username', '=', $request->identity)
                        ->orWhere('email', $request->identity);
                })
                ->first();

            if ($user) {
                if (!is_null($user->otp_time) || Carbon::now()->diffInMinutes($user->otp_time) < config('agriculture.otp_timeout')) {
                    $user->fill([
                        'password' => Hash::make($request->password),
                        'otp' => null,
                        'otp_time' => null
                    ])->save();

                    return ResponseHelper::success([], 'OTP Verified. Password is updated. Use your new credentials to Login.');

                } else {

                    return ResponseHelper::error('OTP Expired. Please try again.', 500);
                }
            } else {

                return ResponseHelper::error('Invalid OTP. Please try again', 500);
            }
        } catch (Exception $exception) {

            return ResponseHelper::error(env('APP_DEBUG') ? $exception->getMessage() : 'Something went wrong', 500);
        }


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
