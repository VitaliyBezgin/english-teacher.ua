<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Statistic extends Model
{
    use HasFactory;

    protected $table = "statistics";

    protected $fillable = ['statistiable_id', 'statistiable_type' ,'user_id'];

    public function statistiable()
    {
        return $this->morphTo();
    }
}
