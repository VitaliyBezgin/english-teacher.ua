<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Theory extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_id',
        'theory_title',
        'header',
        'theory_video',
        'theory_body',
        'created_at',
        'updated_at'
    ];

    protected $table = "theories";

    public function category()
    {
        return $this->belongsTo(Category::class);
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
