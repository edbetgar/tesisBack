<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatPlanServicio extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_plan_servicios';
    protected $fillable = [
        'id_turno_servicio',
        'id_nom_categoria_uso',
        'fecha_reservacion',
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
    public function nom_categoria_uso()
    {
        return $this->belongsTo(AppNomCategoriaUso::class, 'id_nom_categoria_uso', 'id');
    }
}
