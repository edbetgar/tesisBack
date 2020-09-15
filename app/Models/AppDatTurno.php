<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatTurno extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_turnos';
    protected $fillable = [
        'denominacion',
        'id_entidad'
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
}
