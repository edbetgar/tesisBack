<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatTurnosServicio extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_turnos_servicios';
    protected $fillable = [
        'id_local_servicio',
        'id_turno',
        'orden'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function local_servicio()
    {
        return $this->belongsTo(AppDatLocalesServicio::class, 'id_local_servicio', 'id');
    }

    public function turno()
    {
        return $this->belongsTo(AppDatTurno::class, 'id_turno', 'id');
    }
}
