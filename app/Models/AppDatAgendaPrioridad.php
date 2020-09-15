<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatAgendaPrioridad extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_agenda_prioridad';
    protected $fillable = [
        'id_agenda_prioridad',
        'id_agenda',
        'id_prioridad',
        'fecha_cambio_estado'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function agenda_prioridad()
    {
        return $this->belongsTo(AppDatAgendaPrioridad::class, 'id_agenda_prioridad', 'id');
    }
    public function agenda()
    {
        return $this->belongsTo(AppDatAgenda::class, 'id_agenda', 'id');
    }
    public function prioridad()
    {
        return $this->belongsTo(AppDatAgendaPrioridad::class, 'id_prioridad', 'id');
    }

}
