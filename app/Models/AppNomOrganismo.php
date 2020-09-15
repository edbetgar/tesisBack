<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomOrganismo extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_organismo';
    protected $fillable = [
        'denominacion',
        'descripcion',
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
