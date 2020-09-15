<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatInterrupcione extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_interrupciones';
    protected $fillable = [
        'id_recurso_servicio',
        'id_turno_servicio',
        'id_motivo_interrupcion',
        'fecha_desde',
        'fecha_hasta'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function recurso_servicio()
    {
        return $this->belongsTo(AppDatRecursosServicio::class, 'id_recurso_servicio', 'id');
    }
    public function turno_servicio()
    {
        return $this->belongsTo(AppDatTurnosServicio::class, 'id_turno_servicio', 'id');
    }
    public function motivo_interrupcion()
    {
        return $this->belongsTo(AppNomMotivoInterrupcion::class, 'id_motivo_interrupcion', 'id');
    }
}
