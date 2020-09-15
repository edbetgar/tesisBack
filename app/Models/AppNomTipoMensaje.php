<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomTipoMensaje extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_tipo_mensaje';
    protected $fillable = [
        'denominacion'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
