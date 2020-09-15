<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatPlanPrereserva extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_plan_prereserva';
    protected $fillable = [
            'id_dat_prereserva',
            'id_dat_plan_servicios'
    ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function prereserva()
    {
        return $this->belongsTo(AppDatPrereserva::class, 'id_dat_prereserva', 'id');
    }
    public function plan_servicio()
    {
        return $this->belongsTo(AppDatPlanServicio::class, 'id_dat_plan_servicios', 'id');
    }
}
