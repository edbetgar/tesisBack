<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomPrioridad extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_prioridad';
    protected $fillable = [
        'denominacion',
        'descripcion',
        'nivel'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
