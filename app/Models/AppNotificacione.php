<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNotificacione extends Model
{
    use SoftDeletes;
    protected $table = 'app_notificaciones';
    protected $fillable = [
        'id_agenda',
        'id_mensaje'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

    public function agenda()
    {
        return $this->belongsTo(AppDatAgenda::class, 'id_dat_agenda', 'id');
    }

    public function mensaje()
    {
        return $this->belongsTo(AppMensaje::class, 'id_mensaje', 'id');
    }
}
