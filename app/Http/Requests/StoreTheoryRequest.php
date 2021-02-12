<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreTheoryRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'theory_title' => 'required|unique:theories|min:3|max:100|string',
            'category_id' => 'required|integer',
            'header' => 'required|min:3|max:150',
            'theory_body' => 'required|min:10|max:15000'
        ];
    }
}
