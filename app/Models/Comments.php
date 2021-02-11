<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Comments extends Model
{
    use HasFactory;

    protected $table = "comments";

    public function theories()
    {
        return $this->belongsTo(Theory::class);
    }

    public function users()
    {
        return $this->belongsTo(User::class);
    }
}
