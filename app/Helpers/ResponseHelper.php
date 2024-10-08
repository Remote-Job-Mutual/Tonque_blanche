<?php

namespace App\Helpers;

class ResponseHelper
{
    public static function success($data = [], $message = 'Success', $code = 200)
    {
        return response()->json([
            'status' => true,
            'message' => $message,
            'data' => $data,
        ], $code);
    }

    public static function error($message = 'Error', $code = 500)
    {
        return response()->json([
            'status' => false,
            'message' => $message,
            'data' => [],
        ], $code);
    }
}
