<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Theory extends Model
{
    use HasFactory;

    protected $table = "theories";

    public function category()
    {
        return $this->hasOne(Category::class);
    }

    public function practices()
    {
        return $this->belongsTo(Practice::class);
    }

    public function file()
    {
        return $this->morphOne(Files::class, 'fileable');
    }
}
