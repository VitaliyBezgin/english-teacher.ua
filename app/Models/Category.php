<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Theory;

class Category extends Model
{
    use HasFactory;

    protected $table = "categories";

    protected $fillable = [
        'category_title',
        'category_type'
    ];

    public function theories()
    {
        return $this->hasMany(Theory::class);
    }

    public function words()
    {
        return $this->hasMany(Words::class);
    }

    public function image()
    {
        return $this->morphOne(Image::class, 'imageables');
    }
}
