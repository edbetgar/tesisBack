<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatAgendaInterrupcion extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_agenda_interrupcion';
    protected $fillable = [
        'id_agenda',
        'id_interrupcion',
        'notificacion'
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

    public function interrupcion()
    {
        return $this->belongsTo(AppDatInterrupcione::class, 'id_interrupcion', 'id');
    }
}
