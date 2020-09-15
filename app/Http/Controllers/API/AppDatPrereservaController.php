<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use App\Http\Resources\Collection\AppDatPrereservaCollection;
use App\Models\AppDatPrereserva;
use Illuminate\Http\Request;

class AppDatPrereservaController extends ApiController
{
    //
    public function __construct()
    {
        $this->model = new AppDatPrereserva();
        $this->resource = new \App\Http\Resources\Single\AppDatPrereserva($this->model);
        $this->collection = new AppDatPrereservaCollection($this->resource);
    }
}
