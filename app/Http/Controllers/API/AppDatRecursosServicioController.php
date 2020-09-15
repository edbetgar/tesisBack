<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatRecursosServicioCollection;
use App\Models\AppDatRecursosServicio;
use Illuminate\Http\Request;

class AppDatRecursosServicioController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatRecursosServicio();
        $this->resource = new \App\Http\Resources\Single\AppDatRecursosServicio($this->model);
        $this->collection = new AppDatRecursosServicioCollection($this->resource);
    }
}
