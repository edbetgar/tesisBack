<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatDistribucionRecursoCollection;
use App\Models\AppDatDistribucionRecurso;
use Illuminate\Http\Request;

class AppDatDistribucionRecursoController extends ApiController
{
    public function __construct()
    {
        $this->model = new AppDatDistribucionRecurso();
        $this->resource = new \App\Http\Resources\Single\AppDatDistribucionRecurso($this->model);
        $this->collection = new AppDatDistribucionRecursoCollection($this->resource);
    }
}
