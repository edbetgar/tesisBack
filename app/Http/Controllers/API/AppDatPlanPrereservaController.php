<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppDatPlanPrereservaCollection;
use App\Models\AppDatPlanPrereserva;

class AppDatPlanPrereservaController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatPlanPrereserva();
        $this->resource = new \App\Http\Resources\Single\AppDatPlanPrereserva($this->model);
        $this->collection = new AppDatPlanPrereservaCollection($this->resource);
    }
}
