<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppNomTipoServicioCollection;
use App\Models\AppDatActividades;

class AppNomTipoServicioController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatActividades();
        $this->resource = new \App\Http\Resources\Single\AppNomTipoServicio($this->model);
        $this->collection = new AppNomTipoServicioCollection($this->resource);
    }
}
