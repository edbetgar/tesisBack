<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatDistribucionRecurso extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_distribucion_recursos';
    protected $fillable = [
        'id_recurso_servicio',
        'cantidad',
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function recurso_servicio()
    {
        return $this->belongsTo(AppDatRecursosServicio::class, 'id_recurso_servicio', 'id');
    }
}
