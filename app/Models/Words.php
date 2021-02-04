<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Words extends Model
{
    use HasFactory;

    protected $table = "words";

    public function category()
    {
        return $this->hasOne(Category::class);
    }

    public function file()
    {
        return $this->morphOne(Files::class, 'fileable');
    }
}
