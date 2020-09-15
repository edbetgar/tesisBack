<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Resources\Collection\AppConfPrereservaCollection;
use App\Models\AppConfPrereserva;

class AppConfPrereservaController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppConfPrereserva();
        $this->resource = new \App\Http\Resources\Single\AppConfPrereserva($this->model);
        $this->collection = new AppConfPrereservaCollection($this->resource);
    }
}
