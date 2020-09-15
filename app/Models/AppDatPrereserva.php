<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatPrereserva extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_prereserva';
    protected $fillable = [
            'id',
            'id_plan_servicio',
            'cantidad'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function plan_servicio()
    {
        return $this->belongsTo(AppDatPlanServicio::class, 'id_plan_servicio', 'id');
    }
}
