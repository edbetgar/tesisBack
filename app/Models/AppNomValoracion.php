<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomValoracion extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_valoraciones';
    protected $fillable = [
        'denominacion_valoracion',
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

}
