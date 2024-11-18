<?php

return [
    'custom' => [
        'current_password' => [
            'required' => 'Se requiere la contraseña actual.',
        ],
        'new_password' => [
            'required' => 'Se requiere la nueva contraseña.',
            'min' => 'La nueva contraseña debe tener al menos :min caracteres.',
            'confirmed' => 'La confirmación de la nueva contraseña no coincide.',
        ],

        'name' => [
            'string' => 'El nombre debe ser una cadena de texto válida.',
            'max' => 'El nombre no puede tener más de :max caracteres.',
        ],
        'email' => [
            'email' => 'El correo electrónico debe ser una dirección de correo válida.',
            'max' => 'El correo electrónico no puede tener más de :max caracteres.',
        ],
        'date_of_birth' => [
            'date' => 'La fecha de nacimiento debe ser una fecha válida.',
        ],
        'address' => [
            'string' => 'La dirección debe ser una cadena de texto válida.',
            'max' => 'La dirección no puede tener más de :max caracteres.',
        ],
        'phone_number' => [
            'string' => 'El número de teléfono debe ser una cadena de texto válida.',
            'max' => 'El número de teléfono no puede tener más de :max caracteres.',
        ],

    ],
];
