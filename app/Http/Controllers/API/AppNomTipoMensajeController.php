<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppNomTipoMensajeCollection;
use App\Models\AppNomTipoMensaje;

class AppNomTipoMensajeController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomTipoMensaje();
        $this->resource = new \App\Http\Resources\Single\AppNomTipoMensaje($this->model);
        $this->collection = new AppNomTipoMensajeCollection($this->resource);
    }
}
