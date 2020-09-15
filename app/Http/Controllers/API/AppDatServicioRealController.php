<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatServicioRealCollection;
use App\Models\AppDatServicioReal;
use Illuminate\Http\Request;

class AppDatServicioRealController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatServicioReal();
        $this->resource = new \App\Http\Resources\Single\AppDatServicioReal($this->model);
        $this->collection = new AppDatServicioRealCollection($this->resource);
    }
}
