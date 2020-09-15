<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatValoracion extends Model
{
    use SoftDeletes;

    protected $table = 'app_dat_valoraciones';
    protected $fillable = [
        'id_plan_agenda',
        'valoracion',
        'comentario',
        'id_local_servicio',
        'id_usuario_wso2'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

}
