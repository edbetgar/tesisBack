<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatTurnosServicioCollection;
use App\Models\AppDatTurnosServicio;
use Illuminate\Http\Request;

class AppDatTurnoServicioController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatTurnosServicio();
        $this->resource = new \App\Http\Resources\Single\AppDatTurnosServicio($this->model);
        $this->collection = new AppDatTurnosServicioCollection($this->resource);
    }
}
