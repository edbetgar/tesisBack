<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AppConfConfirmacionServicio extends Model
{

    use SoftDeletes;

    protected $table = 'app_conf_confirmacion_servicio';
    protected $fillable = [
        'id_local_servicio',
        'id_periodo',
        'id_tiempo_desde',
        'id_tiempo_hasta',
        'id_tiempo_cancelacion',
        'tiempo_ultimo_aviso'
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

    public function periodo()
    {
        return $this->belongsTo(AppNomPeriodo::class, 'id_periodo', 'id');
    }

    public function tiempo_desde()
    {
        return $this->belongsTo(AppNomPeriodo::class, 'id_tiempo_desde', 'id');
    }

    public function tiempo_hasta()
    {
        return $this->belongsTo(AppNomPeriodo::class, 'id_tiempo_hasta', 'id');
    }

    public function tiempo_cancelacion()
    {
        return $this->belongsTo(AppNomPeriodo::class, 'id_tiempo_cancelacion', 'id');
    }


}
