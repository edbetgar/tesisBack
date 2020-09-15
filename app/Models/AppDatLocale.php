<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatLocale extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_locales';
    protected $fillable = [
        'id_entidad',
        'denominacion',
        'id_dpa',
        'email',
        'direccion',
        'telefono',
        'latitud',
        'longitud',
        'descripcion',

    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function entidad()
    {
        return $this->belongsTo(AppDatEntidade::class, 'id_entidad', 'id');
    }
}
