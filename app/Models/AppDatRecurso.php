<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatRecurso extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_recurso';
    protected $fillable = [
        'id_tipo_recurso',
        'denominacion',
        'id_entidad'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

    public function entidad()
    {
        return $this->belongsTo(AppDatRecursosServicio::class, 'id_entidad', 'id');
    }

    public function tipo_recurso()
    {
        return $this->belongsTo(AppDatRecursosServicio::class, 'id_tipo_recurso', 'id');
    }
}
