<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatDistribucionTurno extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_distribucion_turnos';
    protected $fillable = [
        'id_turno_servicio',
        'id_prioridad',
        'cantidad'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function turno_servicio()
    {
        return $this->belongsTo(AppDatTurnosServicio::class, 'id_turno_servicio', 'id');
    }
    public function prioridad()
    {
        return $this->belongsTo(AppNomPrioridad::class, 'id_prioridad', 'id');
    }
}
