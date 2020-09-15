<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppDatAgendaPrioridadCollection;
use App\Models\AppDatAgendaPrioridad;

class AppDatAgendaPrioridadController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatAgendaPrioridad();
        $this->resource = new \App\Http\Resources\Single\AppDatAgendaPrioridad($this->model);
        $this->collection = new AppDatAgendaPrioridadCollection($this->resource);
    }
}
