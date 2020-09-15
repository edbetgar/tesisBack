<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppConfConfirmacionServicioCollection;
use App\Models\AppConfConfirmacionServicio;

class AppConfConfirmacionServicioController extends ApiController
{

    public function __construct()
    {
        $this->model = new AppConfConfirmacionServicio();
        $this->resource = new \App\Http\Resources\Single\AppConfConfirmacionServicio($this->model);
        $this->collection = new AppConfConfirmacionServicioCollection($this->resource);
    }


}
