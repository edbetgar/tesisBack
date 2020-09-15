<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppMensaje extends Model
{
    use SoftDeletes;
    protected $table = 'app_mensaje';
    protected $fillable = [
        'texto',
        'id_nom_tipo_mensaje'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function tipo_mensaje()
    {
        return $this->belongsTo(AppNomTipoMensaje::class, 'id_nom_tipo_mensaje', 'id');
    }
}
