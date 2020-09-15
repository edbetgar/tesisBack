<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatServicioCollection;
use App\Models\AppDatServicio;
use Illuminate\Http\Request;

class AppDatServicioController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatServicio();
        $this->resource = new \App\Http\Resources\Single\AppDatServicio($this->model);
        $this->collection = new AppDatServicioCollection($this->resource);
    }
}
