<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppConfPrereserva extends Model
{
    use SoftDeletes;
    protected $table = 'app_conf_prereserva';
    protected $fillable = [
            'id_entidad',
            'id_local',
        'id_local_servicio',
        'tiempo'
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
    public function local()
    {
        return $this->belongsTo(AppDatLocale::class, 'id_local', 'id');
    }
    public function local_servicio()
    {
        return $this->belongsTo(AppDatLocalesServicio::class, 'id_local_servicio', 'id');
    }
}
