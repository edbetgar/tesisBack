<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatInterrupcioneCollection;
use App\Models\AppDatInterrupcione;
use Illuminate\Http\Request;

class AppDatInterrupcioneController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatInterrupcione();
        $this->resource = new \App\Http\Resources\Single\AppDatInterrupcione($this->model);
        $this->collection = new AppDatInterrupcioneCollection($this->resource);
    }
}
