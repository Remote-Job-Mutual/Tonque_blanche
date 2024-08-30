<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;
use Illuminate\Database\Eloquent\SoftDeletes;
class Service extends Model
{
    use HasFactory, HasTranslations, SoftDeletes;

    protected $fillable = ['name'];

    public $translatable = ['name'];

    public function restaurants()
    {
        return $this->belongsToMany(Restaurant::class);
    }
}
