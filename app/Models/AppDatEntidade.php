<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatEntidade extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_entidades';
    protected $fillable = [
        'denominacion',
        'telefono',
        'email',
        'direccion',
        'id_dpa',
        'id_organismo',
        'id_nom_branch_sector'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
    public function organismo()
    {
        return $this->belongsTo('App\Models\AppNomOrganismo', 'id_organismo', 'id');
    }
    public function nom_branch_sector()
    {
        return $this->belongsTo(AppNomBranchSector::class, 'id_nom_branch_sector', 'id');
    }
}
