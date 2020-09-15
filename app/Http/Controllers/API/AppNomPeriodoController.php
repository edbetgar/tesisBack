<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppNomPeriodoCollection;
use App\Models\AppNomPeriodo;
use Illuminate\Http\Request;

class AppNomPeriodoController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppNomPeriodo();
        $this->resource = new \App\Http\Resources\Single\AppNomPeriodo($this->model);
        $this->collection = new AppNomPeriodoCollection($this->resource);
    }
}
