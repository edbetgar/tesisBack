<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatLocalesServicioCollection;
use App\Models\AppDatLocalesServicio;
use Illuminate\Http\Request;

class AppDatLocalesServicioController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatLocalesServicio();
        $this->resource = new \App\Http\Resources\Single\AppDatLocalesServicio($this->model);
        $this->collection = new AppDatLocalesServicioCollection($this->resource);
    }
}
