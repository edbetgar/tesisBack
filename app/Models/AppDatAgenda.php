<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatAgenda extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_agenda';
    protected $fillable = [
        'id_dat_plan_servicio',
        'id_recurso_servicio',
        'fecha_inicio_cita',
        'id_cliente',
        'fecha_fin_cita',
        'id_usuario_wso2'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function plan_servicio()
    {
        return $this->belongsTo(AppDatPlanServicio::class, 'id_dat_plan_servicio', 'id');
    }

    public function recurso_servicio()
    {
        return $this->belongsTo(AppDatRecursosServicio::class, 'id_recurso_servicio', 'id');
    }

    public function cliente()
    {
        return $this->belongsTo(AppDatCliente::class, 'id_cliente', 'id');
    }
}
