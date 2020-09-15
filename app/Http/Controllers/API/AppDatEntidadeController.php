<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatEntidadeCollection;
use App\Models\AppDatEntidade;
use Illuminate\Http\Request;

class AppDatEntidadeController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatEntidade();
        $this->resource = new \App\Http\Resources\Single\AppDatEntidade($this->model);
        $this->collection = new AppDatEntidadeCollection($this->resource);
    }
}
