<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatRecursoEventualCollection;
use App\Models\AppDatRecursoEventual;
use Illuminate\Http\Request;

class AppDatRecursoEventualController extends ApiController
{

    public function __construct()
    {
        $this->model = new AppDatRecursoEventual();
        $this->resource = new \App\Http\Resources\Single\AppDatRecursoEventual($this->model);
        $this->collection = new AppDatRecursoEventualCollection($this->resource);
    }
}

