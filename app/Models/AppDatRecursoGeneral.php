<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatRecursoGeneral extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_recurso_general';
    protected $fillable = [
        'tipo'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

}
