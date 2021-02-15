<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Fight extends Model
{
    use HasFactory;

    protected $table = "fights";

    public function fightInfo()
    {
        return $this->hasOne(FightInfo::class);
    }
}
