<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomPeriodo extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_periodo';
    protected $fillable = [
        'denominacion',
        'fecha_inicio',
        'fecha_fin'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
