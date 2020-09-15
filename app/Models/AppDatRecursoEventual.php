<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatRecursoEventual extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_recurso_eventual';
    protected $fillable = [
        'id_rec',
        'id_recurso',
        'id_turno_servicio'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function recurso_padre()
    {
        return $this->belongsTo(AppDatRecursoGeneral::class, 'id_rec', 'id');
    }

    public function recurso()
    {
        return $this->belongsTo(AppDatRecurso::class, 'id_recurso', 'id');
    }
    public function turno_servicio()
    {
        return $this->belongsTo(AppDatTurnosServicio::class, 'id_turno_servicio', 'id');
    }
}
