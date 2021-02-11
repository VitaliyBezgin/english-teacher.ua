<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class WordList extends FormRequest
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
            'image' => 'image',
            'words_title' => 'required|unique:words|min:3|max:150',
            'category_id' => 'required|integer',
            'words' => 'required|min:10|max:2000'
        ];
    }
}
