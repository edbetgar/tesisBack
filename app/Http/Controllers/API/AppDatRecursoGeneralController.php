<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatRecursoGeneralCollection;
use App\Models\AppDatRecursoGeneral;
use Illuminate\Http\Request;

class AppDatRecursoGeneralController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatRecursoGeneral();
        $this->resource = new \App\Http\Resources\Single\AppDatRecursoGeneral($this->model);
        $this->collection = new AppDatRecursoGeneralCollection($this->resource);
    }
}
