<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Theory;

class Category extends Model
{
    use HasFactory;

    protected $table = "categories";

    public function theories()
    {
        return $this->belongsTo(Theory::class);
    }

    public function words()
    {
        return $this->hasMany(Words::class);
    }

    public function file()
    {
        return $this->morphOne(Files::class, 'fileable');
    }
}
