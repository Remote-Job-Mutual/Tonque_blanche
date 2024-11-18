<?php

return [
    'custom' => [
        'current_password' => [
            'required' => 'The current password is required.',
        ],
        'new_password' => [
            'required' => 'The new password is required.',
            'min' => 'The new password must be at least :min characters.',
            'confirmed' => 'The new password confirmation does not match.',
        ],

        'name' => [
            'string' => 'The name must be a valid string.',
            'max' => 'The name may not be greater than :max characters.',
        ],
        'email' => [
            'email' => 'The email must be a valid email address.',
            'max' => 'The email may not be greater than :max characters.',
        ],
        'date_of_birth' => [
            'date' => 'The date of birth must be a valid date.',
        ],
        'address' => [
            'string' => 'The address must be a valid string.',
            'max' => 'The address may not be greater than :max characters.',
        ],
        'phone_number' => [
            'string' => 'The phone number must be a valid string.',
            'max' => 'The phone number may not be greater than :max characters.',
        ],
    ],
];
