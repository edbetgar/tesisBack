<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatPlanAgenda extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_plan_agenda';
    protected $fillable = [
        'id_dat_plan_servicio',
        'id_dat_agenda',
        'id_recurso_servicio'
   ];

    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];

}
