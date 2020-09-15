<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatLocalesServicio extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_locales_servicios';
    protected $fillable = [
        'id_local',
        'id_servicio',
        'confirmacion',
        'precio',
        'dias_de_publicacion',
        'dias_de_planificacion'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function local()
    {
        return $this->belongsTo(AppDatLocale::class, 'id_local', 'id');
    }

    public function servicio()
    {
        return $this->belongsTo(AppDatServicio::class, 'id_servicio', 'id');
    }
}
