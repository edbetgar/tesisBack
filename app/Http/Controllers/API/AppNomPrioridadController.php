<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppNomPrioridadCollection;
use App\Models\AppNomPrioridad;
use Illuminate\Http\Request;

class AppNomPrioridadController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomPrioridad();
        $this->resource = new \App\Http\Resources\Single\AppNomPrioridad($this->model);
        $this->collection = new AppNomPrioridadCollection($this->resource);
    }
}
