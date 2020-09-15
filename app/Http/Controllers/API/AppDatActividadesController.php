<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatActividadesCollection;
use App\Models\AppDatActividades;
use Illuminate\Http\Request;

class AppDatActividadesController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatActividades();
        $this->resource = new \App\Http\Resources\Single\AppDatAc($this->model);
        $this->collection = new AppDatActividadesCollection($this->resource);
    }

}
