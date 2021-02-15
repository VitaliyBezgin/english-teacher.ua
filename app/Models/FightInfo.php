<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FightInfo extends Model
{
    use HasFactory;

    protected $table = "fights_info";

    public function fight()
    {
        return $this->belongsTo(Fight::class);
    }
}
