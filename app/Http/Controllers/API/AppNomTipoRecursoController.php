<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppNomTipoRecursoCollection;
use App\Models\AppNomTipoRecurso;

class AppNomTipoRecursoController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomTipoRecurso();
        $this->resource = new \App\Http\Resources\Single\AppNomTipoRecurso($this->model);
        $this->collection = new AppNomTipoRecursoCollection($this->resource);
    }
}
