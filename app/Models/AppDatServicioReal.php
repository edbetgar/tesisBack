<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatServicioReal extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_servicio_real';
    protected $fillable = [
        'id_agenda',
        'id_rec',
        'fecha_real',
        'fecha_registro'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function agenda()
    {
        return $this->belongsTo(AppDatAgenda::class, 'id_agenda', 'id');
    }

    public function recurso_padre()
    {
        return $this->belongsTo(AppDatRecursoGeneral::class, 'id_rec', 'id');
    }
}
