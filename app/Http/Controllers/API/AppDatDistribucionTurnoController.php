<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppDatDistribucionTurnoCollection;
use App\Models\AppDatDistribucionTurno;


class AppDatDistribucionTurnoController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatDistribucionTurno();
        $this->resource = new \App\Http\Resources\Single\AppDatDistribucionTurno($this->model);
        $this->collection = new AppDatDistribucionTurnoCollection($this->resource);
    }
}
