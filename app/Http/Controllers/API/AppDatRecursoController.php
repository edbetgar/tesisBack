<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatRecursoCollection;
use App\Models\AppDatRecurso;
use Illuminate\Http\Request;

class AppDatRecursoController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatRecurso();
        $this->resource = new \App\Http\Resources\Single\AppDatRecurso($this->model);
        $this->collection = new AppDatRecursoCollection($this->resource);
    }
}
