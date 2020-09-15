<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatAgendaCambiada extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_agenda_cambiada';
    protected $fillable = [
        'id_agenda',
        'fecha_inicio_cita',
        'fecha_inicio_cita_old',
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
}
