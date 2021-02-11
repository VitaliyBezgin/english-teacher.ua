<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Words extends Model
{
    use HasFactory;

    protected $table = "words";

    protected $fillable = [
        'words_title',
        'category_id',
        'words',
        'created_at',
        'updated_at'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function file()
    {
        return $this->morphOne(Files::class, 'fileable');
    }

    public function image()
    {
        return $this->morphOne(Image::class, 'imageables');
    }
}
