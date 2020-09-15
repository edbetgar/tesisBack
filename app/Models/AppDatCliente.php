<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatCliente extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_cliente';
    protected $fillable = [
        'nombre',
        'apellidos',
        'ci',
        'telefono',
        'email'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
