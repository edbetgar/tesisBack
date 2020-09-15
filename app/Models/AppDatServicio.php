<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class AppDatServicio extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_servicios';
    protected $fillable = [
        'id_entidad',
        'id_tipo_servicio',
        'denominacion',
        'descripcion',

      ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

    public function entidad()
    {
        return $this->belongsTo(AppDatEntidade::class, 'id_entidad');
    }

}
