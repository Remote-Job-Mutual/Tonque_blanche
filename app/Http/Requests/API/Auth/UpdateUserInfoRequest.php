<?php

namespace App\Http\Requests\API\Auth;

use Illuminate\Foundation\Http\FormRequest;

class UpdateUserInfoRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'sometimes|string|max:255',
            'email' => 'sometimes|email|max:255',
            'date_of_birth' => 'sometimes|date',
            'address' => 'sometimes|string|max:255',
            'phone_number' => 'sometimes|string|max:15',
        ];
    }

    public function messages()
    {
        return [
            'name.string' => __('validation.custom.name.string'),
            'name.max' => __('validation.custom.name.max'),
            'email.email' => __('validation.custom.email.email'),
            'email.max' => __('validation.custom.email.max'),
            'date_of_birth.date' => __('validation.custom.date_of_birth.date'),
            'address.string' => __('validation.custom.address.string'),
            'address.max' => __('validation.custom.address.max'),
            'phone_number.string' => __('validation.custom.phone_number.string'),
            'phone_number.max' => __('validation.custom.phone_number.max'),
        ];
    }
}
