<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppNomBranchSector extends Model
{
    use SoftDeletes;
    protected $table = 'app_nom_branch_sectors';
    protected $fillable = [
        'denominacion',
        'descripcion'
    ];
    protected $hidden = [
        'updated_at',
        'created_at',
        'deleted_at'
    ];
}
