<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Practice extends Model
{
    use HasFactory;

    protected $table = "practices";

    protected $fillable = [
        'theory_id',
        'questions',
        'created_at',
        'updated_at'
    ];

    public function theory()
    {
        return $this->hasOne(Theory::class);
    }
}
