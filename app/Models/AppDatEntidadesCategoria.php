<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class AppDatEntidadesCategoria extends Model
{
    use SoftDeletes;
    protected $table = 'app_dat_entidades_categorias';
    protected $fillable = [
        'id_entidad',
        'id_nom_categoria_uso'
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

    public function nom_categoria_uso()
    {
        return $this->belongsTo(AppNomCategoriaUso::class, 'id_nom_categoria_uso', 'id');
    }
}
