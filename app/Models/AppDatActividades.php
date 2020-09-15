<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatActividades extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_actividades';
    protected $fillable = [
        'denominacion',
        'descripcion'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
